import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/views/full_meet_view.dart';
import '../utils/utils.dart';

class RaceScreen extends ConsumerStatefulWidget {
  final FullMeetView meet;
  const RaceScreen({super.key, required this.meet});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaceScreenState();
}

class _RaceScreenState extends ConsumerState<RaceScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meet.meet.name),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'tab1'),
            Tab(text: 'tab2'),
            Tab(text: 'tab3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
              itemCount: widget.meet.events.length,
              itemBuilder: (context, index) {
                final event = widget.meet.events[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  child: ListTile(
                    title: Text(
                        '${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} ${event.discipline?.description} ${event.category?.description}'),
                    subtitle: event.athletesWithResults.isNotEmpty
                        ? Text('${event.athletesWithResults.length}')
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                      ),
                    ),
                  ),
                );
              }),
          Center(child: Text('Tab 2 Content')),
          Center(child: Text('Tab 3 Content')),
        ],
      ),
    );
  }
}
