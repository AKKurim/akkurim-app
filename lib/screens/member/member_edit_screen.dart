import 'package:ak_kurim_app/models/views/full_athlete_view.dart';
import 'package:ak_kurim_app/providers/filter_providers.dart';
import 'package:ak_kurim_app/providers/full_athlete_provider.dart';
import 'package:ak_kurim_app/services/database/drift_database.dart';
import 'package:ak_kurim_app/widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../utils/utils.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class MemberEditScreen extends ConsumerStatefulWidget {
  final bool editMode;
  final String? athleteId;
  const MemberEditScreen({super.key, required this.editMode, this.athleteId});

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
  late FullAthleteView? a;
  late String id;

  @override
  void initState() {
    super.initState();
    if (widget.editMode) {
      {
        final fullA = ref.read(fullAthletePProvider(widget.athleteId!));
        a = fullA.when(
          data: (data) => data,
          error: (error, stackTrace) => null,
          loading: () => null,
        );
        id = widget.athleteId!;
        firstName = TextEditingController(text: a?.athlete.firstName ?? '');
        lastName = TextEditingController(text: a?.athlete.lastName ?? '');
        email = TextEditingController(text: a?.athlete.email ?? '');
        phone = TextEditingController(text: a?.athlete.phone ?? '');
        street = TextEditingController(text: a?.athlete.street ?? '');
        city = TextEditingController(text: a?.athlete.city ?? '');
        zip = TextEditingController(text: a?.athlete.zip ?? '');
        note = TextEditingController(text: a?.athlete.note ?? '');
        birthNumber = TextEditingController(text: a?.athlete.birthNumber);
        status = a?.athleteStatus;
      }
    } else {
      a = null;
      id = const Uuid().v1();
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
        SnackBar(
          content: Text(AppLocalizations.of(context)!.invalidBirthNumber),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    ref.read(fullAthletePProvider(id).notifier).updateAthlete(
          athleteId: id,
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
          ean: widget.editMode ? a?.athlete.ean : null,
          clubId: widget.editMode ? a?.athlete.clubId : null,
          createdAt: widget.editMode ? a?.athlete.createdAt : DateTime.now(),
          delete: delete,
        );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(delete
            ? AppLocalizations.of(context)!.memberDeleted
            : AppLocalizations.of(context)!.memberSaved),
        backgroundColor: delete ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<AthleteStatusData> statuses =
        ref.watch(athleteStatusesProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => [],
              loading: () => [],
            );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editMember),
        actions: [
          // delete button
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!.deleteMember),
                    content: Text(
                        AppLocalizations.of(context)!.deleteMemberConfirmation),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                      TextButton(
                        onPressed: () {
                          saveMember(delete: true);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.delete),
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
