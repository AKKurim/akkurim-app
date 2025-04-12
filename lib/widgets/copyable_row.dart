import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart';

class CopyableRow extends ConsumerWidget {
  final double leftPadding;
  final String title;
  final String value;
  final String snackBarText;
  final Color snackBarColor;
  const CopyableRow({
    super.key,
    required this.leftPadding,
    required this.title,
    required this.value,
    required this.snackBarText,
    required this.snackBarColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(width: leftPadding),
        Expanded(
          child: Text(
            '$title: $value',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.copy),
          onPressed: () {
            Clipboard.setData(
              ClipboardData(text: value),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: snackBarColor,
                content: Text(
                  snackBarText,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
