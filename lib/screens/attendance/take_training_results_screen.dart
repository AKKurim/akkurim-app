import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/full_meet_view.dart';

class TakeTrainingResultsScreen extends ConsumerStatefulWidget {
  final FullMeetView meet;
  const TakeTrainingResultsScreen({super.key, required this.meet});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TakeTrainingResultsScreenState();
}

class _TakeTrainingResultsScreenState
    extends ConsumerState<TakeTrainingResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
