import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../utils/config.dart';

class ForceUpdateScreen extends StatelessWidget {
  final String currentAppVersion;
  final String minimumAppVersion;
  const ForceUpdateScreen(
      {super.key,
      required this.currentAppVersion,
      required this.minimumAppVersion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.updateRequired,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.currentVersion(currentAppVersion),
                textAlign: TextAlign.center,
              ),
              Text(
                AppLocalizations.of(context)!.minimumVersion(minimumAppVersion),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  launchUrl(Config.updateUri);
                },
                child: Text(
                  AppLocalizations.of(context)!.downloadPage,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
