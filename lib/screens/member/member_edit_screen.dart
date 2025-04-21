import 'package:ak_kurim_app/models/views/full_athlete_view.dart';
import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemberEditScreen extends ConsumerStatefulWidget {
  final bool editMode;
  final FullAthleteView? athleteView;
  const MemberEditScreen({super.key, required this.editMode, this.athleteView});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MemberEditScreenState();
}

class _MemberEditScreenState extends ConsumerState<MemberEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.athleteView?.athlete.lastName ?? ''));
    // TODO: Implement the edit screen
  }
}
