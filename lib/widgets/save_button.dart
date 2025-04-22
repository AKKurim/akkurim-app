import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class SaveButton extends StatelessWidget {
  final Function saveFunction;
  const SaveButton({
    super.key,
    required this.saveFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          onPressed: () {
            saveFunction();
          },
          child: Text(AppLocalizations.of(context)!.saveAndClose,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
        ),
      ),
    );
  }
}
