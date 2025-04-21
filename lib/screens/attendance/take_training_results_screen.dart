import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/full_meet_view.dart';
import '../../models/views/meet_event_view.dart';
import '../../models/views/simple_athlete_view.dart';
import '../../providers/meet_providers.dart';
import '../../models/views/discipline_view.dart';
import '../../providers/training_results_provider.dart';

class TakeTrainingResultsScreen extends ConsumerStatefulWidget {
  final FullMeetView meet;
  const TakeTrainingResultsScreen({super.key, required this.meet});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TakeTrainingResultsScreenState();
}

class _TakeTrainingResultsScreenState
    extends ConsumerState<TakeTrainingResultsScreen> {
  late Map<AthleteWithMeetEvents, TextEditingController> athletes;

  @override
  void initState() {
    super.initState();
    athletes = {};
    for (var athl in widget.meet.athletesWithEvents) {
      athletes[athl] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in athletes.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> saveResults() async {
    for (var entry in athletes.entries) {
      final athlete = entry.key;
      final controller = entry.value;
      final result = controller.text;
      if (result.isNotEmpty) {
        await ref
            .read(trainingResultsPProvider.notifier)
            .saveTrainingResult(athlete, result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meet.events[0].discipline?.description ?? ''),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              final athlete = athletes.keys.elementAt(index);
              return ListTile(
                title: Text(athlete.athlete.fullName),
                trailing: TextField(
                  controller: athletes[athlete],
                  decoration: const InputDecoration(
                    labelText: 'Result',
                  ),
                  keyboardType: TextInputType.number,
                ),
              );
            },
            itemCount: athletes.length,
          ),
          SaveButton(
            saveFunction: saveGroup,
          )
        ],
      ),
    );
  }
}
