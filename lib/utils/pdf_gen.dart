import 'package:pdf/pdf.dart';
import 'package:diacritic/diacritic.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../models/views/full_meet_view.dart';
// import the package for removing diacritics if needed
import '../utils/utils.dart';

Future<void> generateAndShareMeetPdf({required FullMeetView meet}) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text('Hello World'),
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
