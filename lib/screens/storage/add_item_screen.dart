import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/item_providers.dart';
import '../../services/database/drift_database.dart';
import 'package:uuid/uuid.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class AddItemScreen extends ConsumerStatefulWidget {
  const AddItemScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends ConsumerState<AddItemScreen> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  ItemTypeData? _selectedItemType;

  final TextEditingController _newItemTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<ItemTypeData> itemTypes = ref.watch(itemTypePProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => [],
          loading: () => [],
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addItem),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TextField(
              //   decoration: InputDecoration(
              //       labelText: AppLocalizations.of(context)!.itemName),
              //   controller: _itemNameController,
              //   onChanged: (value) => setState(() {}),
              // ),
              // const SizedBox(height: 12),
              // TextField(
              //   decoration: InputDecoration(
              //       labelText: AppLocalizations.of(context)!.description),
              //   controller: _descriptionController,
              //   onChanged: (value) => setState(() {}),
              // ),
              // DropdownButtonFormField<ItemTypeData>(
              //   value: _selectedItemType,
              //   onChanged: (type) => setState(() => _selectedItemType = type),
              //   items: itemTypes
              //       .map((type) => DropdownMenuItem(
              //             value: type,
              //             child: Text(type.name),
              //           ))
              //       .toList(),
              //   decoration: InputDecoration(
              //       labelText: AppLocalizations.of(context)!.itemType),
              // ),
              // const SizedBox(height: 12),
              // FilledButton(
              //   onPressed: (_itemNameController.text.isNotEmpty &&
              //           _descriptionController.text.isNotEmpty &&
              //           _selectedItemType != null)
              //       ? () {
              //           ref.read(itemProviderPProvider.notifier).updateItem(
              //               const Uuid().v1(),
              //               _itemNameController.text,
              //               _descriptionController.text,
              //               _selectedItemType!.id);
              //           FocusScope.of(context).unfocus();
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(
              //               content:
              //                   Text(AppLocalizations.of(context)!.itemCreate),
              //               duration: const Duration(seconds: 2),
              //             ),
              //           );
              //         }
              //       : null,
              //   child: Text(AppLocalizations.of(context)!.createItem),
              // ),
              // const Divider(),
              // TODO rework this screen
              // const SizedBox(height: 12),
              // Text(AppLocalizations.of(context)!.addNewItemType),
              // TextField(
              //   decoration: InputDecoration(
              //       labelText: AppLocalizations.of(context)!.newItemType),
              //   controller: _newItemTypeController,
              //   onChanged: (value) {
              //     setState(() {});
              //   },
              // ),
              // const SizedBox(height: 36),
              // FilledButton(
              //   onPressed: _newItemTypeController.text.isNotEmpty
              //       ? () {
              //           ref
              //               .read(itemTypePProvider.notifier)
              //               .addItemType(_newItemTypeController.text);
              //           FocusScope.of(context).unfocus();
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(
              //               content: Text(
              //                   AppLocalizations.of(context)!.itemTypeCreated),
              //               duration: const Duration(seconds: 2),
              //             ),
              //           );
              //         }
              //       : null,
              //   child: Text(
              //     AppLocalizations.of(context)!.createItemType,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
