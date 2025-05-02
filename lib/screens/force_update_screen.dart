import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateScreen extends StatelessWidget {
  final String currentAppVersion;
  final String minimumAppVersion;
  ForceUpdateScreen(
      {super.key,
      required this.currentAppVersion,
      required this.minimumAppVersion});

  final Uri url = Uri.parse('https://github.com/AKKurim/akkurim-app/releases');
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
                'Update Required',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Your current version: $currentAppVersion\n',
                textAlign: TextAlign.center,
              ),
              Text(
                'Minimum required version: $minimumAppVersion',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  launchUrl(url);
                },
                child: Text('Go to GitHub Releases'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
