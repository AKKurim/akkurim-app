import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ak_kurim/services/database.dart';
import 'package:ak_kurim/services/helpers.dart';
import 'package:ak_kurim/models/race_preview.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseService>(context);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: db.racesLoaded
          ? Container(
              color: Theme.of(context).colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: const <Widget>[
                    ThisMonthsRaces(),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class ThisMonthsRaces extends StatelessWidget {
  const ThisMonthsRaces({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseService>(context);
    return db.racePreviews.isNotEmpty
        ? Column(children: <Widget>[
            for (var preview in db.racePreviews)
              Column(children: <Widget>[
                // display the below container only if the previous training is not in the same day
                if ((db.racePreviews.indexOf(preview) == 0 ||
                        !Helper().isSameDay(
                            db
                                .racePreviews[
                                    db.racePreviews.indexOf(preview) - 1]
                                .timestamp
                                .toDate(),
                            preview.timestamp.toDate())) &&
                    !Helper().isBeforeToday(preview.timestamp.toDate()))
                  Container(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Helper().getCzechDayAndDate(preview.timestamp.toDate()),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                RacePreviewCard(
                  racePreview: preview,
                ),
              ])
          ])
        : SizedBox(
            height: 200,
            child: Center(
              child: Text('Žádné závody v tomto měsíci',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          );
  }
}

class RacePreviewCard extends StatelessWidget {
  final RacePreview racePreview;
  const RacePreviewCard({super.key, required this.racePreview});

  @override
  Widget build(BuildContext context) {
    //final db = Provider.of<DatabaseService>(context);
    return Card(
      elevation: 10,
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        tileColor:
            // use light blue color if the race is today, gray out races in the past
            Helper().isSameDay(DateTime.now(), racePreview.timestamp.toDate())
                ? Colors.orange[500]
                : Helper().isBeforeToday(racePreview.timestamp.toDate())
                    ? Colors.green[500]
                    : null,
        onTap: () {
          // push to take attendance screen
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RaceProfile(racePreview: racePreview),
              ));
        },
        title: Text(racePreview.name),
        subtitle: Text(racePreview.place, style: const TextStyle(fontSize: 16)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(racePreview.members.length.toString()),
            const Icon(Icons.people),
          ],
        ),
      ),
    );
  }
}

class RaceProfile extends StatelessWidget {
  final RacePreview racePreview;
  const RaceProfile({super.key, required this.racePreview});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DatabaseService>(context);
    final id = racePreview.id;
    if (!db.loadedRaces.containsKey(id)) {
      db.getRaceInfo(id: racePreview.id, place: racePreview.place);
    }

    return Scaffold(
        appBar: AppBar(
            title: Text(
                '${racePreview.place}, ${Helper().getCzechDayAndDate(racePreview.timestamp.toDate())}')),
        body: db.loadedRaces.containsKey(id)
            ? db.loadedRaces[id]!.id != ''
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Text(
                          racePreview.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: 1.8,
                          children: List.generate(
                              db.loadedRaces[id]!.racersWithDisciplines.length,
                              (index) {
                            return Center(
                              child: Card(
                                elevation: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.4),
                                  ),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      for (var line in db.loadedRaces[id]!
                                          .racersWithDisciplines[index]
                                          .split('\n'))
                                        Text(line,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold))
                                    ],
                                  )),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 16),
                        const Text('Časový harmonogram',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        for (var discipline
                            in db.loadedRaces[id]!.scheduleWithRacers)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Card(
                                elevation: 10,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    color: discipline.split('\n')[1].length > 1
                                        ?
                                        // use highlight color if the discipline has racers assigned,
                                        // otherwise use the default color
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.4)
                                        : null,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 8),
                                        child: Text(
                                          discipline.split('\n')[0],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      if (discipline.split('\n')[1].length > 1)
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 8),
                                          child: Text(
                                            discipline.split('\n')[1],
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: <Widget>[
                        Text(
                          racePreview.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 2,
                            children: List.generate(racePreview.members.length,
                                (index) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      racePreview.members[index],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );
                            })),
                        const SizedBox(height: 16),
                        const Text(
                          'Časový harmonogram nenalezen :(',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
