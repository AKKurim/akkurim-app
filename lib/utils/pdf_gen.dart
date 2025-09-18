import 'package:ak_kurim_app/models/online_db/athlete.dart';
import 'package:ak_kurim_app/models/views/meet_event_view.dart';
import 'package:pdf/pdf.dart';
import 'package:diacritic/diacritic.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import '../models/views/full_meet_view.dart';
import '../utils/utils.dart';

Future<void> generateAndShareMeetPdf(
    {required FullMeetView meet, required BuildContext context_}) async {
  var myTheme = pw.ThemeData.withFont(
    base: pw.Font.ttf(await rootBundle.load("lib/assets/Roboto-Regular.ttf")),
    bold: pw.Font.ttf(await rootBundle.load("lib/assets/Roboto-Bold.ttf")),
  );

  final pdf = pw.Document(
    theme: myTheme,
  );
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(12),
      build: (pw.Context context) {
        // Split athletes into two columns
        List<AthleteWithMeetEvents> athletes = meet.athletesWithEvents;
        athletes.sort((a, b) =>
            a.athlete.athlete.lastName.compareTo(b.athlete.athlete.lastName));
        List<AthleteWithMeetEvents> leftColumn = [];
        List<AthleteWithMeetEvents> rightColumn = [];
        for (int i = 0; i < athletes.length; i++) {
          if (i % 2 == 0) {
            leftColumn.add(athletes[i]);
          } else {
            rightColumn.add(athletes[i]);
          }
        }

        pw.Widget athleteBox(athlete) {
          return pw.Container(
            margin: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey, width: 1),
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '${athlete.athlete.athlete.lastName} ${athlete.athlete.athlete.firstName}'
                  '${athlete.events.any((e) => e.bib != null && e.bib!.isNotEmpty) ? ' (${athlete.events.firstWhere((e) => e.bib != null && e.bib!.isNotEmpty).bib})' : ''}',
                  style: athlete.events.isNotEmpty
                      ? pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 18)
                      : null,
                ),
                if (athlete.events.isNotEmpty)
                  pw.Text(
                    athlete.events
                        .map((event) =>
                            '${meet.isMultiDay ? '${TimeHelper.getWeekDayName(event.meetEvent.startAt, context_)} ' : ''}${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.shortDescription} ${event.meetEvent.phase != null && (athlete.isDoubleDiscipline(event.discipline!.id) || meet.meet.name.contains('EKAG')) ? '(${event.meetEvent.phase.replaceAll('Kvalifikace', 'Kval')})' : ''}')
                        .join('\n'),
                    style: pw.TextStyle(
                      fontSize: 16,
                      //fontWeight: pw.FontWeight.bold,
                    ),
                  ),
              ],
            ),
          );
        }

        return [
          pw.Padding(
            padding: const pw.EdgeInsets.only(left: 16),
            child: pw.Text(
              meet.meet.name,
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 8),
          if (!meet.isMultiDay)
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 16),
              child: pw.Text(
                TimeHelper.getFullDateWithTime(meet.meet.startAt, context_,
                    endTime: meet.meet.endAt),
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              ),
            ),
          if (meet.isMultiDay)
            pw.Padding(
              padding: const pw.EdgeInsets.only(left: 16),
              child: pw.Text(
                '${TimeHelper.getFullDateWithTime(meet.meet.startAt, context_)} => ${TimeHelper.getFullDateWithTime(meet.meet.endAt, context_)}',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              ),
            ),
          ...List.generate(
            leftColumn.length,
            (index) => pw.SizedBox(
              width: double.infinity,
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisSize: pw.MainAxisSize.max,
                children: [
                  pw.Expanded(
                    child: athleteBox(leftColumn[index]),
                  ),
                  pw.SizedBox(width: 8),
                  pw.Expanded(
                    child: rightColumn.length > index
                        ? athleteBox(rightColumn[index])
                        : pw.Container(),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
    ),
  );

  final destination = await getTemporaryDirectory();
  final outputFile =
      File('${destination.path}/${normalizeFileName(meet.meet.name)}.pdf');
  await outputFile.writeAsBytes(await pdf.save());

  final params = ShareParams(
    text: 'Pdf Schedule',
    files: [XFile(outputFile.path)],
  );
  final result = await SharePlus.instance.share(params);
  if (result.status == ShareResultStatus.success) {
    // delete the file after sharing
    await outputFile.delete();
  }
}

String normalizeFileName(String name) {
  // Remove diacritics and replace spaces with dashes
  return removeDiacritics(name).replaceAll(' ', '-');
}
