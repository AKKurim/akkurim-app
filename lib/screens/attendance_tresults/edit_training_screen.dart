import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/training_view.dart';
import '../../providers/training_providers.dart';
import '../../utils/utils.dart';
import '../../widgets/save_button.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class EditTrainingScreen extends ConsumerStatefulWidget {
  final String trainingId;
  final TrainingView? preloadedTraining;
  const EditTrainingScreen(
      {super.key, required this.trainingId, this.preloadedTraining});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditTrainingScreenState();
}

class _EditTrainingScreenState extends ConsumerState<EditTrainingScreen> {
  late TrainingView? _training;
  late DateTime _startAt;
  late int _duration;
  late TextEditingController _descriptionController;
  late TextEditingController _locationController;
  late TextEditingController _cancelledReasonController;

  @override
  void initState() {
    super.initState();
    _training = widget.preloadedTraining ??
        ref.watch(trainingProvider(widget.trainingId)).maybeWhen(
              orElse: () => null,
              data: (data) => data,
            );
    _startAt = _training?.training.startAt ?? DateTime.now();
    _duration = _training?.training.durationMinutes ?? 60;
    _descriptionController =
        TextEditingController(text: _training?.training.description ?? '');
    _locationController =
        TextEditingController(text: _training?.training.location ?? '');
    _cancelledReasonController =
        TextEditingController(text: _training?.training.cancelledReason ?? '');

    // Add listener to rebuild UI when cancel reason changes
    _cancelledReasonController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _locationController.dispose();
    _cancelledReasonController.dispose();
    super.dispose();
  }

  // Combined picker removed; use separate date and time pickers below.

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startAt,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    setState(() {
      _startAt = DateTime(
          date.year, date.month, date.day, _startAt.hour, _startAt.minute);
    });
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startAt),
    );
    if (time == null) return;
    setState(() {
      _startAt = DateTime(
          _startAt.year, _startAt.month, _startAt.day, time.hour, time.minute);
    });
  }

  Future<void> _save() async {
    final emptyRange = TimeHelper.emptyRange();
    await ref
        .read(trainingsPProvider(range: emptyRange).notifier)
        .saveTrainingDetails(
          training: _training!,
          startAt: _startAt,
          description: _descriptionController.text,
          durationMinutes: _duration,
          location: _locationController.text,
          cancelledReason: _cancelledReasonController.text.isEmpty
              ? null
              : _cancelledReasonController.text,
        );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(AppLocalizations.of(context)!.trainingEdited),
          backgroundColor: Colors.green),
    );
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_training == null) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.editGroup)),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editTraining),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(_training!.group.group.name),
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text(
                      TimeHelper.getFullDateWithoutTime(_startAt, context)),
                  trailing: TextButton(
                    onPressed: _pickDate,
                    child: Text(AppLocalizations.of(context)!.change),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text(TimeHelper.getMinHourFromDateTime(_startAt)),
                  trailing: TextButton(
                    onPressed: _pickTime,
                    child: Text(AppLocalizations.of(context)!.change),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.description),
                      labelText: AppLocalizations.of(context)!.content),
                  maxLines: 3,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                      icon: const Icon(Icons.timer),
                      labelText: AppLocalizations.of(context)!.duration),
                  keyboardType: TextInputType.number,
                  controller: TextEditingController(text: _duration.toString()),
                  onChanged: (v) => _duration = int.tryParse(v) ?? _duration,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.location_on),
                      labelText: AppLocalizations.of(context)!.location),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _cancelledReasonController,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      labelText: AppLocalizations.of(context)!.cancelReason,
                      hintText: AppLocalizations.of(context)!.cancelReasonHint,
                      border: _cancelledReasonController.text.isNotEmpty
                          ? const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0))
                          : null,
                      focusedBorder: _cancelledReasonController.text.isNotEmpty
                          ? const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0))
                          : null),
                  maxLines: 2,
                ),
                if (_cancelledReasonController.text.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning, color: Colors.red, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.cancelWarningMessage,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 80),
              ],
            ),
          ),
          SaveButton(saveFunction: _save),
        ],
      ),
    );
  }
}
