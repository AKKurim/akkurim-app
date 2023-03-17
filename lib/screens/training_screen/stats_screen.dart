import 'package:flutter/material.dart';
import 'package:ak_kurim/services/database.dart';
import 'package:provider/provider.dart';
import 'package:ak_kurim/services/helpers.dart';
import 'package:ak_kurim/models/group.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseService>(context);
    final Group? group = db.statsSelectedGroup;
    final key = group == null ? 'all' : group.id;
    const double borderRad = 14.5;
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: db.statsLoaded
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          const Icon(Icons.groups),
                          const SizedBox(width: 10),
                          Text(
                            group == null ? 'Všechny skupiny' : group.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      trailing: Text(
                          'Poslední aktualizace\n ${Helper().getDayMonthYear(db.statsLastUpdated)} - ${Helper().getHourMinute(db.statsLastUpdated)} ',
                          style: const TextStyle(fontSize: 10)),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Vyberte skupinu pro zobrazení statistik',
                                  ),
                                  content: SizedBox(
                                    width: 300,
                                    height: 300,
                                    child: ListView.builder(
                                        itemCount: db.allGroups.length + 1,
                                        itemBuilder: (context, index) {
                                          if (index == 0) {
                                            return ListTile(
                                              title: const Text(
                                                'Všechny skupiny dohromady',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                              onTap: () {
                                                db.statsSelectedGroup = null;
                                                db.refresh();
                                                Navigator.pop(context);
                                              },
                                            );
                                          }
                                          return ListTile(
                                            title: Text(
                                              db.allGroups[index - 1].name,
                                            ),
                                            onTap: () {
                                              db.statsSelectedGroup =
                                                  db.allGroups[index - 1];
                                              db.refresh();
                                              Navigator.pop(context);
                                            },
                                          );
                                        }),
                                  ),
                                ));
                      },
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 76),
                        itemCount: group == null
                            ? db.members.length
                            : group.memberIDs.length + group.trainerIDs.length,
                        itemBuilder: (context, index) {
                          final member = group == null
                              ? db.members[index]
                              : index >= group.trainerIDs.length
                                  ? db.getMemberFromID(group.memberIDs[
                                      index - group.trainerIDs.length])
                                  : db.getMemberFromID(db
                                      .getTrainerFromID(group.trainerIDs[index])
                                      .memberID);
                          final int present =
                              member.attendanceCount[key]['present'];
                          final int total =
                              member.attendanceCount[key]['total'];
                          final int excused =
                              member.attendanceCount[key]['excused'];
                          final int absent =
                              member.attendanceCount[key]['absent'];
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline))),
                            child: ListTile(
                              title: Text(member.fullName),
                              subtitle:
                                  Text('$present/$excused/$absent ($total)'),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                              trailing: total != 0
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            width: 140,
                                            height: 30,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  flex: present /
                                                      total *
                                                      100 ~/
                                                      1,
                                                  child: Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: const Radius
                                                                .circular(
                                                            borderRad),
                                                        bottomLeft: const Radius
                                                                .circular(
                                                            borderRad),
                                                        topRight: excused ==
                                                                    0 &&
                                                                absent == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                        bottomRight: excused ==
                                                                    0 &&
                                                                absent == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                      ),
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: excused /
                                                      total *
                                                      100 ~/
                                                      1,
                                                  child: Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: present == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                        bottomLeft: present == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                        topRight: absent == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                        bottomRight: absent == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                      ),
                                                      color: Colors.yellow,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex:
                                                      absent / total * 100 ~/ 1,
                                                  child: Container(
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: present == 0 &&
                                                                excused == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                        bottomLeft: present ==
                                                                    0 &&
                                                                excused == 0
                                                            ? const Radius
                                                                    .circular(
                                                                borderRad)
                                                            : Radius.zero,
                                                        topRight: const Radius
                                                                .circular(
                                                            borderRad),
                                                        bottomRight:
                                                            const Radius
                                                                    .circular(
                                                                borderRad),
                                                      ),
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    )
                                  : SizedBox(
                                      width: 140,
                                      height: 30,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            flex: 100,
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(borderRad),
                                                ),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ); //
                        },
                      ),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
