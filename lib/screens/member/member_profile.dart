import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/full_athlete_provider.dart';
import '../../providers/filter_providers.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../../utils/utils.dart';
import '../../widgets/copyable_row.dart';
import '../../services/auth/auth_service.dart';
import '../../models/auth/auth_state.dart';
import '../../models/auth/role_enum.dart';
import '../../models/views/result_view.dart';

class MemberProfile extends ConsumerWidget {
  final String athleteId;
  final int initialIndex;
  const MemberProfile(
      {super.key, required this.athleteId, required this.initialIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullAthlete = ref.watch(fullAthletePProvider(athleteId));
    final allStatuses = ref.watch(athleteStatusesProvider);
    final AuthState? authState = ref.watch(authServiceProvider);

    return DefaultTabController(
      length: 3,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(fullAthlete.maybeWhen(
              data: (athlete) => athlete.fullName, orElse: () => '')),
          actions: [
            IconButton(
                onPressed: () {
                  if (!authState!.roles.contains(RoleEnum.admin)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(AppLocalizations.of(context)!.notAllowed),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    return;
                  }
                  context.push(
                    '/member/$athleteId/edit',
                  );
                },
                icon: const Icon(Icons.edit)),
          ],
        ),
        body: fullAthlete.when(
          data: (athlete) {
            return allStatuses.when(
                data: (statuses) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      children: [
                        // CircleAvatar(
                        //   radius: 50,
                        //   // TODO implement image loading
                        //   child: Text(
                        //     '${athlete.athlete.lastName[0]}${athlete.athlete.firstName[0]}',
                        //     style: const TextStyle(fontSize: 40),
                        //   ),
                        //   //backgroundImage: NetworkImage(athlete.athlete.imageUrl),
                        // ),
                        Text(
                          '${athlete.birthDate.day}. ${athlete.birthDate.month}. ${athlete.birthDate.year}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          "(${athlete.athlete.clubId?.toUpperCase()})",
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
                        TabBar(tabs: [
                          Tab(
                            text: AppLocalizations.of(context)!.contacts,
                          ),
                          Tab(
                            text: AppLocalizations.of(context)!.signUpForms,
                          ),
                          Tab(
                            text: 'PB',
                          ),
                        ]),
                        Expanded(
                          child: TabBarView(children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  CopyableRow(
                                    leftPadding: 8,
                                    title: AppLocalizations.of(context)!.email,
                                    value: athlete.athlete.email ?? '',
                                    snackBarText: AppLocalizations.of(context)!
                                        .emailCopied,
                                    snackBarColor: Colors.green,
                                  ),
                                  CopyableRow(
                                    leftPadding: 8,
                                    title: AppLocalizations.of(context)!.phone,
                                    value: athlete.athlete.phone ?? '',
                                    snackBarText: AppLocalizations.of(context)!
                                        .phoneCopied,
                                    snackBarColor: Colors.green,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)!
                                              .guardianContacts,
                                          style: TextStyle(fontSize: 22)),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          // TODO implement
                                        },
                                        icon: const Icon(Icons.add_circle),
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  for (final guardian in athlete.guardians) ...[
                                    Row(
                                      children: [
                                        const SizedBox(width: 8),
                                        Text(
                                            '${guardian.lastName} ${guardian.firstName}',
                                            style: TextStyle(fontSize: 20)),
                                      ],
                                    ),
                                    CopyableRow(
                                      leftPadding: 16,
                                      title:
                                          AppLocalizations.of(context)!.email,
                                      value: guardian.email,
                                      snackBarText:
                                          AppLocalizations.of(context)!
                                              .emailCopied,
                                      snackBarColor: Colors.green,
                                    ),
                                    CopyableRow(
                                      leftPadding: 16,
                                      title:
                                          AppLocalizations.of(context)!.phone,
                                      value: guardian.phone,
                                      snackBarText:
                                          AppLocalizations.of(context)!
                                              .phoneCopied,
                                      snackBarColor: Colors.green,
                                    ),
                                    const SizedBox(height: 16),
                                  ]
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [const Placeholder()],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for (final ResultView result
                                      in fullAthlete.value!.pbs().values) ...[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        '${result.discipline.description} - ${result.athleteMeetEvent.result} - (${result.meet.startAt.year})',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ],
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
      ),
    );
  }
}
