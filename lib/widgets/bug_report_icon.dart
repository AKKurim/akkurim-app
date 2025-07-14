import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'package:ak_kurim_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BugReportIcon extends StatelessWidget {
  const BugReportIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.bug_report),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.bugReport),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  launchUrl(Config.bugReportUri);
                },
                child: Text(AppLocalizations.of(context)!.open),
              ),
            ],
          ),
        );
      },
    );
  }
}
