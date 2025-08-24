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
    pw.Page(
      build: (pw.Context context) {
        // Split athletes into two columns
        final athletes = meet.athletesWithEvents;
        final half = (athletes.length / 2).ceil();
        final leftColumn = athletes.sublist(0, half);
        final rightColumn = athletes.sublist(half);

        pw.Widget athleteBox(athlete) {
          return pw.Container(
            margin: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey, width: 1),
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '${athlete.athlete.athlete.lastName} ${athlete.athlete.athlete.firstName}',
                  style: athlete.events.isNotEmpty
                      ? pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 18)
                      : null,
                ),
                if (athlete.events.isNotEmpty)
                  pw.Text(
                    athlete.events
                        .map((event) =>
                            '${meet.isMultiDay ? '${TimeHelper.getWeekDayName(event.meetEvent.startAt, context_)} ' : ''}${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.description} ${event.meetEvent.phase != null && athlete.isDoubleDiscipline(event.discipline!.id) ? '(${event.meetEvent.phase})' : ''}')
                        .join('\n'),
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
              ],
            ),
          );
        }

        return pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: leftColumn.map(athleteBox).toList(),
              ),
            ),
            pw.SizedBox(width: 12),
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: rightColumn.map(athleteBox).toList(),
              ),
            ),
          ],
        );
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
    print('PDF shared successfully');
    // delete the file after sharing
    await outputFile.delete();
    print('File deleted after sharing');
  }
}

String normalizeFileName(String name) {
  // Remove diacritics and replace spaces with dashes
  return removeDiacritics(name).replaceAll(' ', '-');
}
