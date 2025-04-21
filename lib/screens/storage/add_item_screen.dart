import 'package:ak_kurim_app/models/views/item_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/item_providers.dart';
import '../../services/database/drift_database.dart';
import 'package:uuid/uuid.dart';

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
          error: (error, stackTrace) =>
              throw Exception('Error loading item types: $error, $stackTrace'),
          loading: () => [],
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Item Name'),
                controller: _itemNameController,
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                controller: _descriptionController,
                onChanged: (value) => setState(() {}),
              ),
              DropdownButtonFormField<ItemTypeData>(
                value: _selectedItemType,
                onChanged: (type) => setState(() => _selectedItemType = type),
                items: itemTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.name),
                        ))
                    .toList(),
                decoration: InputDecoration(labelText: 'Item Type'),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: (_itemNameController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty &&
                        _selectedItemType != null)
                    ? () {
                        ref.read(itemProviderPProvider.notifier).updateItem(
                            const Uuid().v1(),
                            _itemNameController.text,
                            _descriptionController.text,
                            _selectedItemType!.id);
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Item created successfully'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    : null,
                child: Text('Create Item'),
              ),
              const Divider(),
              const SizedBox(height: 12),
              Text('Add New Item Type'),
              TextField(
                decoration: InputDecoration(labelText: 'New Item Type'),
                controller: _newItemTypeController,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 36),
              FilledButton(
                onPressed: _newItemTypeController.text.isNotEmpty
                    ? () {
                        ref
                            .read(itemTypePProvider.notifier)
                            .addItemType(_newItemTypeController.text);
                        FocusScope.of(context).unfocus();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Item type created successfully'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    : null,
                child: Text('Create Item Type'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
