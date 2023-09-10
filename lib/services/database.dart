import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ak_kurim/models/member.dart';
import 'package:ak_kurim/models/trainer.dart';
import 'package:ak_kurim/models/user.dart';
import 'package:ak_kurim/models/group.dart';
import 'package:ak_kurim/models/training.dart';
import 'package:ak_kurim/models/race_preview.dart';
import 'package:ak_kurim/models/race_info.dart';
import 'package:ak_kurim/models/race_result.dart';
import 'package:ak_kurim/services/helpers.dart';
import 'package:dio/dio.dart';

class DatabaseService extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String homeUrl = 'https://coral-app-nfbvh.ondigitalocean.app/';

  bool dataOnline = false;

  bool trainingForNextWeek = false;

  bool _isUpdating = false;
  bool get isUpdating => _isUpdating;

  List<Member> _members = <Member>[]; // List of members
  List<Member> get members => _members;

  List<Member> _filteredMembers = <Member>[]; // List of filtered members
  List<Member> get filteredMembers => _filteredMembers;
  String searchString = '';
  bool filterBornYear = false;
  bool ascendingOrder = true;

  Trainer _trainer = Trainer(
      id: '', memberID: '', firstName: '', lastName: '', email: '', phone: '');
  Trainer get currentTrainer => _trainer;
  List<Trainer> _trainers = <Trainer>[];
  List<Trainer> get allTrainers => _trainers;

  List<Trainer> _filteredTrainers = <Trainer>[];
  List<Trainer> get filteredTrainers =>
      _filteredTrainers; // List of filtered trainers

  List<Group> _allGroups = <Group>[];
  List<Group> get allGroups => _allGroups;
  List<Group> _trainerGroups = <Group>[];
  List<Group> get trainerGroups => _trainerGroups;

  List<Training> _trainerTrainings = <Training>[];
  List<Training> get trainerTrainings => _trainerTrainings;
  bool repeatTraining = false;
  DateTime endDate = Helper().midnight(DateTime.now());

  bool nextWeekLoaded = false;
  List<Training> nextWeekTrainings = <Training>[];

  DateTime statsLastUpdated = DateTime.now().subtract(const Duration(days: 1));
  bool statsLoaded = false;
  Group?
      statsSelectedGroup; // selected group for stats if null all time stats are shown

  bool isChangedTrainingGroup = false;

  Map<String, List<RacePreview>> racePreviews = <String, List<RacePreview>>{};
  bool? racesLoaded = false;
  DateTime racesMonth = DateTime.now();
  Map<String, RaceInfo> loadedRaces = <String, RaceInfo>{};
  Map<String, RaceResult> loadedRaceResults = <String, RaceResult>{};

  void refresh() {
    notifyListeners();
  }

  // member functions
  Member getMemberFromID(String id) {
    final Member member = _members.firstWhere((member) {
      return member.id == id;
    },
        orElse: () => Member(
            id: "",
            born: "born",
            gender: "gender",
            firstName: "firstName",
            lastName: "lastName",
            birthNumber: "birthNumber",
            street: "street",
            city: "city",
            zip: 0,
            borrowedItems: {'tretry': '', 'dres': ''},
            isSignedUp: {},
            isPaid: {},
            attendanceCount: {},
            racesCount: {}));
    return member;
  }

  String getMemberfullNameFromID(String id) {
    final Member member = getMemberFromID(id);
    return member.fullName;
  }

  // update member (set - it will overwrite the whole document)
  Future<void> updateMember(Member member) async {
    await db.collection('members').doc(member.id).set(member.toMap());
  }

  // delete member, be careful with this function
  Future<void> deleteMember(Member member) async {
    _members.removeWhere((element) => element.id == member.id);
    _filteredMembers.removeWhere((element) => element.id == member.id);
    await db.collection('members').doc(member.id).delete();
  }

  // TODO load PBs from server

  // trainer functions
  Trainer getTrainerFromID(String id) {
    final Trainer trainer = _trainers.firstWhere((trainer) {
      return trainer.id == id;
    },
        orElse: () => Trainer(
            id: "",
            memberID: "memberID",
            firstName: "Náhradní trenér",
            lastName: "",
            email: "email",
            phone: "phone"));
    return trainer;
  }

  String getTrainerFullNameFromID(String id) {
    final Trainer trainer = getTrainerFromID(id);
    return trainer.fullName;
  }

  bool isTrainer(String id) {
    final bool isTrainer = _trainers.any((trainer) {
      return trainer.id == id;
    });
    return isTrainer;
  }

  // filter trainers by name and remove trainers which are already in the group
  void filterTrainers({required String filter, required Group group}) {
    if (filter == '') {
      // clone the list
      _filteredTrainers = List<Trainer>.from(_trainers);
    } else {
      _filteredTrainers = _trainers
          .where((Trainer trainer) =>
              trainer.firstName.toLowerCase().contains(filter.toLowerCase()) ||
              trainer.lastName.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }

    _filteredTrainers.removeWhere((Trainer trainer) {
      return group.trainerIDs.contains(trainer.id);
    });
    notifyListeners();
  }

  // download functions
  Future<void> downloadTrainers({required User user, bool init = false}) async {
    db.collection('trainers').get().then(
      (QuerySnapshot querySnapshot) {
        _trainers = querySnapshot.docs.map((QueryDocumentSnapshot doc) {
          return Trainer.fromFirestore(doc);
        }).toList();
        _trainer = _trainers.firstWhere((trainer) {
          return trainer.email == user.email;
        },
            orElse: () => Trainer(
                id: '',
                memberID: '',
                firstName: '',
                lastName: '',
                email: '',
                phone: ''));
        if (init) {
          downloadGroups(init: init);
        }
      },
    );
  }

  // download all groups which contain the current trainer in the trainersIDs list
  Future<void> downloadGroups({bool init = false}) async {
    db.collection("groups").get().then(
      (QuerySnapshot querySnapshot) {
        _allGroups = querySnapshot.docs.map((QueryDocumentSnapshot doc) {
          return Group.fromFirestore(doc);
        }).toList();
        _trainerGroups = _allGroups.where((group) {
          return group.trainerIDs.contains(_trainer.id);
        }).toList();
        if (init) {
          downloadMembers(init: init);
        }
      },
    );
  }

  // download all trainings which are in the last 30 days and in the future for the current trainer
  Future<void> downloadTrainings() async {
    await db
        .collection('trainings')
        .where('groupID',
            whereIn: _trainerGroups.isNotEmpty
                ? _trainerGroups.map((group) => group.id)
                : [''])
        .where('date',
            isGreaterThan: Timestamp.fromDate(
                DateTime.now().subtract(const Duration(days: 30))))
        //.where('date',
        //  isLessThan:
        //    DateTime.now().add(Duration(days: 30)).toIso8601String()) idk if this is needed to speed up the query
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        _trainerTrainings = querySnapshot.docs.map((QueryDocumentSnapshot doc) {
          return Training.fromFirestore(doc);
        }).toList();

        // add the trainings where the current trainer is the substitute trainer
        db
            .collection('trainings')
            .where('substituteTrainerID', isEqualTo: _trainer.id)
            .where('date',
                isGreaterThan: Timestamp.fromDate(
                    DateTime.now().subtract(const Duration(days: 30))))
            //.where('date',
            //  isLessThan:
            //    DateTime.now().add(Duration(days: 30)).toIso8601String()) idk if this is needed to speed up the query
            .get()
            .then(
          (QuerySnapshot querySnapshot) {
            _trainerTrainings
                .addAll(querySnapshot.docs.map((QueryDocumentSnapshot doc) {
              return Training.fromFirestore(doc);
            }).toList());
            // sort trainings by date
            sortTrainingsByDate();
          },
        ).then((value) {
          getNextWeekTrainings();
          nextWeekLoaded = true;
        });
      },
    );
  }

  // for statistics
  Future<List<dynamic>> downloadAllPastTrainings() async {
    List allTrainings = [];
    await db
        .collection('trainings')
        .where('date',
            isLessThan: Timestamp.fromDate(
                DateTime.now())) // get all trainings which are in the past
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        allTrainings = querySnapshot.docs.map((QueryDocumentSnapshot doc) {
          return Training.fromFirestore(doc);
        }).toList();
      },
    );
    return allTrainings;
  }

  Future<void> downloadMembers({bool forceUpdate = false, bool init = false}) {
    // Get members from Firestore
    if (_isUpdating && !forceUpdate) {
      return Future<void>.value();
    }
    db.collection('members').get().then((QuerySnapshot querySnapshot) {
      _members = querySnapshot.docs.map((QueryDocumentSnapshot doc) {
        return Member.fromFirestore(doc);
      }).toList();
      // sort members by last name
      _members.sort((Member a, Member b) => a.lastName.compareTo(b.lastName));
      filterMembers(filter: '');
    });
    if (init) {
      downloadTrainings();
    }
    return Future<void>.value();
  }

  void filterMembers({required String filter, Group? group, bool? sort}) {
    if (filter == '') {
      // clone the list
      _filteredMembers = List<Member>.from(_members);
    } else {
      _filteredMembers = _members
          .where((Member member) =>
              member.firstName.toLowerCase().contains(filter.toLowerCase()) ||
              member.lastName.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }

    if (sort == true && filterBornYear) {
      if (ascendingOrder) {
        _filteredMembers
            .sort((Member a, Member b) => a.bornYear.compareTo(b.bornYear));
      } else {
        _filteredMembers
            .sort((Member a, Member b) => b.bornYear.compareTo(a.bornYear));
      }
    }

    if (group != null) {
      _filteredMembers.removeWhere((Member member) {
        return group.memberIDs.contains(member.id);
      });
    }
    notifyListeners();
  }

  // initial data for the app (members, trainers, groups, trainings) - only for the first time
  // use the functions above to update the data
  Future<void> initializeData(User user) async {
    _isUpdating = true;
    db.settings = const Settings(persistenceEnabled: true);
    dataOnline = false;
    // download everything from Firestore
    await downloadTrainers(
        user: user,
        init:
            true); // download trainers and groups and members and trainings for the current trainer (init = true)
    // get last update of stats time from Firestore
    await db
        .collection('stats')
        .doc('lastUpdate')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data()! as Map<String, dynamic>;
        Timestamp date = data['lastUpdate'];
        statsLastUpdated = date.toDate();
        dataOnline = !documentSnapshot.metadata.isFromCache;
      }
    });
    _isUpdating = false;
    notifyListeners();

    // get current races within this month from api
    downloadCurrentRaces();

    if (!statsLoaded) {
      updateStats();
    }
  }

  // group functions - create, update, delete
  Group getGroupFromID(String id) {
    final Group group = _allGroups.firstWhere((group) {
      return group.id == id;
    },
        orElse: () => Group(
            id: "",
            name: "Skupina",
            trainerIDs: <String>[],
            memberIDs: <String>[]));
    return group;
  }

  void sortGroupMemberIDs(Group group) {
    group.memberIDs.sort((a, b) {
      final Member memberA = getMemberFromID(a);
      final Member memberB = getMemberFromID(b);
      return memberA.lastName.compareTo(memberB.lastName);
    });
  }

  String getGroupNameFromID(String id) {
    final Group group = getGroupFromID(id);
    return group.name;
  }

  Future<void> createGroup(Group group) async {
    sortGroupMemberIDs(group);
    _trainerGroups.add(group);
    _allGroups.add(group);
    await db.collection('groups').doc(group.id).set(group.toMap());
  }

  Future<void> updateGroup(Group group) async {
    //_trainerGroups[
    //    _trainerGroups.indexWhere((element) => element.id == group.id)] = group;
    sortGroupMemberIDs(group);
    await db.collection('groups').doc(group.id).update(group.toMap());
  }

  Future<void> deleteGroup(Group group) async {
    _trainerGroups.removeWhere((element) => element.id == group.id);
    _allGroups.removeWhere((element) => element.id == group.id);
    await db.collection('groups').doc(group.id).delete();
  }

  void sortTrainingsByDate() {
    _trainerTrainings
        .sort((Training a, Training b) => a.timestamp.compareTo(b.timestamp));
  }

  // training functions - create, update, delete etc
  Future<void> createTraining(Training training) async {
    // prepare the attendance list
    Group group = getGroupFromID(training.groupID);
    training.attendanceKeys = []; // just to be sure to have an empty list
    training.attendanceValues = []; // true = present, false = absent
    // add all trainers to the attendance list
    for (String trainerID in group.trainerIDs) {
      training.attendanceKeys.add(trainerID);
      training.attendanceValues.add(false);
    }
    if (training.substituteTrainerID != '') {
      training.attendanceKeys.add(training.substituteTrainerID);
      training.attendanceValues.add(false);
    }
    // add all members to the attendance list
    for (String memberID in group.memberIDs) {
      training.attendanceKeys.add(memberID);
      training.attendanceValues.add(false);
    }

    _trainerTrainings.add(training);
    sortTrainingsByDate();
    getNextWeekTrainings();
    await db.collection('trainings').doc(training.id).set(training.toMap());
  }

  Future<void> updateTraining(Training training, bool groupChange) async {
    if (groupChange) {
      training.attendanceTaken = false;
      Group group = getGroupFromID(training.groupID);
      training.attendanceKeys = [];
      training.attendanceValues = [];
      // add all trainers to the attendance list
      for (String trainerID in group.trainerIDs) {
        training.attendanceKeys.add(trainerID);
        training.attendanceValues.add(false);
      }
      if (training.substituteTrainerID != '') {
        training.attendanceKeys.add(training.substituteTrainerID);
        training.attendanceValues.add(false);
      }
      // add all members to the attendance list
      for (String memberID in group.memberIDs) {
        training.attendanceKeys.add(memberID);
        training.attendanceValues.add(false);
      }
    }

    //_trainerTrainings[_trainerTrainings
    //    .indexWhere((element) => element.id == training.id)] = training;
    sortTrainingsByDate();
    getNextWeekTrainings();
    await db.collection('trainings').doc(training.id).update(training.toMap());
  }

  Future<void> updateAttendance(Training training) async {
    await db.collection('trainings').doc(training.id).update(training.toMap());
  }

  Future<void> deleteTraining(Training training) async {
    _trainerTrainings.removeWhere((element) => element.id == training.id);
    getNextWeekTrainings();
    await db.collection('trainings').doc(training.id).delete();
  }

  void getNextWeekTrainings() {
    nextWeekTrainings = [];
    for (Training training in _trainerTrainings) {
      if (Helper().isWithinNextWeek(training.timestamp.toDate())) {
        nextWeekTrainings.add(training);
      }
    }
    notifyListeners();
  }

  // update stats for each member
  Future<void> updateStats() async {
    DateTime now = DateTime.now();
    if (Helper().midnight(now) == Helper().midnight(statsLastUpdated)) {
      statsLoaded = true;
      notifyListeners();
      return;
    }

    downloadAllPastTrainings().then((allTrainings) {
      for (Member member in _members) {
        member.attendanceCount = {
          'all': {'present': 0, 'absent': 0, 'excused': 0, 'total': 0}
        };
        for (Group group in _allGroups) {
          if (group.memberIDs.contains(member.id) ||
              group.trainerIDs
                  .map((e) => getTrainerFromID(e).memberID)
                  .contains(member.id)) {
            member.attendanceCount[group.id] = {
              'present': 0,
              'absent': 0,
              'excused': 0,
              'total': 0
            };
          }
        }
      } // reset the attendance count above
      // se the attendance count
      for (Training training in allTrainings) {
        for (var pair in IterableZip(
            [training.attendanceKeys, training.attendanceValues])) {
          String id = pair[0];
          bool? present = pair[1];

          if (isTrainer(id)) {
            id = getTrainerFromID(id).memberID;
          }
          Member member = getMemberFromID(id);

          if (!member.attendanceCount.containsKey(training.groupID)) {
            member.attendanceCount[training.groupID] = {
              'present': 0,
              'absent': 0,
              'excused': 0,
              'total': 0
            };
          }
          if (!member.attendanceCount.containsKey('all')) {
            member.attendanceCount['all'] = {
              'present': 0,
              'absent': 0,
              'excused': 0,
              'total': 0
            };
          }

          String key = '';
          if (present == null) {
            key = 'excused';
          } else {
            key = present ? 'present' : 'absent';
          }
          member.attendanceCount[training.groupID][key]++;
          member.attendanceCount[training.groupID]['total']++;
          member.attendanceCount['all'][key]++;
          member.attendanceCount['all']['total']++;
        }
      }
      for (Member member in _members) {
        updateMember(member);
      }

      statsLoaded = true;
      statsLastUpdated = now;
      notifyListeners();
      db
          .collection('stats')
          .doc('lastUpdate')
          .set({'lastUpdate': Timestamp.fromDate(statsLastUpdated)});
    });
  }

  Future<void> downloadCurrentRaces(
      {bool manual = false, String yearMonth = ""}) async {
    if (manual) {
      racesLoaded = false;
      notifyListeners();
    }

    if (yearMonth == "") {
      yearMonth = Helper().getYearMonth(DateTime.now());
    }

    Map<String, dynamic> data = {};
    try {
      var pulled = db.collection('races').doc(yearMonth).get();
      data = (await pulled).data() as Map<String, dynamic>;
      if (data.isEmpty) {
        throw Exception();
      }
    } catch (e) {
      racesLoaded = null;
      notifyListeners();
      return;
    }

    racePreviews[yearMonth] = [];
    for (Map<String, dynamic> each in data["races"]) {
      racePreviews[yearMonth]!.add(RacePreview.fromMap(each));
    }

    racesLoaded = true;
    notifyListeners();
  }

  Future<void> changeRaceMonth(int diff) async {
    // if it is january 2022 and dif is -1, block it (min month is january 2023)
    if (racesMonth.year == 2022 && racesMonth.month == 1 && diff == -1) {
      return;
    }
    // max month is current month
    if (racesMonth.year == DateTime.now().year &&
        racesMonth.month == DateTime.now().month &&
        diff == 1) {
      return;
    }

    // add diff months to the current month;
    racesMonth = DateTime(racesMonth.year, racesMonth.month + diff, 15);
    String yearMonth = Helper().getYearMonth(racesMonth);

    if (loadedRaces.containsKey(yearMonth) &&
        yearMonth != Helper().getYearMonth(DateTime.now())) {
      return;
    }

    downloadCurrentRaces(yearMonth: yearMonth, manual: true);
    return;
  }

  Future<void> getRaceInfo({
    required String id,
    required String place,
    String clubname = "Kuřim", // default clubname
  }) async {
    String apiUrl = '$homeUrl/api/race/$id/$clubname';
    bool error = false;
    String errorCode = '';

    Dio dio = Dio();
    Response response = await dio.get(apiUrl).catchError((e) {
      // check if it is connection error
      // check if error is code 500
      if (e.response?.statusCode == 500) {
        errorCode = '500';
      }

      error = true;
      return Response(
          data: {}, statusCode: 0, requestOptions: RequestOptions(path: ''));
    });

    if (!error) {
      db.collection('raceInfo').doc(id).set(response.data);
    }

    Map<String, dynamic> data = {};
    try {
      db.settings = const Settings(persistenceEnabled: true);
      var pulled = db.collection('raceInfo').doc(id).get();
      data = (await pulled).data() as Map<String, dynamic>;
    } catch (e) {
      RaceInfo raceInfo = RaceInfo.empty(error: errorCode);
      loadedRaces[id] = raceInfo;
      notifyListeners();
      return;
    }

    data['place'] = place;
    RaceInfo raceInfo = RaceInfo.fromMap(data);
    loadedRaces[id] = raceInfo;
    notifyListeners();
    return;
  }

  Future<void> getRaceResult({
    required String id,
    required String place,
    String clubname = "Kuřim", // default clubname
  }) async {
    // try to pull from firestore
    try {
      db.settings = const Settings(persistenceEnabled: true);
      var pulled = db.collection('raceResult').doc(id).get();
      Map<String, dynamic> data = (await pulled).data() as Map<String, dynamic>;
      if (data.isEmpty) {
        throw Exception();
      }
      data['place'] = place;
      RaceResult raceResult = RaceResult.fromMap(data);
      loadedRaceResults[id] = raceResult;
      notifyListeners();
      return;
    } catch (e) {
      // do nothing, try to pull from api instead below
    }

    String apiUrl = '$homeUrl/api/results/$id/$clubname';
    bool error = false;
    String errorCode = '';

    Dio dio = Dio();
    Response response = await dio.get(apiUrl).catchError((e) {
      // check if it is connection error
      // check if error is code 500
      if (e.response?.statusCode == 500) {
        errorCode = '500';
      }

      error = true;
      return Response(
          data: {}, statusCode: 0, requestOptions: RequestOptions(path: ''));
    });

    if (!error) {
      db.collection('raceResult').doc(id).set(response.data);
    }

    Map<String, dynamic> data = {};
    try {
      db.settings = const Settings(persistenceEnabled: true);
      var pulled = db.collection('raceResult').doc(id).get();
      data = (await pulled).data() as Map<String, dynamic>;
    } catch (e) {
      RaceResult raceResult = RaceResult.empty(error: errorCode);
      loadedRaceResults[id] = raceResult;
      notifyListeners();
      return;
    }

    data['place'] = place;
    RaceResult raceResult = RaceResult.fromMap(data);
    loadedRaceResults[id] = raceResult;
    notifyListeners();
    return;
  }
}
