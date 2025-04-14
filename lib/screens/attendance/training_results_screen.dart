import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../../providers/meet_providers.dart';
import '../../models/views/discipline_view.dart';

class TrainingResultsScreen extends ConsumerWidget {
  const TrainingResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final List<DisciplineView> disciplines = ref
        .watch(allDisciplinesProvider)
        .when(
          data: (data) => data,
          error: (error, stackTrace) =>
              throw Exception('Error loading disciplines: $error, $stackTrace'),
          loading: () => [],
        );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Training Results'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor.bar(
            isFullScreen: false,
            suggestionsBuilder: (context, controller) {
              return disciplines
                  .where((discipline) =>
                      '${discipline.discipline.description} ${discipline.type?.description ?? ''} ${discipline.discipline.shortDescription}'
                          .toLowerCase()
                          .contains(controller.text.toLowerCase()))
                  .map((discipline) {
                return ListTile(
                  title: Text(discipline.discipline.description),
                  subtitle: Text(
                    discipline.type?.name ?? 'No type',
                  ),
                  onTap: () {
                    controller.closeView(discipline.discipline.description);
                    FocusScope.of(context).unfocus();
                  },
                );
              }).toList();
            },
          ),
        ));
  }
}
