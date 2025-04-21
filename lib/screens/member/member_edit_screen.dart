import 'package:ak_kurim_app/models/views/full_athlete_view.dart';
import 'package:ak_kurim_app/providers/filter_providers.dart';
import 'package:ak_kurim_app/providers/full_athlete_provider.dart';
import 'package:ak_kurim_app/services/database/drift_database.dart';
import 'package:ak_kurim_app/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/app_settings_provider.dart';
import 'package:uuid/uuid.dart';
import '../../utils/utils.dart';

class MemberEditScreen extends ConsumerStatefulWidget {
  final bool editMode;
  final FullAthleteView? athleteView;
  const MemberEditScreen({super.key, required this.editMode, this.athleteView});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MemberEditScreenState();
}

class _MemberEditScreenState extends ConsumerState<MemberEditScreen> {
  late final TextEditingController firstName;
  late final TextEditingController lastName;
  late final TextEditingController email;
  late final TextEditingController phone;
  late final TextEditingController street;
  late final TextEditingController city;
  late final TextEditingController zip;
  late final TextEditingController note;
  late final TextEditingController birthNumber;
  late AthleteStatusData? status;

  @override
  void initState() {
    super.initState();
    if (widget.editMode) {
      {
        final a = widget.athleteView!.athlete;
        firstName = TextEditingController(text: a.firstName);
        lastName = TextEditingController(text: a.lastName);
        email = TextEditingController(text: a.email ?? '');
        phone = TextEditingController(text: a.phone ?? '');
        street = TextEditingController(text: a.street);
        city = TextEditingController(text: a.city);
        zip = TextEditingController(text: a.zip);
        note = TextEditingController(text: a.note ?? '');
        birthNumber = TextEditingController(text: a.birthNumber);
        status = widget.athleteView!.athleteStatus;
      }
    } else {
      birthNumber = TextEditingController();
      firstName = TextEditingController();
      lastName = TextEditingController();
      email = TextEditingController();
      phone = TextEditingController();
      street = TextEditingController();
      city = TextEditingController();
      zip = TextEditingController();
      note = TextEditingController();
      status = null;
    }
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
    street.dispose();
    city.dispose();
    zip.dispose();
    note.dispose();
    super.dispose();
  }

  void saveMember({bool delete = false}) {
    String birthNumberStr = birthNumber.text.replaceAll('/', '');
    if (!Utils.validateBirthNumber(birthNumberStr) ||
        (email.text.isNotEmpty && !email.text.contains('@'))) {
      // show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid birth number or email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final athleteId =
        widget.editMode ? widget.athleteView!.athlete.id : const Uuid().v1();
    ref.read(fullAthletePProvider(athleteId).notifier).updateAthlete(
          athleteId: athleteId,
          firstName: firstName.text,
          lastName: lastName.text,
          email: email.text,
          phone: phone.text,
          street: street.text,
          city: city.text,
          zip: zip.text,
          birthNumber: birthNumberStr,
          note: note.text,
          statusId: status!.id,
          ean: widget.editMode ? widget.athleteView!.athlete.ean : null,
          clubId: widget.editMode ? widget.athleteView!.athlete.clubId : null,
          createdAt: widget.editMode
              ? widget.athleteView!.athlete.createdAt
              : DateTime.now(),
          delete: delete,
        );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Member saved'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<AthleteStatusData> statuses =
        ref.watch(athleteStatusesProvider).when(
              data: (data) => data,
              error: (error, stackTrace) =>
                  throw Exception('Error loading athlete statuses: $error'),
              loading: () => [],
            );

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Member'),
        actions: [
          // delete button
          IconButton(
            onPressed: () {
              // TODO implement delete member
              // show dialog to confirm delete
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Member'),
                    content: const Text('Are you sure you want to delete?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          saveMember(delete: true);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              !widget.editMode
                  ? TextField(
                      controller: birthNumber,
                      decoration:
                          const InputDecoration(labelText: 'Birth Number'),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                          controller: firstName,
                          decoration:
                              const InputDecoration(labelText: 'First Name'))),
                  const SizedBox(width: 12),
                  Expanded(
                      child: TextField(
                          controller: lastName,
                          decoration:
                              const InputDecoration(labelText: 'Last Name'))),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                  controller: email,
                  decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 12),
              TextField(
                  controller: phone,
                  decoration: const InputDecoration(labelText: 'Phone')),
              const SizedBox(height: 12),
              TextField(
                  controller: street,
                  decoration: const InputDecoration(labelText: 'Street')),
              const SizedBox(height: 12),
              TextField(
                  controller: city,
                  decoration: const InputDecoration(labelText: 'City')),
              const SizedBox(height: 12),
              TextField(
                  controller: zip,
                  decoration: const InputDecoration(labelText: 'ZIP')),
              const SizedBox(height: 12),
              TextField(
                  controller: note,
                  decoration: const InputDecoration(labelText: 'Note'),
                  maxLines: 2),
              const SizedBox(height: 12),
              // dropdown for status
              DropdownButtonFormField<AthleteStatusData>(
                value: status,
                onChanged: (AthleteStatusData? value) {
                  setState(() {
                    status = value;
                  });
                  print(value);
                },
                items: statuses
                    .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                    .toList(),
                decoration: const InputDecoration(labelText: 'Status'),
              ),
            ],
          ),
          SaveButton(saveFunction: saveMember),
        ],
      ),
    );
  }
}
