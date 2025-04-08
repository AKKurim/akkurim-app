// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $AppSettingTable extends AppSetting
    with TableInfo<$AppSettingTable, AppSettingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _localeMeta = const VerificationMeta('locale');
  @override
  late final GeneratedColumn<String> locale = GeneratedColumn<String>(
      'locale', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, locale, themeMode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_setting';
  @override
  VerificationContext validateIntegrity(Insertable<AppSettingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('locale')) {
      context.handle(_localeMeta,
          locale.isAcceptableOrUnknown(data['locale']!, _localeMeta));
    } else if (isInserting) {
      context.missing(_localeMeta);
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    } else if (isInserting) {
      context.missing(_themeModeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      locale: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}locale'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
    );
  }

  @override
  $AppSettingTable createAlias(String alias) {
    return $AppSettingTable(attachedDatabase, alias);
  }
}

class AppSettingData extends DataClass implements Insertable<AppSettingData> {
  final int id;
  final String locale;
  final String themeMode;
  const AppSettingData(
      {required this.id, required this.locale, required this.themeMode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['locale'] = Variable<String>(locale);
    map['theme_mode'] = Variable<String>(themeMode);
    return map;
  }

  AppSettingCompanion toCompanion(bool nullToAbsent) {
    return AppSettingCompanion(
      id: Value(id),
      locale: Value(locale),
      themeMode: Value(themeMode),
    );
  }

  factory AppSettingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingData(
      id: serializer.fromJson<int>(json['id']),
      locale: serializer.fromJson<String>(json['locale']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'locale': serializer.toJson<String>(locale),
      'themeMode': serializer.toJson<String>(themeMode),
    };
  }

  AppSettingData copyWith({int? id, String? locale, String? themeMode}) =>
      AppSettingData(
        id: id ?? this.id,
        locale: locale ?? this.locale,
        themeMode: themeMode ?? this.themeMode,
      );
  AppSettingData copyWithCompanion(AppSettingCompanion data) {
    return AppSettingData(
      id: data.id.present ? data.id.value : this.id,
      locale: data.locale.present ? data.locale.value : this.locale,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingData(')
          ..write('id: $id, ')
          ..write('locale: $locale, ')
          ..write('themeMode: $themeMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, locale, themeMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingData &&
          other.id == this.id &&
          other.locale == this.locale &&
          other.themeMode == this.themeMode);
}

class AppSettingCompanion extends UpdateCompanion<AppSettingData> {
  final Value<int> id;
  final Value<String> locale;
  final Value<String> themeMode;
  const AppSettingCompanion({
    this.id = const Value.absent(),
    this.locale = const Value.absent(),
    this.themeMode = const Value.absent(),
  });
  AppSettingCompanion.insert({
    this.id = const Value.absent(),
    required String locale,
    required String themeMode,
  })  : locale = Value(locale),
        themeMode = Value(themeMode);
  static Insertable<AppSettingData> custom({
    Expression<int>? id,
    Expression<String>? locale,
    Expression<String>? themeMode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locale != null) 'locale': locale,
      if (themeMode != null) 'theme_mode': themeMode,
    });
  }

  AppSettingCompanion copyWith(
      {Value<int>? id, Value<String>? locale, Value<String>? themeMode}) {
    return AppSettingCompanion(
      id: id ?? this.id,
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locale.present) {
      map['locale'] = Variable<String>(locale.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingCompanion(')
          ..write('id: $id, ')
          ..write('locale: $locale, ')
          ..write('themeMode: $themeMode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppSettingTable appSetting = $AppSettingTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appSetting];
}

typedef $$AppSettingTableCreateCompanionBuilder = AppSettingCompanion Function({
  Value<int> id,
  required String locale,
  required String themeMode,
});
typedef $$AppSettingTableUpdateCompanionBuilder = AppSettingCompanion Function({
  Value<int> id,
  Value<String> locale,
  Value<String> themeMode,
});

class $$AppSettingTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingTable> {
  $$AppSettingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnFilters(column));
}

class $$AppSettingTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingTable> {
  $$AppSettingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get locale => $composableBuilder(
      column: $table.locale, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingTable> {
  $$AppSettingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get locale =>
      $composableBuilder(column: $table.locale, builder: (column) => column);

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);
}

class $$AppSettingTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingTable,
    AppSettingData,
    $$AppSettingTableFilterComposer,
    $$AppSettingTableOrderingComposer,
    $$AppSettingTableAnnotationComposer,
    $$AppSettingTableCreateCompanionBuilder,
    $$AppSettingTableUpdateCompanionBuilder,
    (
      AppSettingData,
      BaseReferences<_$AppDatabase, $AppSettingTable, AppSettingData>
    ),
    AppSettingData,
    PrefetchHooks Function()> {
  $$AppSettingTableTableManager(_$AppDatabase db, $AppSettingTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> locale = const Value.absent(),
            Value<String> themeMode = const Value.absent(),
          }) =>
              AppSettingCompanion(
            id: id,
            locale: locale,
            themeMode: themeMode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String locale,
            required String themeMode,
          }) =>
              AppSettingCompanion.insert(
            id: id,
            locale: locale,
            themeMode: themeMode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingTable,
    AppSettingData,
    $$AppSettingTableFilterComposer,
    $$AppSettingTableOrderingComposer,
    $$AppSettingTableAnnotationComposer,
    $$AppSettingTableCreateCompanionBuilder,
    $$AppSettingTableUpdateCompanionBuilder,
    (
      AppSettingData,
      BaseReferences<_$AppDatabase, $AppSettingTable, AppSettingData>
    ),
    AppSettingData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppSettingTableTableManager get appSetting =>
      $$AppSettingTableTableManager(_db, _db.appSetting);
}
