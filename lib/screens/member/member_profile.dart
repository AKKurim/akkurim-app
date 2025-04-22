import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/full_athlete_provider.dart';
import '../../providers/filter_providers.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../../utils/utils.dart';
import '../../widgets/copyable_row.dart';
import 'member_edit_screen.dart';
import '../../services/auth/auth_service.dart';
import '../../models/auth/auth_state.dart';
import '../../models/auth/role_enum.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class MemberProfile extends ConsumerWidget {
  final String athleteId;
  const MemberProfile({super.key, required this.athleteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullAthlete = ref.watch(fullAthletePProvider(athleteId));
    final allStatuses = ref.watch(athleteStatusesProvider);
    final AuthState? authState = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.memberProfile),
        actions: [
          IconButton(
              onPressed: () {
                if (authState!.role != RoleEnum.admin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(AppLocalizations.of(context)!.notAllowed),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberEditScreen(
                      editMode: true,
                      athleteView: fullAthlete.maybeWhen(
                          orElse: () => null,
                          data: (athlete) {
                            return athlete;
                          }),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: fullAthlete.when(
        data: (athlete) {
          return allStatuses.when(
              data: (statuses) {
                DateTime birthDate =
                    Utils.parseBirthNumber(athlete.athlete.birthNumber);
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          // TODO implement image loading

                          child: Text(
                            '${athlete.athlete.lastName[0]}${athlete.athlete.firstName[0]}',
                            style: const TextStyle(fontSize: 40),
                          ),
                          //backgroundImage: NetworkImage(athlete.athlete.imageUrl),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${athlete.athlete.lastName} ${athlete.athlete.firstName}',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${birthDate.day}. ${birthDate.month}. ${birthDate.year}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.status,
                                style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 8),
                            DropdownMenu(
                              inputDecorationTheme: InputDecorationTheme(
                                filled: true,
                                fillColor: Utils.getStatusBGColor(
                                    athlete.athleteStatus.name),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).dividerColor,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              textStyle: TextStyle(
                                color: Utils.getStatusFGColor(
                                    athlete.athleteStatus.name),
                              ),
                              dropdownMenuEntries: statuses
                                  .map((status) => DropdownMenuEntry(
                                        value: status.id,
                                        label: Utils.getStatusName(
                                            status.name, context),
                                        labelWidget: Text(
                                          Utils.getStatusName(
                                              status.name, context),
                                          style: TextStyle(
                                            color: Utils.getStatusFGColor(
                                                status.name),
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                            Utils.getStatusBGColor(status.name),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              initialSelection: athlete.athleteStatus.id,
                              onSelected: (String? statusId) {
                                ref
                                    .read(fullAthletePProvider(athleteId)
                                        .notifier)
                                    .updateAthleteStatus(athleteId,
                                        statusId ?? athlete.athleteStatus.id);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.contacts,
                                style: TextStyle(fontSize: 22)),
                          ],
                        ),
                        CopyableRow(
                          leftPadding: 8,
                          title: AppLocalizations.of(context)!.email,
                          value: athlete.athlete.email ?? '',
                          snackBarText:
                              AppLocalizations.of(context)!.emailCopied,
                          snackBarColor: Colors.green,
                        ),
                        CopyableRow(
                          leftPadding: 8,
                          title: AppLocalizations.of(context)!.phone,
                          value: athlete.athlete.phone ?? '',
                          snackBarText:
                              AppLocalizations.of(context)!.phoneCopied,
                          snackBarColor: Colors.green,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(AppLocalizations.of(context)!.guardianContacts,
                                style: TextStyle(fontSize: 22)),
                          ],
                        ),
                        for (final guardian in athlete.guardians) ...[
                          Row(
                            children: [
                              const SizedBox(width: 8),
                              Text('${guardian.lastName} ${guardian.firstName}',
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                          CopyableRow(
                            leftPadding: 16,
                            title: AppLocalizations.of(context)!.email,
                            value: guardian.email,
                            snackBarText:
                                AppLocalizations.of(context)!.emailCopied,
                            snackBarColor: Colors.green,
                          ),
                          CopyableRow(
                            leftPadding: 16,
                            title: AppLocalizations.of(context)!.phone,
                            value: guardian.phone,
                            snackBarText:
                                AppLocalizations.of(context)!.phoneCopied,
                            snackBarColor: Colors.green,
                          ),
                          const SizedBox(height: 16),
                        ]
                      ],
                    ),
                  ),
                );
              },
              error: (error, stack) => Text('Error: $error'),
              loading: () {
                return const Center(child: CircularProgressIndicator());
              });
        },
        error: (error, stack) => Center(child: Text('Error: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
