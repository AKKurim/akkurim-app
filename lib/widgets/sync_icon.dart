import 'package:connectivity_plus/connectivity_plus.dart';
import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/network/temp.dart';
import '../providers/app_settings_provider.dart';

class SyncIcon extends ConsumerWidget {
  const SyncIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncServiceProvider);
    final userSettings = ref.watch(appSettingsPProvider);

    return switch (syncState) {
      AsyncData(:final value) => Builder(builder: (context) {
          bool useMobileData = switch (userSettings) {
            AsyncData(:final value) => value.useMobileData,
            _ => false,
          };
          if (value.connectivityResult == ConnectivityResult.none) {
            return IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('No internet connection'),
                      content: Text('Last sync: ${value.lastSyncedAt}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Badge.count(
                count: value.toSync,
                child: const Icon(
                  Icons.cloud_off,
                  color: Colors.red,
                ),
              ),
            );
          }
          if (value.connectivityResult == ConnectivityResult.mobile &&
              !useMobileData) {
            return IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Mobile data disabled'),
                      content: Text(
                          'You have connection but mobile data is disabled in settings\nLast sync: ${value.lastSyncedAt}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Badge.count(
                count: value.toSync,
                child: const Icon(
                  Icons.cloud_off,
                  color: Colors.orange,
                ),
              ),
            );
          }
          if (value.isUploading || value.isDownloading) {
            return IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Syncing...'),
                      content: Text('Last sync: ${value.lastSyncedAt}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Badge.count(
                count: value.toSync,
                child: value.isUploading
                    ? const Icon(
                        Icons.cloud_upload,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.cloud_download,
                        color: Colors.blue,
                      ),
              ),
            );
          }
          return value.toSync == 0
              ? IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Last sync'),
                          content: Text(
                              'Everything up to date\n${value.lastSyncedAt}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.cloud_done,
                    color: Colors.green,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Unknown state'),
                          content: Text(
                              'Last sync: ${value.lastSyncedAt}\nTo sync: ${value.toSync} isUploading: ${value.isUploading} isDownloading: ${value.isDownloading} isUploading: ${value.isUploading} connectivityResult: ${value.connectivityResult}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.warning,
                    color: Colors.yellow,
                  ),
                );
        }),
      AsyncError(:final error, :final stackTrace) => IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Something went very wrong'),
                  content: Text('$error\n$stackTrace'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.warning,
            color: Colors.red,
          ),
        ),
      _ => IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.question_mark,
            color: Colors.white,
          ),
        ),
    };
  }
}
