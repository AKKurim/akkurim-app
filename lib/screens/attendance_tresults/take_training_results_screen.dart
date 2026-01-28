import 'package:ak_kurim_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/full_meet_view.dart';
import '../../models/views/meet_event_view.dart';
import '../../providers/training_results_provider.dart';
import '../../widgets/save_button.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class TakeTrainingResultsScreen extends ConsumerStatefulWidget {
  final String meetId;
  final FullMeetView? preloadedMeet;
  const TakeTrainingResultsScreen(
      {super.key, required this.meetId, this.preloadedMeet});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TakeTrainingResultsScreenState();
}

class _TakeTrainingResultsScreenState
    extends ConsumerState<TakeTrainingResultsScreen> {
  late Map<AthleteWithMeetEvents, TextEditingController> athletes;
  FullMeetView? _meet;

  @override
  void initState() {
    super.initState();
    _meet = widget.preloadedMeet ??
        ref
            .read(trainingResultsPProvider(preloadedMeet: widget.preloadedMeet))
            .maybeWhen(
              data: (meets) =>
                  meets.firstWhere((m) => m.meet.id == widget.meetId),
              orElse: () => null,
            );

    athletes = {};
    for (AthleteWithMeetEvents athl in _meet?.athletesWithEvents ?? []) {
      athletes[athl] = TextEditingController(text: athl.events[0].result ?? '');
    }
  }

  @override
  void dispose() {
    for (var controller in athletes.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void saveResults() {
    for (var entry in athletes.entries) {
      final athlete = entry.key;
      final controller = entry.value;
      final result = controller.text;
      if (result.isNotEmpty) {
        ref
            .read(trainingResultsPProvider(preloadedMeet: widget.preloadedMeet)
                .notifier)
            .saveTrainingResult(athlete.athlete.athlete.id,
                athlete.events[0].meetEvent, result);
      }
    }
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.resultsSaved),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_meet?.meet.name} - ${TimeHelper.getDayMonthYear(
          _meet?.meet.startAt ?? DateTime.now(),
        )}'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              final athlete = athletes.keys.elementAt(index);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                child: ListTile(
                  title: Text(athlete.athlete.fullName),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  subtitle: Text(
                    athlete.events[0].discipline?.description ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: TextField(
                      controller: athletes[athlete],
                      decoration: const InputDecoration(
                        labelText: 'Result',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              );
            },
            itemCount: athletes.length,
          ),
          SaveButton(
            saveFunction: saveResults,
          )
        ],
      ),
    );
  }
}
