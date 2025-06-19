import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/item_view.dart';
import '../services/database/drift_database.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';
import '../services/network/sync_service.dart';
import 'dart:convert';
import '../utils/utils.dart';
import '../services/database/companion_builder_map.dart';
import './simple_athletes_provider.dart';

part 'item_providers.g.dart';

@riverpod
class ItemProviderP extends _$ItemProviderP {
  @override
  Stream<List<ItemView>> build() async* {
    final db = ref.read(dbProvider);
    final query = (db.select(db.item)
          ..where(
            (tbl) => tbl.deletedAt.isNull(),
          )
          ..orderBy(
            [
              (tbl) => OrderingTerm(
                    expression: tbl.name,
                    mode: OrderingMode.asc,
                  ),
            ],
          ))
        .join(
      [
        leftOuterJoin(
            db.itemType, db.itemType.id.equalsExp(db.item.itemTypeId)),
      ],
    );
    final allAthletes = await ref.watch(simpleAthletesPProvider.future);

    yield* query.watch().map((rows) {
      final grouped = groupBy(rows, (row) => row.readTable(db.item).id);

      return grouped.entries.map((entry) {
        final item = entry.value.first.readTable(db.item);
        final itemType = entry.value.first.readTable(db.itemType);
        if (item.athleteId != null) {
          final athlete = allAthletes.firstWhereOrNull(
              (athlete) => athlete.athlete.id == item.athleteId);
          if (athlete != null) {
            return ItemView(
              item: item,
              itemType: itemType,
              athlete: athlete,
            );
          }
        }

        return ItemView(
          item: item,
          itemType: itemType,
        );
      }).toList();
    });
  }

  Future<void> updateItem(
      String id, String name, String description, String itemTypeId,
      {String? athleteId}) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    // try to find existing item
    final existingItem = await db.select(db.item).getSingleOrNull();
    final updated = await db.into(db.item).insertReturning(
          mode: InsertMode.insertOrReplace,
          ItemCompanion(
            id: Value(id),
            name: Value(name),
            description: Value(description),
            // TODO when images are implemented, update this
            image: Value(''),
            count: Value(1),
            itemTypeId: Value(itemTypeId),
            athleteId: Value(athleteId),
            createdAt: existingItem != null
                ? Value(existingItem.createdAt)
                : Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            deletedAt: Value(null),
          ),
        );

    await sync.addToSyncQueue(
      '/sync/item',
      'post',
      json.encode({
        'data': [Utils.convertMapKeysToSnakeCase(updated.toJson())],
        'primary_keys': ['id'],
        'table': 'item',
      }),
    );
  }

  Future<void> deleteItem(ItemData item) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    var itemToDelete = Utils.convertMapKeysToSnakeCase(item.toJson());
    itemToDelete['deleted_at'] = DateTime.now().toUtc().toIso8601String();
    itemToDelete['updated_at'] = DateTime.now().toUtc().toIso8601String();
    itemToDelete['created_at'] = item.createdAt.toUtc().toIso8601String();

    await db
        .into(db.item)
        .insertOnConflictUpdate(buildItemCompanion(itemToDelete));

    await sync.addToSyncQueue(
      '/sync/item',
      'post',
      json.encode({
        'data': [itemToDelete],
        'primary_keys': ['id'],
        'table': 'item',
      }),
    );
  }
}

@riverpod
class ItemTypeP extends _$ItemTypeP {
  @override
  Stream<List<ItemTypeData>> build() async* {
    final db = ref.read(dbProvider);
    yield* db.select(db.itemType).watch().map((rows) {
      return rows.map((row) => row).toList();
    });
  }

  Future<void> addItemType(String name) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final new_ = await db.into(db.itemType).insertReturning(
          mode: InsertMode.insertOrReplace,
          ItemTypeCompanion(
            id: Value(Uuid().v1()),
            name: Value(name),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            deletedAt: Value(null),
          ),
        );

    await sync.addToSyncQueue(
      '/sync/item_type',
      'post',
      json.encode({
        'data': [Utils.convertMapKeysToSnakeCase(new_.toJson())],
        'primary_keys': ['id'],
        'table': 'item_type',
      }),
    );
  }
}
