import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../providers/filter_providers.dart';
import '../providers/trainer_provider.dart';
import '../screens/member/member_profile.dart';
import '../utils/utils.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../services/auth/auth_service.dart';

class AthleteListView extends HookConsumerWidget {
  const AthleteListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    final simpleAthlete = ref.watch(filteredAthletesProvider);
    final List trainerAthleteIds = ref.watch(trainerPProvider).when(
        data: (data) => data.map((trainer) {
              return trainer.simpleAthlete.athlete.id;
            }).toList(),
        error: (error, stackTrace) => [],
        loading: () => []);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: simpleAthlete.maybeWhen(orElse: () {
        return Center(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: ListTile(
                  // title: ShimmerWidget.rectangular(height: 20),
                  // subtitle: ShimmerWidget.rectangular(height: 16),
                  // trailing: ShimmerWidget.rectangular(height: 16, width: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }, data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final athlete = data[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberProfile(
                      athleteId: athlete.athlete.id,
                    ),
                  ),
                ),
                title: Text(
                  '${athlete.fullName} (${Utils.parseBirthNumber(athlete.athlete.birthNumber).year.toString()}) ${athlete.athlete.clubId == auth.tenant?.substring(2) ? "" : "⚠️"}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: trainerAthleteIds.contains(athlete.athlete.id)
                    ? Text(
                        AppLocalizations.of(context)!.trainer,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    : null,
                trailing: Chip(
                  label: Text(
                      Utils.getStatusName(athlete.athleteStatus.name, context)),
                  backgroundColor:
                      Utils.getStatusBGColor(athlete.athleteStatus.name),
                  labelStyle: TextStyle(
                    color: Utils.getStatusFGColor(athlete.athleteStatus.name),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
