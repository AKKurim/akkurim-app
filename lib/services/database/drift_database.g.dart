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

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _endpointMeta =
      const VerificationMeta('endpoint');
  @override
  late final GeneratedColumn<String> endpoint = GeneratedColumn<String>(
      'endpoint', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
      'method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _doneAtMeta = const VerificationMeta('doneAt');
  @override
  late final GeneratedColumn<DateTime> doneAt = GeneratedColumn<DateTime>(
      'done_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, endpoint, method, data, doneAt, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('endpoint')) {
      context.handle(_endpointMeta,
          endpoint.isAcceptableOrUnknown(data['endpoint']!, _endpointMeta));
    } else if (isInserting) {
      context.missing(_endpointMeta);
    }
    if (data.containsKey('method')) {
      context.handle(_methodMeta,
          method.isAcceptableOrUnknown(data['method']!, _methodMeta));
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    }
    if (data.containsKey('done_at')) {
      context.handle(_doneAtMeta,
          doneAt.isAcceptableOrUnknown(data['done_at']!, _doneAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      endpoint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}endpoint'])!,
      method: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data']),
      doneAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}done_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final String endpoint;
  final String method;
  final String? data;
  final DateTime? doneAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SyncQueueData(
      {required this.id,
      required this.endpoint,
      required this.method,
      this.data,
      this.doneAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['endpoint'] = Variable<String>(endpoint);
    map['method'] = Variable<String>(method);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<String>(data);
    }
    if (!nullToAbsent || doneAt != null) {
      map['done_at'] = Variable<DateTime>(doneAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      endpoint: Value(endpoint),
      method: Value(method),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      doneAt:
          doneAt == null && nullToAbsent ? const Value.absent() : Value(doneAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      endpoint: serializer.fromJson<String>(json['endpoint']),
      method: serializer.fromJson<String>(json['method']),
      data: serializer.fromJson<String?>(json['data']),
      doneAt: serializer.fromJson<DateTime?>(json['doneAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'endpoint': serializer.toJson<String>(endpoint),
      'method': serializer.toJson<String>(method),
      'data': serializer.toJson<String?>(data),
      'doneAt': serializer.toJson<DateTime?>(doneAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SyncQueueData copyWith(
          {int? id,
          String? endpoint,
          String? method,
          Value<String?> data = const Value.absent(),
          Value<DateTime?> doneAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      SyncQueueData(
        id: id ?? this.id,
        endpoint: endpoint ?? this.endpoint,
        method: method ?? this.method,
        data: data.present ? data.value : this.data,
        doneAt: doneAt.present ? doneAt.value : this.doneAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      endpoint: data.endpoint.present ? data.endpoint.value : this.endpoint,
      method: data.method.present ? data.method.value : this.method,
      data: data.data.present ? data.data.value : this.data,
      doneAt: data.doneAt.present ? data.doneAt.value : this.doneAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('data: $data, ')
          ..write('doneAt: $doneAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, endpoint, method, data, doneAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.endpoint == this.endpoint &&
          other.method == this.method &&
          other.data == this.data &&
          other.doneAt == this.doneAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> endpoint;
  final Value<String> method;
  final Value<String?> data;
  final Value<DateTime?> doneAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.endpoint = const Value.absent(),
    this.method = const Value.absent(),
    this.data = const Value.absent(),
    this.doneAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String endpoint,
    required String method,
    this.data = const Value.absent(),
    this.doneAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : endpoint = Value(endpoint),
        method = Value(method),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? endpoint,
    Expression<String>? method,
    Expression<String>? data,
    Expression<DateTime>? doneAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (endpoint != null) 'endpoint': endpoint,
      if (method != null) 'method': method,
      if (data != null) 'data': data,
      if (doneAt != null) 'done_at': doneAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? endpoint,
      Value<String>? method,
      Value<String?>? data,
      Value<DateTime?>? doneAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      endpoint: endpoint ?? this.endpoint,
      method: method ?? this.method,
      data: data ?? this.data,
      doneAt: doneAt ?? this.doneAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (endpoint.present) {
      map['endpoint'] = Variable<String>(endpoint.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (doneAt.present) {
      map['done_at'] = Variable<DateTime>(doneAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('endpoint: $endpoint, ')
          ..write('method: $method, ')
          ..write('data: $data, ')
          ..write('doneAt: $doneAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UserEmailTable extends UserEmail
    with TableInfo<$UserEmailTable, UserEmailData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEmailTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_email';
  @override
  VerificationContext validateIntegrity(Insertable<UserEmailData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEmailData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEmailData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $UserEmailTable createAlias(String alias) {
    return $UserEmailTable(attachedDatabase, alias);
  }
}

class UserEmailData extends DataClass implements Insertable<UserEmailData> {
  final int id;
  final String email;
  const UserEmailData({required this.id, required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    return map;
  }

  UserEmailCompanion toCompanion(bool nullToAbsent) {
    return UserEmailCompanion(
      id: Value(id),
      email: Value(email),
    );
  }

  factory UserEmailData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEmailData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
    };
  }

  UserEmailData copyWith({int? id, String? email}) => UserEmailData(
        id: id ?? this.id,
        email: email ?? this.email,
      );
  UserEmailData copyWithCompanion(UserEmailCompanion data) {
    return UserEmailData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEmailData(')
          ..write('id: $id, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEmailData &&
          other.id == this.id &&
          other.email == this.email);
}

class UserEmailCompanion extends UpdateCompanion<UserEmailData> {
  final Value<int> id;
  final Value<String> email;
  const UserEmailCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
  });
  UserEmailCompanion.insert({
    this.id = const Value.absent(),
    required String email,
  }) : email = Value(email);
  static Insertable<UserEmailData> custom({
    Expression<int>? id,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
    });
  }

  UserEmailCompanion copyWith({Value<int>? id, Value<String>? email}) {
    return UserEmailCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEmailCompanion(')
          ..write('id: $id, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $AthleteGuardianTable extends AthleteGuardian
    with TableInfo<$AthleteGuardianTable, AthleteGuardianData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AthleteGuardianTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _athleteIdMeta =
      const VerificationMeta('athleteId');
  @override
  late final GeneratedColumn<String> athleteId = GeneratedColumn<String>(
      'athlete_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _guardianIdMeta =
      const VerificationMeta('guardianId');
  @override
  late final GeneratedColumn<String> guardianId = GeneratedColumn<String>(
      'guardian_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [athleteId, guardianId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'athlete_guardian';
  @override
  VerificationContext validateIntegrity(
      Insertable<AthleteGuardianData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('athlete_id')) {
      context.handle(_athleteIdMeta,
          athleteId.isAcceptableOrUnknown(data['athlete_id']!, _athleteIdMeta));
    } else if (isInserting) {
      context.missing(_athleteIdMeta);
    }
    if (data.containsKey('guardian_id')) {
      context.handle(
          _guardianIdMeta,
          guardianId.isAcceptableOrUnknown(
              data['guardian_id']!, _guardianIdMeta));
    } else if (isInserting) {
      context.missing(_guardianIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {athleteId, guardianId};
  @override
  AthleteGuardianData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AthleteGuardianData(
      athleteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}athlete_id'])!,
      guardianId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $AthleteGuardianTable createAlias(String alias) {
    return $AthleteGuardianTable(attachedDatabase, alias);
  }
}

class AthleteGuardianData extends DataClass
    implements Insertable<AthleteGuardianData> {
  final String athleteId;
  final String guardianId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const AthleteGuardianData(
      {required this.athleteId,
      required this.guardianId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['athlete_id'] = Variable<String>(athleteId);
    map['guardian_id'] = Variable<String>(guardianId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AthleteGuardianCompanion toCompanion(bool nullToAbsent) {
    return AthleteGuardianCompanion(
      athleteId: Value(athleteId),
      guardianId: Value(guardianId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory AthleteGuardianData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AthleteGuardianData(
      athleteId: serializer.fromJson<String>(json['athleteId']),
      guardianId: serializer.fromJson<String>(json['guardianId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'athleteId': serializer.toJson<String>(athleteId),
      'guardianId': serializer.toJson<String>(guardianId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  AthleteGuardianData copyWith(
          {String? athleteId,
          String? guardianId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      AthleteGuardianData(
        athleteId: athleteId ?? this.athleteId,
        guardianId: guardianId ?? this.guardianId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  AthleteGuardianData copyWithCompanion(AthleteGuardianCompanion data) {
    return AthleteGuardianData(
      athleteId: data.athleteId.present ? data.athleteId.value : this.athleteId,
      guardianId:
          data.guardianId.present ? data.guardianId.value : this.guardianId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AthleteGuardianData(')
          ..write('athleteId: $athleteId, ')
          ..write('guardianId: $guardianId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(athleteId, guardianId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AthleteGuardianData &&
          other.athleteId == this.athleteId &&
          other.guardianId == this.guardianId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class AthleteGuardianCompanion extends UpdateCompanion<AthleteGuardianData> {
  final Value<String> athleteId;
  final Value<String> guardianId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const AthleteGuardianCompanion({
    this.athleteId = const Value.absent(),
    this.guardianId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AthleteGuardianCompanion.insert({
    required String athleteId,
    required String guardianId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : athleteId = Value(athleteId),
        guardianId = Value(guardianId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<AthleteGuardianData> custom({
    Expression<String>? athleteId,
    Expression<String>? guardianId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (athleteId != null) 'athlete_id': athleteId,
      if (guardianId != null) 'guardian_id': guardianId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AthleteGuardianCompanion copyWith(
      {Value<String>? athleteId,
      Value<String>? guardianId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return AthleteGuardianCompanion(
      athleteId: athleteId ?? this.athleteId,
      guardianId: guardianId ?? this.guardianId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (athleteId.present) {
      map['athlete_id'] = Variable<String>(athleteId.value);
    }
    if (guardianId.present) {
      map['guardian_id'] = Variable<String>(guardianId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AthleteGuardianCompanion(')
          ..write('athleteId: $athleteId, ')
          ..write('guardianId: $guardianId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AthleteMeetEventTable extends AthleteMeetEvent
    with TableInfo<$AthleteMeetEventTable, AthleteMeetEventData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AthleteMeetEventTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _athleteIdMeta =
      const VerificationMeta('athleteId');
  @override
  late final GeneratedColumn<String> athleteId = GeneratedColumn<String>(
      'athlete_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _meetEventIdMeta =
      const VerificationMeta('meetEventId');
  @override
  late final GeneratedColumn<String> meetEventId = GeneratedColumn<String>(
      'meet_event_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _windMeta = const VerificationMeta('wind');
  @override
  late final GeneratedColumn<String> wind = GeneratedColumn<String>(
      'wind', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pbSbMeta = const VerificationMeta('pbSb');
  @override
  late final GeneratedColumn<String> pbSb = GeneratedColumn<String>(
      'pb_sb', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<String> points = GeneratedColumn<String>(
      'points', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        athleteId,
        meetEventId,
        result,
        wind,
        pbSb,
        points,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'athlete_meet_event';
  @override
  VerificationContext validateIntegrity(
      Insertable<AthleteMeetEventData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('athlete_id')) {
      context.handle(_athleteIdMeta,
          athleteId.isAcceptableOrUnknown(data['athlete_id']!, _athleteIdMeta));
    } else if (isInserting) {
      context.missing(_athleteIdMeta);
    }
    if (data.containsKey('meet_event_id')) {
      context.handle(
          _meetEventIdMeta,
          meetEventId.isAcceptableOrUnknown(
              data['meet_event_id']!, _meetEventIdMeta));
    } else if (isInserting) {
      context.missing(_meetEventIdMeta);
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('wind')) {
      context.handle(
          _windMeta, wind.isAcceptableOrUnknown(data['wind']!, _windMeta));
    }
    if (data.containsKey('pb_sb')) {
      context.handle(
          _pbSbMeta, pbSb.isAcceptableOrUnknown(data['pb_sb']!, _pbSbMeta));
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {athleteId, meetEventId};
  @override
  AthleteMeetEventData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AthleteMeetEventData(
      athleteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}athlete_id'])!,
      meetEventId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meet_event_id'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      wind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wind']),
      pbSb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pb_sb']),
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}points']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $AthleteMeetEventTable createAlias(String alias) {
    return $AthleteMeetEventTable(attachedDatabase, alias);
  }
}

class AthleteMeetEventData extends DataClass
    implements Insertable<AthleteMeetEventData> {
  final String athleteId;
  final String meetEventId;
  final String? result;
  final String? wind;
  final String? pbSb;
  final String? points;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const AthleteMeetEventData(
      {required this.athleteId,
      required this.meetEventId,
      this.result,
      this.wind,
      this.pbSb,
      this.points,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['athlete_id'] = Variable<String>(athleteId);
    map['meet_event_id'] = Variable<String>(meetEventId);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || wind != null) {
      map['wind'] = Variable<String>(wind);
    }
    if (!nullToAbsent || pbSb != null) {
      map['pb_sb'] = Variable<String>(pbSb);
    }
    if (!nullToAbsent || points != null) {
      map['points'] = Variable<String>(points);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AthleteMeetEventCompanion toCompanion(bool nullToAbsent) {
    return AthleteMeetEventCompanion(
      athleteId: Value(athleteId),
      meetEventId: Value(meetEventId),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      wind: wind == null && nullToAbsent ? const Value.absent() : Value(wind),
      pbSb: pbSb == null && nullToAbsent ? const Value.absent() : Value(pbSb),
      points:
          points == null && nullToAbsent ? const Value.absent() : Value(points),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory AthleteMeetEventData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AthleteMeetEventData(
      athleteId: serializer.fromJson<String>(json['athleteId']),
      meetEventId: serializer.fromJson<String>(json['meetEventId']),
      result: serializer.fromJson<String?>(json['result']),
      wind: serializer.fromJson<String?>(json['wind']),
      pbSb: serializer.fromJson<String?>(json['pbSb']),
      points: serializer.fromJson<String?>(json['points']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'athleteId': serializer.toJson<String>(athleteId),
      'meetEventId': serializer.toJson<String>(meetEventId),
      'result': serializer.toJson<String?>(result),
      'wind': serializer.toJson<String?>(wind),
      'pbSb': serializer.toJson<String?>(pbSb),
      'points': serializer.toJson<String?>(points),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  AthleteMeetEventData copyWith(
          {String? athleteId,
          String? meetEventId,
          Value<String?> result = const Value.absent(),
          Value<String?> wind = const Value.absent(),
          Value<String?> pbSb = const Value.absent(),
          Value<String?> points = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      AthleteMeetEventData(
        athleteId: athleteId ?? this.athleteId,
        meetEventId: meetEventId ?? this.meetEventId,
        result: result.present ? result.value : this.result,
        wind: wind.present ? wind.value : this.wind,
        pbSb: pbSb.present ? pbSb.value : this.pbSb,
        points: points.present ? points.value : this.points,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  AthleteMeetEventData copyWithCompanion(AthleteMeetEventCompanion data) {
    return AthleteMeetEventData(
      athleteId: data.athleteId.present ? data.athleteId.value : this.athleteId,
      meetEventId:
          data.meetEventId.present ? data.meetEventId.value : this.meetEventId,
      result: data.result.present ? data.result.value : this.result,
      wind: data.wind.present ? data.wind.value : this.wind,
      pbSb: data.pbSb.present ? data.pbSb.value : this.pbSb,
      points: data.points.present ? data.points.value : this.points,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AthleteMeetEventData(')
          ..write('athleteId: $athleteId, ')
          ..write('meetEventId: $meetEventId, ')
          ..write('result: $result, ')
          ..write('wind: $wind, ')
          ..write('pbSb: $pbSb, ')
          ..write('points: $points, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(athleteId, meetEventId, result, wind, pbSb,
      points, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AthleteMeetEventData &&
          other.athleteId == this.athleteId &&
          other.meetEventId == this.meetEventId &&
          other.result == this.result &&
          other.wind == this.wind &&
          other.pbSb == this.pbSb &&
          other.points == this.points &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class AthleteMeetEventCompanion extends UpdateCompanion<AthleteMeetEventData> {
  final Value<String> athleteId;
  final Value<String> meetEventId;
  final Value<String?> result;
  final Value<String?> wind;
  final Value<String?> pbSb;
  final Value<String?> points;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const AthleteMeetEventCompanion({
    this.athleteId = const Value.absent(),
    this.meetEventId = const Value.absent(),
    this.result = const Value.absent(),
    this.wind = const Value.absent(),
    this.pbSb = const Value.absent(),
    this.points = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AthleteMeetEventCompanion.insert({
    required String athleteId,
    required String meetEventId,
    this.result = const Value.absent(),
    this.wind = const Value.absent(),
    this.pbSb = const Value.absent(),
    this.points = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : athleteId = Value(athleteId),
        meetEventId = Value(meetEventId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<AthleteMeetEventData> custom({
    Expression<String>? athleteId,
    Expression<String>? meetEventId,
    Expression<String>? result,
    Expression<String>? wind,
    Expression<String>? pbSb,
    Expression<String>? points,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (athleteId != null) 'athlete_id': athleteId,
      if (meetEventId != null) 'meet_event_id': meetEventId,
      if (result != null) 'result': result,
      if (wind != null) 'wind': wind,
      if (pbSb != null) 'pb_sb': pbSb,
      if (points != null) 'points': points,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AthleteMeetEventCompanion copyWith(
      {Value<String>? athleteId,
      Value<String>? meetEventId,
      Value<String?>? result,
      Value<String?>? wind,
      Value<String?>? pbSb,
      Value<String?>? points,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return AthleteMeetEventCompanion(
      athleteId: athleteId ?? this.athleteId,
      meetEventId: meetEventId ?? this.meetEventId,
      result: result ?? this.result,
      wind: wind ?? this.wind,
      pbSb: pbSb ?? this.pbSb,
      points: points ?? this.points,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (athleteId.present) {
      map['athlete_id'] = Variable<String>(athleteId.value);
    }
    if (meetEventId.present) {
      map['meet_event_id'] = Variable<String>(meetEventId.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (wind.present) {
      map['wind'] = Variable<String>(wind.value);
    }
    if (pbSb.present) {
      map['pb_sb'] = Variable<String>(pbSb.value);
    }
    if (points.present) {
      map['points'] = Variable<String>(points.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AthleteMeetEventCompanion(')
          ..write('athleteId: $athleteId, ')
          ..write('meetEventId: $meetEventId, ')
          ..write('result: $result, ')
          ..write('wind: $wind, ')
          ..write('pbSb: $pbSb, ')
          ..write('points: $points, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AthleteSignUpFormTable extends AthleteSignUpForm
    with TableInfo<$AthleteSignUpFormTable, AthleteSignUpFormData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AthleteSignUpFormTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _athleteIdMeta =
      const VerificationMeta('athleteId');
  @override
  late final GeneratedColumn<String> athleteId = GeneratedColumn<String>(
      'athlete_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _signUpFormIdMeta =
      const VerificationMeta('signUpFormId');
  @override
  late final GeneratedColumn<String> signUpFormId = GeneratedColumn<String>(
      'sign_up_form_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [athleteId, signUpFormId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'athlete_sign_up_form';
  @override
  VerificationContext validateIntegrity(
      Insertable<AthleteSignUpFormData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('athlete_id')) {
      context.handle(_athleteIdMeta,
          athleteId.isAcceptableOrUnknown(data['athlete_id']!, _athleteIdMeta));
    } else if (isInserting) {
      context.missing(_athleteIdMeta);
    }
    if (data.containsKey('sign_up_form_id')) {
      context.handle(
          _signUpFormIdMeta,
          signUpFormId.isAcceptableOrUnknown(
              data['sign_up_form_id']!, _signUpFormIdMeta));
    } else if (isInserting) {
      context.missing(_signUpFormIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {athleteId, signUpFormId};
  @override
  AthleteSignUpFormData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AthleteSignUpFormData(
      athleteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}athlete_id'])!,
      signUpFormId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}sign_up_form_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $AthleteSignUpFormTable createAlias(String alias) {
    return $AthleteSignUpFormTable(attachedDatabase, alias);
  }
}

class AthleteSignUpFormData extends DataClass
    implements Insertable<AthleteSignUpFormData> {
  final String athleteId;
  final String signUpFormId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const AthleteSignUpFormData(
      {required this.athleteId,
      required this.signUpFormId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['athlete_id'] = Variable<String>(athleteId);
    map['sign_up_form_id'] = Variable<String>(signUpFormId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AthleteSignUpFormCompanion toCompanion(bool nullToAbsent) {
    return AthleteSignUpFormCompanion(
      athleteId: Value(athleteId),
      signUpFormId: Value(signUpFormId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory AthleteSignUpFormData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AthleteSignUpFormData(
      athleteId: serializer.fromJson<String>(json['athleteId']),
      signUpFormId: serializer.fromJson<String>(json['signUpFormId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'athleteId': serializer.toJson<String>(athleteId),
      'signUpFormId': serializer.toJson<String>(signUpFormId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  AthleteSignUpFormData copyWith(
          {String? athleteId,
          String? signUpFormId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      AthleteSignUpFormData(
        athleteId: athleteId ?? this.athleteId,
        signUpFormId: signUpFormId ?? this.signUpFormId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  AthleteSignUpFormData copyWithCompanion(AthleteSignUpFormCompanion data) {
    return AthleteSignUpFormData(
      athleteId: data.athleteId.present ? data.athleteId.value : this.athleteId,
      signUpFormId: data.signUpFormId.present
          ? data.signUpFormId.value
          : this.signUpFormId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AthleteSignUpFormData(')
          ..write('athleteId: $athleteId, ')
          ..write('signUpFormId: $signUpFormId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(athleteId, signUpFormId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AthleteSignUpFormData &&
          other.athleteId == this.athleteId &&
          other.signUpFormId == this.signUpFormId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class AthleteSignUpFormCompanion
    extends UpdateCompanion<AthleteSignUpFormData> {
  final Value<String> athleteId;
  final Value<String> signUpFormId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const AthleteSignUpFormCompanion({
    this.athleteId = const Value.absent(),
    this.signUpFormId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AthleteSignUpFormCompanion.insert({
    required String athleteId,
    required String signUpFormId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : athleteId = Value(athleteId),
        signUpFormId = Value(signUpFormId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<AthleteSignUpFormData> custom({
    Expression<String>? athleteId,
    Expression<String>? signUpFormId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (athleteId != null) 'athlete_id': athleteId,
      if (signUpFormId != null) 'sign_up_form_id': signUpFormId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AthleteSignUpFormCompanion copyWith(
      {Value<String>? athleteId,
      Value<String>? signUpFormId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return AthleteSignUpFormCompanion(
      athleteId: athleteId ?? this.athleteId,
      signUpFormId: signUpFormId ?? this.signUpFormId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (athleteId.present) {
      map['athlete_id'] = Variable<String>(athleteId.value);
    }
    if (signUpFormId.present) {
      map['sign_up_form_id'] = Variable<String>(signUpFormId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AthleteSignUpFormCompanion(')
          ..write('athleteId: $athleteId, ')
          ..write('signUpFormId: $signUpFormId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AthleteStatusTable extends AthleteStatus
    with TableInfo<$AthleteStatusTable, AthleteStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AthleteStatusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'athlete_status';
  @override
  VerificationContext validateIntegrity(Insertable<AthleteStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AthleteStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AthleteStatusData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $AthleteStatusTable createAlias(String alias) {
    return $AthleteStatusTable(attachedDatabase, alias);
  }
}

class AthleteStatusData extends DataClass
    implements Insertable<AthleteStatusData> {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const AthleteStatusData(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AthleteStatusCompanion toCompanion(bool nullToAbsent) {
    return AthleteStatusCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory AthleteStatusData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AthleteStatusData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  AthleteStatusData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      AthleteStatusData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  AthleteStatusData copyWithCompanion(AthleteStatusCompanion data) {
    return AthleteStatusData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AthleteStatusData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AthleteStatusData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class AthleteStatusCompanion extends UpdateCompanion<AthleteStatusData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const AthleteStatusCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AthleteStatusCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<AthleteStatusData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AthleteStatusCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return AthleteStatusCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AthleteStatusCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AthleteTable extends Athlete with TableInfo<$AthleteTable, AthleteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AthleteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _birthNumberMeta =
      const VerificationMeta('birthNumber');
  @override
  late final GeneratedColumn<String> birthNumber = GeneratedColumn<String>(
      'birth_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _zipMeta = const VerificationMeta('zip');
  @override
  late final GeneratedColumn<String> zip = GeneratedColumn<String>(
      'zip', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _eanMeta = const VerificationMeta('ean');
  @override
  late final GeneratedColumn<String> ean = GeneratedColumn<String>(
      'ean', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _clubIdMeta = const VerificationMeta('clubId');
  @override
  late final GeneratedColumn<String> clubId = GeneratedColumn<String>(
      'club_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profilePictureMeta =
      const VerificationMeta('profilePicture');
  @override
  late final GeneratedColumn<String> profilePicture = GeneratedColumn<String>(
      'profile_picture', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _athleteStatusIdMeta =
      const VerificationMeta('athleteStatusId');
  @override
  late final GeneratedColumn<String> athleteStatusId = GeneratedColumn<String>(
      'athlete_status_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        birthNumber,
        firstName,
        lastName,
        street,
        city,
        zip,
        email,
        phone,
        ean,
        note,
        clubId,
        profilePicture,
        athleteStatusId,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'athlete';
  @override
  VerificationContext validateIntegrity(Insertable<AthleteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('birth_number')) {
      context.handle(
          _birthNumberMeta,
          birthNumber.isAcceptableOrUnknown(
              data['birth_number']!, _birthNumberMeta));
    } else if (isInserting) {
      context.missing(_birthNumberMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('zip')) {
      context.handle(
          _zipMeta, zip.isAcceptableOrUnknown(data['zip']!, _zipMeta));
    } else if (isInserting) {
      context.missing(_zipMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('ean')) {
      context.handle(
          _eanMeta, ean.isAcceptableOrUnknown(data['ean']!, _eanMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('club_id')) {
      context.handle(_clubIdMeta,
          clubId.isAcceptableOrUnknown(data['club_id']!, _clubIdMeta));
    }
    if (data.containsKey('profile_picture')) {
      context.handle(
          _profilePictureMeta,
          profilePicture.isAcceptableOrUnknown(
              data['profile_picture']!, _profilePictureMeta));
    }
    if (data.containsKey('athlete_status_id')) {
      context.handle(
          _athleteStatusIdMeta,
          athleteStatusId.isAcceptableOrUnknown(
              data['athlete_status_id']!, _athleteStatusIdMeta));
    } else if (isInserting) {
      context.missing(_athleteStatusIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AthleteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AthleteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      birthNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}birth_number'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      zip: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zip'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      ean: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ean']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      clubId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}club_id']),
      profilePicture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_picture']),
      athleteStatusId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}athlete_status_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $AthleteTable createAlias(String alias) {
    return $AthleteTable(attachedDatabase, alias);
  }
}

class AthleteData extends DataClass implements Insertable<AthleteData> {
  final String id;
  final String birthNumber;
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String zip;
  final String? email;
  final String? phone;
  final String? ean;
  final String? note;
  final String? clubId;
  final String? profilePicture;
  final String athleteStatusId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const AthleteData(
      {required this.id,
      required this.birthNumber,
      required this.firstName,
      required this.lastName,
      required this.street,
      required this.city,
      required this.zip,
      this.email,
      this.phone,
      this.ean,
      this.note,
      this.clubId,
      this.profilePicture,
      required this.athleteStatusId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['birth_number'] = Variable<String>(birthNumber);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['street'] = Variable<String>(street);
    map['city'] = Variable<String>(city);
    map['zip'] = Variable<String>(zip);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || ean != null) {
      map['ean'] = Variable<String>(ean);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || clubId != null) {
      map['club_id'] = Variable<String>(clubId);
    }
    if (!nullToAbsent || profilePicture != null) {
      map['profile_picture'] = Variable<String>(profilePicture);
    }
    map['athlete_status_id'] = Variable<String>(athleteStatusId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  AthleteCompanion toCompanion(bool nullToAbsent) {
    return AthleteCompanion(
      id: Value(id),
      birthNumber: Value(birthNumber),
      firstName: Value(firstName),
      lastName: Value(lastName),
      street: Value(street),
      city: Value(city),
      zip: Value(zip),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      ean: ean == null && nullToAbsent ? const Value.absent() : Value(ean),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      clubId:
          clubId == null && nullToAbsent ? const Value.absent() : Value(clubId),
      profilePicture: profilePicture == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePicture),
      athleteStatusId: Value(athleteStatusId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory AthleteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AthleteData(
      id: serializer.fromJson<String>(json['id']),
      birthNumber: serializer.fromJson<String>(json['birthNumber']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      street: serializer.fromJson<String>(json['street']),
      city: serializer.fromJson<String>(json['city']),
      zip: serializer.fromJson<String>(json['zip']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      ean: serializer.fromJson<String?>(json['ean']),
      note: serializer.fromJson<String?>(json['note']),
      clubId: serializer.fromJson<String?>(json['clubId']),
      profilePicture: serializer.fromJson<String?>(json['profilePicture']),
      athleteStatusId: serializer.fromJson<String>(json['athleteStatusId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'birthNumber': serializer.toJson<String>(birthNumber),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'street': serializer.toJson<String>(street),
      'city': serializer.toJson<String>(city),
      'zip': serializer.toJson<String>(zip),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'ean': serializer.toJson<String?>(ean),
      'note': serializer.toJson<String?>(note),
      'clubId': serializer.toJson<String?>(clubId),
      'profilePicture': serializer.toJson<String?>(profilePicture),
      'athleteStatusId': serializer.toJson<String>(athleteStatusId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  AthleteData copyWith(
          {String? id,
          String? birthNumber,
          String? firstName,
          String? lastName,
          String? street,
          String? city,
          String? zip,
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> ean = const Value.absent(),
          Value<String?> note = const Value.absent(),
          Value<String?> clubId = const Value.absent(),
          Value<String?> profilePicture = const Value.absent(),
          String? athleteStatusId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      AthleteData(
        id: id ?? this.id,
        birthNumber: birthNumber ?? this.birthNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        street: street ?? this.street,
        city: city ?? this.city,
        zip: zip ?? this.zip,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        ean: ean.present ? ean.value : this.ean,
        note: note.present ? note.value : this.note,
        clubId: clubId.present ? clubId.value : this.clubId,
        profilePicture:
            profilePicture.present ? profilePicture.value : this.profilePicture,
        athleteStatusId: athleteStatusId ?? this.athleteStatusId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  AthleteData copyWithCompanion(AthleteCompanion data) {
    return AthleteData(
      id: data.id.present ? data.id.value : this.id,
      birthNumber:
          data.birthNumber.present ? data.birthNumber.value : this.birthNumber,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      street: data.street.present ? data.street.value : this.street,
      city: data.city.present ? data.city.value : this.city,
      zip: data.zip.present ? data.zip.value : this.zip,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      ean: data.ean.present ? data.ean.value : this.ean,
      note: data.note.present ? data.note.value : this.note,
      clubId: data.clubId.present ? data.clubId.value : this.clubId,
      profilePicture: data.profilePicture.present
          ? data.profilePicture.value
          : this.profilePicture,
      athleteStatusId: data.athleteStatusId.present
          ? data.athleteStatusId.value
          : this.athleteStatusId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AthleteData(')
          ..write('id: $id, ')
          ..write('birthNumber: $birthNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('zip: $zip, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('ean: $ean, ')
          ..write('note: $note, ')
          ..write('clubId: $clubId, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('athleteStatusId: $athleteStatusId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      birthNumber,
      firstName,
      lastName,
      street,
      city,
      zip,
      email,
      phone,
      ean,
      note,
      clubId,
      profilePicture,
      athleteStatusId,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AthleteData &&
          other.id == this.id &&
          other.birthNumber == this.birthNumber &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.street == this.street &&
          other.city == this.city &&
          other.zip == this.zip &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.ean == this.ean &&
          other.note == this.note &&
          other.clubId == this.clubId &&
          other.profilePicture == this.profilePicture &&
          other.athleteStatusId == this.athleteStatusId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class AthleteCompanion extends UpdateCompanion<AthleteData> {
  final Value<String> id;
  final Value<String> birthNumber;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> street;
  final Value<String> city;
  final Value<String> zip;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> ean;
  final Value<String?> note;
  final Value<String?> clubId;
  final Value<String?> profilePicture;
  final Value<String> athleteStatusId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const AthleteCompanion({
    this.id = const Value.absent(),
    this.birthNumber = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.street = const Value.absent(),
    this.city = const Value.absent(),
    this.zip = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.ean = const Value.absent(),
    this.note = const Value.absent(),
    this.clubId = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.athleteStatusId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AthleteCompanion.insert({
    required String id,
    required String birthNumber,
    required String firstName,
    required String lastName,
    required String street,
    required String city,
    required String zip,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.ean = const Value.absent(),
    this.note = const Value.absent(),
    this.clubId = const Value.absent(),
    this.profilePicture = const Value.absent(),
    required String athleteStatusId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        birthNumber = Value(birthNumber),
        firstName = Value(firstName),
        lastName = Value(lastName),
        street = Value(street),
        city = Value(city),
        zip = Value(zip),
        athleteStatusId = Value(athleteStatusId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<AthleteData> custom({
    Expression<String>? id,
    Expression<String>? birthNumber,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? street,
    Expression<String>? city,
    Expression<String>? zip,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? ean,
    Expression<String>? note,
    Expression<String>? clubId,
    Expression<String>? profilePicture,
    Expression<String>? athleteStatusId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (birthNumber != null) 'birth_number': birthNumber,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (street != null) 'street': street,
      if (city != null) 'city': city,
      if (zip != null) 'zip': zip,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (ean != null) 'ean': ean,
      if (note != null) 'note': note,
      if (clubId != null) 'club_id': clubId,
      if (profilePicture != null) 'profile_picture': profilePicture,
      if (athleteStatusId != null) 'athlete_status_id': athleteStatusId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AthleteCompanion copyWith(
      {Value<String>? id,
      Value<String>? birthNumber,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? street,
      Value<String>? city,
      Value<String>? zip,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String?>? ean,
      Value<String?>? note,
      Value<String?>? clubId,
      Value<String?>? profilePicture,
      Value<String>? athleteStatusId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return AthleteCompanion(
      id: id ?? this.id,
      birthNumber: birthNumber ?? this.birthNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      street: street ?? this.street,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      ean: ean ?? this.ean,
      note: note ?? this.note,
      clubId: clubId ?? this.clubId,
      profilePicture: profilePicture ?? this.profilePicture,
      athleteStatusId: athleteStatusId ?? this.athleteStatusId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (birthNumber.present) {
      map['birth_number'] = Variable<String>(birthNumber.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (zip.present) {
      map['zip'] = Variable<String>(zip.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (ean.present) {
      map['ean'] = Variable<String>(ean.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (clubId.present) {
      map['club_id'] = Variable<String>(clubId.value);
    }
    if (profilePicture.present) {
      map['profile_picture'] = Variable<String>(profilePicture.value);
    }
    if (athleteStatusId.present) {
      map['athlete_status_id'] = Variable<String>(athleteStatusId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AthleteCompanion(')
          ..write('id: $id, ')
          ..write('birthNumber: $birthNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('zip: $zip, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('ean: $ean, ')
          ..write('note: $note, ')
          ..write('clubId: $clubId, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('athleteStatusId: $athleteStatusId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<int> sex = GeneratedColumn<int>(
      'sex', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortDescriptionMeta =
      const VerificationMeta('shortDescription');
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
      'short_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionEnMeta =
      const VerificationMeta('descriptionEn');
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
      'description_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortDescriptionEnMeta =
      const VerificationMeta('shortDescriptionEn');
  @override
  late final GeneratedColumn<String> shortDescriptionEn =
      GeneratedColumn<String>('short_description_en', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sex,
        description,
        shortDescription,
        descriptionEn,
        shortDescriptionEn,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
          _shortDescriptionMeta,
          shortDescription.isAcceptableOrUnknown(
              data['short_description']!, _shortDescriptionMeta));
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('description_en')) {
      context.handle(
          _descriptionEnMeta,
          descriptionEn.isAcceptableOrUnknown(
              data['description_en']!, _descriptionEnMeta));
    } else if (isInserting) {
      context.missing(_descriptionEnMeta);
    }
    if (data.containsKey('short_description_en')) {
      context.handle(
          _shortDescriptionEnMeta,
          shortDescriptionEn.isAcceptableOrUnknown(
              data['short_description_en']!, _shortDescriptionEnMeta));
    } else if (isInserting) {
      context.missing(_shortDescriptionEnMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sex'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      shortDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description'])!,
      descriptionEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_en'])!,
      shortDescriptionEn: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description_en'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final int sex;
  final String description;
  final String shortDescription;
  final String descriptionEn;
  final String shortDescriptionEn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const CategoryData(
      {required this.id,
      required this.sex,
      required this.description,
      required this.shortDescription,
      required this.descriptionEn,
      required this.shortDescriptionEn,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sex'] = Variable<int>(sex);
    map['description'] = Variable<String>(description);
    map['short_description'] = Variable<String>(shortDescription);
    map['description_en'] = Variable<String>(descriptionEn);
    map['short_description_en'] = Variable<String>(shortDescriptionEn);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      sex: Value(sex),
      description: Value(description),
      shortDescription: Value(shortDescription),
      descriptionEn: Value(descriptionEn),
      shortDescriptionEn: Value(shortDescriptionEn),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      sex: serializer.fromJson<int>(json['sex']),
      description: serializer.fromJson<String>(json['description']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      descriptionEn: serializer.fromJson<String>(json['descriptionEn']),
      shortDescriptionEn:
          serializer.fromJson<String>(json['shortDescriptionEn']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sex': serializer.toJson<int>(sex),
      'description': serializer.toJson<String>(description),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'descriptionEn': serializer.toJson<String>(descriptionEn),
      'shortDescriptionEn': serializer.toJson<String>(shortDescriptionEn),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CategoryData copyWith(
          {int? id,
          int? sex,
          String? description,
          String? shortDescription,
          String? descriptionEn,
          String? shortDescriptionEn,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CategoryData(
        id: id ?? this.id,
        sex: sex ?? this.sex,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        descriptionEn: descriptionEn ?? this.descriptionEn,
        shortDescriptionEn: shortDescriptionEn ?? this.shortDescriptionEn,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      sex: data.sex.present ? data.sex.value : this.sex,
      description:
          data.description.present ? data.description.value : this.description,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      shortDescriptionEn: data.shortDescriptionEn.present
          ? data.shortDescriptionEn.value
          : this.shortDescriptionEn,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('sex: $sex, ')
          ..write('description: $description, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('shortDescriptionEn: $shortDescriptionEn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sex, description, shortDescription,
      descriptionEn, shortDescriptionEn, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.sex == this.sex &&
          other.description == this.description &&
          other.shortDescription == this.shortDescription &&
          other.descriptionEn == this.descriptionEn &&
          other.shortDescriptionEn == this.shortDescriptionEn &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<int> sex;
  final Value<String> description;
  final Value<String> shortDescription;
  final Value<String> descriptionEn;
  final Value<String> shortDescriptionEn;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.sex = const Value.absent(),
    this.description = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.shortDescriptionEn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required int sex,
    required String description,
    required String shortDescription,
    required String descriptionEn,
    required String shortDescriptionEn,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : sex = Value(sex),
        description = Value(description),
        shortDescription = Value(shortDescription),
        descriptionEn = Value(descriptionEn),
        shortDescriptionEn = Value(shortDescriptionEn),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<int>? sex,
    Expression<String>? description,
    Expression<String>? shortDescription,
    Expression<String>? descriptionEn,
    Expression<String>? shortDescriptionEn,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sex != null) 'sex': sex,
      if (description != null) 'description': description,
      if (shortDescription != null) 'short_description': shortDescription,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (shortDescriptionEn != null)
        'short_description_en': shortDescriptionEn,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  CategoryCompanion copyWith(
      {Value<int>? id,
      Value<int>? sex,
      Value<String>? description,
      Value<String>? shortDescription,
      Value<String>? descriptionEn,
      Value<String>? shortDescriptionEn,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return CategoryCompanion(
      id: id ?? this.id,
      sex: sex ?? this.sex,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      shortDescriptionEn: shortDescriptionEn ?? this.shortDescriptionEn,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sex.present) {
      map['sex'] = Variable<int>(sex.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (shortDescriptionEn.present) {
      map['short_description_en'] = Variable<String>(shortDescriptionEn.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('sex: $sex, ')
          ..write('description: $description, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('shortDescriptionEn: $shortDescriptionEn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $ClubTable extends Club with TableInfo<$ClubTable, ClubData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClubTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'club';
  @override
  VerificationContext validateIntegrity(Insertable<ClubData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClubData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClubData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ClubTable createAlias(String alias) {
    return $ClubTable(attachedDatabase, alias);
  }
}

class ClubData extends DataClass implements Insertable<ClubData> {
  final String id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ClubData(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ClubCompanion toCompanion(bool nullToAbsent) {
    return ClubCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ClubData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClubData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ClubData copyWith(
          {String? id,
          String? name,
          String? description,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ClubData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ClubData copyWithCompanion(ClubCompanion data) {
    return ClubData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClubData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClubData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ClubCompanion extends UpdateCompanion<ClubData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ClubCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClubCompanion.insert({
    required String id,
    required String name,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ClubData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClubCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ClubCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClubCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DisciplineTypeTable extends DisciplineType
    with TableInfo<$DisciplineTypeTable, DisciplineTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DisciplineTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'discipline_type';
  @override
  VerificationContext validateIntegrity(Insertable<DisciplineTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DisciplineTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DisciplineTypeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DisciplineTypeTable createAlias(String alias) {
    return $DisciplineTypeTable(attachedDatabase, alias);
  }
}

class DisciplineTypeData extends DataClass
    implements Insertable<DisciplineTypeData> {
  final int id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const DisciplineTypeData(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DisciplineTypeCompanion toCompanion(bool nullToAbsent) {
    return DisciplineTypeCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DisciplineTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DisciplineTypeData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DisciplineTypeData copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DisciplineTypeData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DisciplineTypeData copyWithCompanion(DisciplineTypeCompanion data) {
    return DisciplineTypeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DisciplineTypeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DisciplineTypeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class DisciplineTypeCompanion extends UpdateCompanion<DisciplineTypeData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const DisciplineTypeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  DisciplineTypeCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DisciplineTypeData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  DisciplineTypeCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return DisciplineTypeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DisciplineTypeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $DisciplineTable extends Discipline
    with TableInfo<$DisciplineTable, DisciplineData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DisciplineTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _disciplineTypeIdMeta =
      const VerificationMeta('disciplineTypeId');
  @override
  late final GeneratedColumn<int> disciplineTypeId = GeneratedColumn<int>(
      'discipline_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortDescriptionMeta =
      const VerificationMeta('shortDescription');
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
      'short_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionEnMeta =
      const VerificationMeta('descriptionEn');
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
      'description_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortDescriptionEnMeta =
      const VerificationMeta('shortDescriptionEn');
  @override
  late final GeneratedColumn<String> shortDescriptionEn =
      GeneratedColumn<String>('short_description_en', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        disciplineTypeId,
        description,
        shortDescription,
        descriptionEn,
        shortDescriptionEn,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'discipline';
  @override
  VerificationContext validateIntegrity(Insertable<DisciplineData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('discipline_type_id')) {
      context.handle(
          _disciplineTypeIdMeta,
          disciplineTypeId.isAcceptableOrUnknown(
              data['discipline_type_id']!, _disciplineTypeIdMeta));
    } else if (isInserting) {
      context.missing(_disciplineTypeIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
          _shortDescriptionMeta,
          shortDescription.isAcceptableOrUnknown(
              data['short_description']!, _shortDescriptionMeta));
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('description_en')) {
      context.handle(
          _descriptionEnMeta,
          descriptionEn.isAcceptableOrUnknown(
              data['description_en']!, _descriptionEnMeta));
    } else if (isInserting) {
      context.missing(_descriptionEnMeta);
    }
    if (data.containsKey('short_description_en')) {
      context.handle(
          _shortDescriptionEnMeta,
          shortDescriptionEn.isAcceptableOrUnknown(
              data['short_description_en']!, _shortDescriptionEnMeta));
    } else if (isInserting) {
      context.missing(_shortDescriptionEnMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DisciplineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DisciplineData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      disciplineTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}discipline_type_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      shortDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description'])!,
      descriptionEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_en'])!,
      shortDescriptionEn: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description_en'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DisciplineTable createAlias(String alias) {
    return $DisciplineTable(attachedDatabase, alias);
  }
}

class DisciplineData extends DataClass implements Insertable<DisciplineData> {
  final int id;
  final int disciplineTypeId;
  final String description;
  final String shortDescription;
  final String descriptionEn;
  final String shortDescriptionEn;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const DisciplineData(
      {required this.id,
      required this.disciplineTypeId,
      required this.description,
      required this.shortDescription,
      required this.descriptionEn,
      required this.shortDescriptionEn,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['discipline_type_id'] = Variable<int>(disciplineTypeId);
    map['description'] = Variable<String>(description);
    map['short_description'] = Variable<String>(shortDescription);
    map['description_en'] = Variable<String>(descriptionEn);
    map['short_description_en'] = Variable<String>(shortDescriptionEn);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DisciplineCompanion toCompanion(bool nullToAbsent) {
    return DisciplineCompanion(
      id: Value(id),
      disciplineTypeId: Value(disciplineTypeId),
      description: Value(description),
      shortDescription: Value(shortDescription),
      descriptionEn: Value(descriptionEn),
      shortDescriptionEn: Value(shortDescriptionEn),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DisciplineData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DisciplineData(
      id: serializer.fromJson<int>(json['id']),
      disciplineTypeId: serializer.fromJson<int>(json['disciplineTypeId']),
      description: serializer.fromJson<String>(json['description']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      descriptionEn: serializer.fromJson<String>(json['descriptionEn']),
      shortDescriptionEn:
          serializer.fromJson<String>(json['shortDescriptionEn']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'disciplineTypeId': serializer.toJson<int>(disciplineTypeId),
      'description': serializer.toJson<String>(description),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'descriptionEn': serializer.toJson<String>(descriptionEn),
      'shortDescriptionEn': serializer.toJson<String>(shortDescriptionEn),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DisciplineData copyWith(
          {int? id,
          int? disciplineTypeId,
          String? description,
          String? shortDescription,
          String? descriptionEn,
          String? shortDescriptionEn,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DisciplineData(
        id: id ?? this.id,
        disciplineTypeId: disciplineTypeId ?? this.disciplineTypeId,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        descriptionEn: descriptionEn ?? this.descriptionEn,
        shortDescriptionEn: shortDescriptionEn ?? this.shortDescriptionEn,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DisciplineData copyWithCompanion(DisciplineCompanion data) {
    return DisciplineData(
      id: data.id.present ? data.id.value : this.id,
      disciplineTypeId: data.disciplineTypeId.present
          ? data.disciplineTypeId.value
          : this.disciplineTypeId,
      description:
          data.description.present ? data.description.value : this.description,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      shortDescriptionEn: data.shortDescriptionEn.present
          ? data.shortDescriptionEn.value
          : this.shortDescriptionEn,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DisciplineData(')
          ..write('id: $id, ')
          ..write('disciplineTypeId: $disciplineTypeId, ')
          ..write('description: $description, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('shortDescriptionEn: $shortDescriptionEn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      disciplineTypeId,
      description,
      shortDescription,
      descriptionEn,
      shortDescriptionEn,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DisciplineData &&
          other.id == this.id &&
          other.disciplineTypeId == this.disciplineTypeId &&
          other.description == this.description &&
          other.shortDescription == this.shortDescription &&
          other.descriptionEn == this.descriptionEn &&
          other.shortDescriptionEn == this.shortDescriptionEn &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class DisciplineCompanion extends UpdateCompanion<DisciplineData> {
  final Value<int> id;
  final Value<int> disciplineTypeId;
  final Value<String> description;
  final Value<String> shortDescription;
  final Value<String> descriptionEn;
  final Value<String> shortDescriptionEn;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const DisciplineCompanion({
    this.id = const Value.absent(),
    this.disciplineTypeId = const Value.absent(),
    this.description = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.shortDescriptionEn = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  DisciplineCompanion.insert({
    this.id = const Value.absent(),
    required int disciplineTypeId,
    required String description,
    required String shortDescription,
    required String descriptionEn,
    required String shortDescriptionEn,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : disciplineTypeId = Value(disciplineTypeId),
        description = Value(description),
        shortDescription = Value(shortDescription),
        descriptionEn = Value(descriptionEn),
        shortDescriptionEn = Value(shortDescriptionEn),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DisciplineData> custom({
    Expression<int>? id,
    Expression<int>? disciplineTypeId,
    Expression<String>? description,
    Expression<String>? shortDescription,
    Expression<String>? descriptionEn,
    Expression<String>? shortDescriptionEn,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (disciplineTypeId != null) 'discipline_type_id': disciplineTypeId,
      if (description != null) 'description': description,
      if (shortDescription != null) 'short_description': shortDescription,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (shortDescriptionEn != null)
        'short_description_en': shortDescriptionEn,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  DisciplineCompanion copyWith(
      {Value<int>? id,
      Value<int>? disciplineTypeId,
      Value<String>? description,
      Value<String>? shortDescription,
      Value<String>? descriptionEn,
      Value<String>? shortDescriptionEn,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return DisciplineCompanion(
      id: id ?? this.id,
      disciplineTypeId: disciplineTypeId ?? this.disciplineTypeId,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      shortDescriptionEn: shortDescriptionEn ?? this.shortDescriptionEn,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (disciplineTypeId.present) {
      map['discipline_type_id'] = Variable<int>(disciplineTypeId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (shortDescriptionEn.present) {
      map['short_description_en'] = Variable<String>(shortDescriptionEn.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DisciplineCompanion(')
          ..write('id: $id, ')
          ..write('disciplineTypeId: $disciplineTypeId, ')
          ..write('description: $description, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('shortDescriptionEn: $shortDescriptionEn, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $GroupAthleteTable extends GroupAthlete
    with TableInfo<$GroupAthleteTable, GroupAthleteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupAthleteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _athleteIdMeta =
      const VerificationMeta('athleteId');
  @override
  late final GeneratedColumn<String> athleteId = GeneratedColumn<String>(
      'athlete_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [groupId, athleteId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_athlete';
  @override
  VerificationContext validateIntegrity(Insertable<GroupAthleteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('athlete_id')) {
      context.handle(_athleteIdMeta,
          athleteId.isAcceptableOrUnknown(data['athlete_id']!, _athleteIdMeta));
    } else if (isInserting) {
      context.missing(_athleteIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupId, athleteId};
  @override
  GroupAthleteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupAthleteData(
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      athleteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}athlete_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $GroupAthleteTable createAlias(String alias) {
    return $GroupAthleteTable(attachedDatabase, alias);
  }
}

class GroupAthleteData extends DataClass
    implements Insertable<GroupAthleteData> {
  final String groupId;
  final String athleteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const GroupAthleteData(
      {required this.groupId,
      required this.athleteId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_id'] = Variable<String>(groupId);
    map['athlete_id'] = Variable<String>(athleteId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  GroupAthleteCompanion toCompanion(bool nullToAbsent) {
    return GroupAthleteCompanion(
      groupId: Value(groupId),
      athleteId: Value(athleteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory GroupAthleteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupAthleteData(
      groupId: serializer.fromJson<String>(json['groupId']),
      athleteId: serializer.fromJson<String>(json['athleteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupId': serializer.toJson<String>(groupId),
      'athleteId': serializer.toJson<String>(athleteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  GroupAthleteData copyWith(
          {String? groupId,
          String? athleteId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      GroupAthleteData(
        groupId: groupId ?? this.groupId,
        athleteId: athleteId ?? this.athleteId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  GroupAthleteData copyWithCompanion(GroupAthleteCompanion data) {
    return GroupAthleteData(
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      athleteId: data.athleteId.present ? data.athleteId.value : this.athleteId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupAthleteData(')
          ..write('groupId: $groupId, ')
          ..write('athleteId: $athleteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(groupId, athleteId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupAthleteData &&
          other.groupId == this.groupId &&
          other.athleteId == this.athleteId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class GroupAthleteCompanion extends UpdateCompanion<GroupAthleteData> {
  final Value<String> groupId;
  final Value<String> athleteId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const GroupAthleteCompanion({
    this.groupId = const Value.absent(),
    this.athleteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupAthleteCompanion.insert({
    required String groupId,
    required String athleteId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupId = Value(groupId),
        athleteId = Value(athleteId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GroupAthleteData> custom({
    Expression<String>? groupId,
    Expression<String>? athleteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupId != null) 'group_id': groupId,
      if (athleteId != null) 'athlete_id': athleteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupAthleteCompanion copyWith(
      {Value<String>? groupId,
      Value<String>? athleteId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return GroupAthleteCompanion(
      groupId: groupId ?? this.groupId,
      athleteId: athleteId ?? this.athleteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (athleteId.present) {
      map['athlete_id'] = Variable<String>(athleteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupAthleteCompanion(')
          ..write('groupId: $groupId, ')
          ..write('athleteId: $athleteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupTrainerTable extends GroupTrainer
    with TableInfo<$GroupTrainerTable, GroupTrainerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupTrainerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _trainerIdMeta =
      const VerificationMeta('trainerId');
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
      'trainer_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [groupId, trainerId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_trainer';
  @override
  VerificationContext validateIntegrity(Insertable<GroupTrainerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('trainer_id')) {
      context.handle(_trainerIdMeta,
          trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta));
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {groupId, trainerId};
  @override
  GroupTrainerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupTrainerData(
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      trainerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trainer_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $GroupTrainerTable createAlias(String alias) {
    return $GroupTrainerTable(attachedDatabase, alias);
  }
}

class GroupTrainerData extends DataClass
    implements Insertable<GroupTrainerData> {
  final String groupId;
  final String trainerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const GroupTrainerData(
      {required this.groupId,
      required this.trainerId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['group_id'] = Variable<String>(groupId);
    map['trainer_id'] = Variable<String>(trainerId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  GroupTrainerCompanion toCompanion(bool nullToAbsent) {
    return GroupTrainerCompanion(
      groupId: Value(groupId),
      trainerId: Value(trainerId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory GroupTrainerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupTrainerData(
      groupId: serializer.fromJson<String>(json['groupId']),
      trainerId: serializer.fromJson<String>(json['trainerId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'groupId': serializer.toJson<String>(groupId),
      'trainerId': serializer.toJson<String>(trainerId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  GroupTrainerData copyWith(
          {String? groupId,
          String? trainerId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      GroupTrainerData(
        groupId: groupId ?? this.groupId,
        trainerId: trainerId ?? this.trainerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  GroupTrainerData copyWithCompanion(GroupTrainerCompanion data) {
    return GroupTrainerData(
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupTrainerData(')
          ..write('groupId: $groupId, ')
          ..write('trainerId: $trainerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(groupId, trainerId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupTrainerData &&
          other.groupId == this.groupId &&
          other.trainerId == this.trainerId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class GroupTrainerCompanion extends UpdateCompanion<GroupTrainerData> {
  final Value<String> groupId;
  final Value<String> trainerId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const GroupTrainerCompanion({
    this.groupId = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupTrainerCompanion.insert({
    required String groupId,
    required String trainerId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : groupId = Value(groupId),
        trainerId = Value(trainerId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GroupTrainerData> custom({
    Expression<String>? groupId,
    Expression<String>? trainerId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (groupId != null) 'group_id': groupId,
      if (trainerId != null) 'trainer_id': trainerId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupTrainerCompanion copyWith(
      {Value<String>? groupId,
      Value<String>? trainerId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return GroupTrainerCompanion(
      groupId: groupId ?? this.groupId,
      trainerId: trainerId ?? this.trainerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupTrainerCompanion(')
          ..write('groupId: $groupId, ')
          ..write('trainerId: $trainerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupTable extends Group with TableInfo<$GroupTable, GroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trainingTimeIdMeta =
      const VerificationMeta('trainingTimeId');
  @override
  late final GeneratedColumn<String> trainingTimeId = GeneratedColumn<String>(
      'training_time_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _schoolYearIdMeta =
      const VerificationMeta('schoolYearId');
  @override
  late final GeneratedColumn<String> schoolYearId = GeneratedColumn<String>(
      'school_year_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        trainingTimeId,
        schoolYearId,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group';
  @override
  VerificationContext validateIntegrity(Insertable<GroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('training_time_id')) {
      context.handle(
          _trainingTimeIdMeta,
          trainingTimeId.isAcceptableOrUnknown(
              data['training_time_id']!, _trainingTimeIdMeta));
    } else if (isInserting) {
      context.missing(_trainingTimeIdMeta);
    }
    if (data.containsKey('school_year_id')) {
      context.handle(
          _schoolYearIdMeta,
          schoolYearId.isAcceptableOrUnknown(
              data['school_year_id']!, _schoolYearIdMeta));
    } else if (isInserting) {
      context.missing(_schoolYearIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      trainingTimeId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}training_time_id'])!,
      schoolYearId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}school_year_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $GroupTable createAlias(String alias) {
    return $GroupTable(attachedDatabase, alias);
  }
}

class GroupData extends DataClass implements Insertable<GroupData> {
  final String id;
  final String name;
  final String? description;
  final String trainingTimeId;
  final String schoolYearId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const GroupData(
      {required this.id,
      required this.name,
      this.description,
      required this.trainingTimeId,
      required this.schoolYearId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['training_time_id'] = Variable<String>(trainingTimeId);
    map['school_year_id'] = Variable<String>(schoolYearId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  GroupCompanion toCompanion(bool nullToAbsent) {
    return GroupCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      trainingTimeId: Value(trainingTimeId),
      schoolYearId: Value(schoolYearId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory GroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      trainingTimeId: serializer.fromJson<String>(json['trainingTimeId']),
      schoolYearId: serializer.fromJson<String>(json['schoolYearId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'trainingTimeId': serializer.toJson<String>(trainingTimeId),
      'schoolYearId': serializer.toJson<String>(schoolYearId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  GroupData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          String? trainingTimeId,
          String? schoolYearId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      GroupData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        trainingTimeId: trainingTimeId ?? this.trainingTimeId,
        schoolYearId: schoolYearId ?? this.schoolYearId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  GroupData copyWithCompanion(GroupCompanion data) {
    return GroupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      trainingTimeId: data.trainingTimeId.present
          ? data.trainingTimeId.value
          : this.trainingTimeId,
      schoolYearId: data.schoolYearId.present
          ? data.schoolYearId.value
          : this.schoolYearId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('trainingTimeId: $trainingTimeId, ')
          ..write('schoolYearId: $schoolYearId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, trainingTimeId,
      schoolYearId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.trainingTimeId == this.trainingTimeId &&
          other.schoolYearId == this.schoolYearId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class GroupCompanion extends UpdateCompanion<GroupData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> trainingTimeId;
  final Value<String> schoolYearId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const GroupCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.trainingTimeId = const Value.absent(),
    this.schoolYearId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required String trainingTimeId,
    required String schoolYearId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        trainingTimeId = Value(trainingTimeId),
        schoolYearId = Value(schoolYearId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GroupData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? trainingTimeId,
    Expression<String>? schoolYearId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (trainingTimeId != null) 'training_time_id': trainingTimeId,
      if (schoolYearId != null) 'school_year_id': schoolYearId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? trainingTimeId,
      Value<String>? schoolYearId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return GroupCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      trainingTimeId: trainingTimeId ?? this.trainingTimeId,
      schoolYearId: schoolYearId ?? this.schoolYearId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (trainingTimeId.present) {
      map['training_time_id'] = Variable<String>(trainingTimeId.value);
    }
    if (schoolYearId.present) {
      map['school_year_id'] = Variable<String>(schoolYearId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('trainingTimeId: $trainingTimeId, ')
          ..write('schoolYearId: $schoolYearId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GuardianTable extends Guardian
    with TableInfo<$GuardianTable, GuardianData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuardianTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, email, phone, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guardian';
  @override
  VerificationContext validateIntegrity(Insertable<GuardianData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GuardianData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuardianData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $GuardianTable createAlias(String alias) {
    return $GuardianTable(attachedDatabase, alias);
  }
}

class GuardianData extends DataClass implements Insertable<GuardianData> {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const GuardianData(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  GuardianCompanion toCompanion(bool nullToAbsent) {
    return GuardianCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email: Value(email),
      phone: Value(phone),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory GuardianData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuardianData(
      id: serializer.fromJson<String>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  GuardianData copyWith(
          {String? id,
          String? firstName,
          String? lastName,
          String? email,
          String? phone,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      GuardianData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  GuardianData copyWithCompanion(GuardianCompanion data) {
    return GuardianData(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuardianData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, firstName, lastName, email, phone, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuardianData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class GuardianCompanion extends UpdateCompanion<GuardianData> {
  final Value<String> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String> phone;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const GuardianCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GuardianCompanion.insert({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        firstName = Value(firstName),
        lastName = Value(lastName),
        email = Value(email),
        phone = Value(phone),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GuardianData> custom({
    Expression<String>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GuardianCompanion copyWith(
      {Value<String>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? email,
      Value<String>? phone,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return GuardianCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuardianCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemTypeTable extends ItemType
    with TableInfo<$ItemTypeTable, ItemTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTypeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_type';
  @override
  VerificationContext validateIntegrity(Insertable<ItemTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemTypeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ItemTypeTable createAlias(String alias) {
    return $ItemTypeTable(attachedDatabase, alias);
  }
}

class ItemTypeData extends DataClass implements Insertable<ItemTypeData> {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ItemTypeData(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ItemTypeCompanion toCompanion(bool nullToAbsent) {
    return ItemTypeCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ItemTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemTypeData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ItemTypeData copyWith(
          {String? id,
          String? name,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ItemTypeData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ItemTypeData copyWithCompanion(ItemTypeCompanion data) {
    return ItemTypeData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemTypeData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemTypeData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ItemTypeCompanion extends UpdateCompanion<ItemTypeData> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ItemTypeCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemTypeCompanion.insert({
    required String id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ItemTypeData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemTypeCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ItemTypeCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTypeCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemTable extends Item with TableInfo<$ItemTable, ItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemTypeIdMeta =
      const VerificationMeta('itemTypeId');
  @override
  late final GeneratedColumn<String> itemTypeId = GeneratedColumn<String>(
      'item_type_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _athleteIdMeta =
      const VerificationMeta('athleteId');
  @override
  late final GeneratedColumn<String> athleteId = GeneratedColumn<String>(
      'athlete_id', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        image,
        count,
        itemTypeId,
        athleteId,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item';
  @override
  VerificationContext validateIntegrity(Insertable<ItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('item_type_id')) {
      context.handle(
          _itemTypeIdMeta,
          itemTypeId.isAcceptableOrUnknown(
              data['item_type_id']!, _itemTypeIdMeta));
    } else if (isInserting) {
      context.missing(_itemTypeIdMeta);
    }
    if (data.containsKey('athlete_id')) {
      context.handle(_athleteIdMeta,
          athleteId.isAcceptableOrUnknown(data['athlete_id']!, _athleteIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      count: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
      itemTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_type_id'])!,
      athleteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}athlete_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ItemTable createAlias(String alias) {
    return $ItemTable(attachedDatabase, alias);
  }
}

class ItemData extends DataClass implements Insertable<ItemData> {
  final String id;
  final String name;
  final String? description;
  final String? image;
  final int count;
  final String itemTypeId;
  final String? athleteId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ItemData(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      required this.count,
      required this.itemTypeId,
      this.athleteId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['count'] = Variable<int>(count);
    map['item_type_id'] = Variable<String>(itemTypeId);
    if (!nullToAbsent || athleteId != null) {
      map['athlete_id'] = Variable<String>(athleteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ItemCompanion toCompanion(bool nullToAbsent) {
    return ItemCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      count: Value(count),
      itemTypeId: Value(itemTypeId),
      athleteId: athleteId == null && nullToAbsent
          ? const Value.absent()
          : Value(athleteId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      count: serializer.fromJson<int>(json['count']),
      itemTypeId: serializer.fromJson<String>(json['itemTypeId']),
      athleteId: serializer.fromJson<String?>(json['athleteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
      'count': serializer.toJson<int>(count),
      'itemTypeId': serializer.toJson<String>(itemTypeId),
      'athleteId': serializer.toJson<String?>(athleteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ItemData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> image = const Value.absent(),
          int? count,
          String? itemTypeId,
          Value<String?> athleteId = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ItemData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
        count: count ?? this.count,
        itemTypeId: itemTypeId ?? this.itemTypeId,
        athleteId: athleteId.present ? athleteId.value : this.athleteId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ItemData copyWithCompanion(ItemCompanion data) {
    return ItemData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      count: data.count.present ? data.count.value : this.count,
      itemTypeId:
          data.itemTypeId.present ? data.itemTypeId.value : this.itemTypeId,
      athleteId: data.athleteId.present ? data.athleteId.value : this.athleteId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('count: $count, ')
          ..write('itemTypeId: $itemTypeId, ')
          ..write('athleteId: $athleteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, image, count,
      itemTypeId, athleteId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.image == this.image &&
          other.count == this.count &&
          other.itemTypeId == this.itemTypeId &&
          other.athleteId == this.athleteId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ItemCompanion extends UpdateCompanion<ItemData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> image;
  final Value<int> count;
  final Value<String> itemTypeId;
  final Value<String?> athleteId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ItemCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.count = const Value.absent(),
    this.itemTypeId = const Value.absent(),
    this.athleteId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    required int count,
    required String itemTypeId,
    this.athleteId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        count = Value(count),
        itemTypeId = Value(itemTypeId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ItemData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? image,
    Expression<int>? count,
    Expression<String>? itemTypeId,
    Expression<String>? athleteId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (count != null) 'count': count,
      if (itemTypeId != null) 'item_type_id': itemTypeId,
      if (athleteId != null) 'athlete_id': athleteId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? image,
      Value<int>? count,
      Value<String>? itemTypeId,
      Value<String?>? athleteId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ItemCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      count: count ?? this.count,
      itemTypeId: itemTypeId ?? this.itemTypeId,
      athleteId: athleteId ?? this.athleteId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (itemTypeId.present) {
      map['item_type_id'] = Variable<String>(itemTypeId.value);
    }
    if (athleteId.present) {
      map['athlete_id'] = Variable<String>(athleteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('count: $count, ')
          ..write('itemTypeId: $itemTypeId, ')
          ..write('athleteId: $athleteId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MeetEventTable extends MeetEvent
    with TableInfo<$MeetEventTable, MeetEventData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeetEventTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _meetIdMeta = const VerificationMeta('meetId');
  @override
  late final GeneratedColumn<String> meetId = GeneratedColumn<String>(
      'meet_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _meetTypeMeta =
      const VerificationMeta('meetType');
  @override
  late final GeneratedColumn<String> meetType = GeneratedColumn<String>(
      'meet_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _disciplineIdMeta =
      const VerificationMeta('disciplineId');
  @override
  late final GeneratedColumn<int> disciplineId = GeneratedColumn<int>(
      'discipline_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startAtMeta =
      const VerificationMeta('startAt');
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
      'start_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _phaseMeta = const VerificationMeta('phase');
  @override
  late final GeneratedColumn<String> phase = GeneratedColumn<String>(
      'phase', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        meetId,
        meetType,
        disciplineId,
        categoryId,
        startAt,
        phase,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meet_event';
  @override
  VerificationContext validateIntegrity(Insertable<MeetEventData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('meet_id')) {
      context.handle(_meetIdMeta,
          meetId.isAcceptableOrUnknown(data['meet_id']!, _meetIdMeta));
    } else if (isInserting) {
      context.missing(_meetIdMeta);
    }
    if (data.containsKey('meet_type')) {
      context.handle(_meetTypeMeta,
          meetType.isAcceptableOrUnknown(data['meet_type']!, _meetTypeMeta));
    } else if (isInserting) {
      context.missing(_meetTypeMeta);
    }
    if (data.containsKey('discipline_id')) {
      context.handle(
          _disciplineIdMeta,
          disciplineId.isAcceptableOrUnknown(
              data['discipline_id']!, _disciplineIdMeta));
    } else if (isInserting) {
      context.missing(_disciplineIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(_startAtMeta,
          startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta));
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('phase')) {
      context.handle(
          _phaseMeta, phase.isAcceptableOrUnknown(data['phase']!, _phaseMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MeetEventData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeetEventData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      meetId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meet_id'])!,
      meetType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meet_type'])!,
      disciplineId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}discipline_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      startAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_at'])!,
      phase: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phase']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $MeetEventTable createAlias(String alias) {
    return $MeetEventTable(attachedDatabase, alias);
  }
}

class MeetEventData extends DataClass implements Insertable<MeetEventData> {
  final String id;
  final String meetId;
  final String meetType;
  final int disciplineId;
  final int categoryId;
  final DateTime startAt;
  final String? phase;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  const MeetEventData(
      {required this.id,
      required this.meetId,
      required this.meetType,
      required this.disciplineId,
      required this.categoryId,
      required this.startAt,
      this.phase,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['meet_id'] = Variable<String>(meetId);
    map['meet_type'] = Variable<String>(meetType);
    map['discipline_id'] = Variable<int>(disciplineId);
    map['category_id'] = Variable<int>(categoryId);
    map['start_at'] = Variable<DateTime>(startAt);
    if (!nullToAbsent || phase != null) {
      map['phase'] = Variable<String>(phase);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MeetEventCompanion toCompanion(bool nullToAbsent) {
    return MeetEventCompanion(
      id: Value(id),
      meetId: Value(meetId),
      meetType: Value(meetType),
      disciplineId: Value(disciplineId),
      categoryId: Value(categoryId),
      startAt: Value(startAt),
      phase:
          phase == null && nullToAbsent ? const Value.absent() : Value(phase),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory MeetEventData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeetEventData(
      id: serializer.fromJson<String>(json['id']),
      meetId: serializer.fromJson<String>(json['meetId']),
      meetType: serializer.fromJson<String>(json['meetType']),
      disciplineId: serializer.fromJson<int>(json['disciplineId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      startAt: serializer.fromJson<DateTime>(json['startAt']),
      phase: serializer.fromJson<String?>(json['phase']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'meetId': serializer.toJson<String>(meetId),
      'meetType': serializer.toJson<String>(meetType),
      'disciplineId': serializer.toJson<int>(disciplineId),
      'categoryId': serializer.toJson<int>(categoryId),
      'startAt': serializer.toJson<DateTime>(startAt),
      'phase': serializer.toJson<String?>(phase),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  MeetEventData copyWith(
          {String? id,
          String? meetId,
          String? meetType,
          int? disciplineId,
          int? categoryId,
          DateTime? startAt,
          Value<String?> phase = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      MeetEventData(
        id: id ?? this.id,
        meetId: meetId ?? this.meetId,
        meetType: meetType ?? this.meetType,
        disciplineId: disciplineId ?? this.disciplineId,
        categoryId: categoryId ?? this.categoryId,
        startAt: startAt ?? this.startAt,
        phase: phase.present ? phase.value : this.phase,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  MeetEventData copyWithCompanion(MeetEventCompanion data) {
    return MeetEventData(
      id: data.id.present ? data.id.value : this.id,
      meetId: data.meetId.present ? data.meetId.value : this.meetId,
      meetType: data.meetType.present ? data.meetType.value : this.meetType,
      disciplineId: data.disciplineId.present
          ? data.disciplineId.value
          : this.disciplineId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      phase: data.phase.present ? data.phase.value : this.phase,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeetEventData(')
          ..write('id: $id, ')
          ..write('meetId: $meetId, ')
          ..write('meetType: $meetType, ')
          ..write('disciplineId: $disciplineId, ')
          ..write('categoryId: $categoryId, ')
          ..write('startAt: $startAt, ')
          ..write('phase: $phase, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, meetId, meetType, disciplineId,
      categoryId, startAt, phase, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeetEventData &&
          other.id == this.id &&
          other.meetId == this.meetId &&
          other.meetType == this.meetType &&
          other.disciplineId == this.disciplineId &&
          other.categoryId == this.categoryId &&
          other.startAt == this.startAt &&
          other.phase == this.phase &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class MeetEventCompanion extends UpdateCompanion<MeetEventData> {
  final Value<String> id;
  final Value<String> meetId;
  final Value<String> meetType;
  final Value<int> disciplineId;
  final Value<int> categoryId;
  final Value<DateTime> startAt;
  final Value<String?> phase;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MeetEventCompanion({
    this.id = const Value.absent(),
    this.meetId = const Value.absent(),
    this.meetType = const Value.absent(),
    this.disciplineId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.startAt = const Value.absent(),
    this.phase = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MeetEventCompanion.insert({
    required String id,
    required String meetId,
    required String meetType,
    required int disciplineId,
    required int categoryId,
    required DateTime startAt,
    this.phase = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        meetId = Value(meetId),
        meetType = Value(meetType),
        disciplineId = Value(disciplineId),
        categoryId = Value(categoryId),
        startAt = Value(startAt);
  static Insertable<MeetEventData> custom({
    Expression<String>? id,
    Expression<String>? meetId,
    Expression<String>? meetType,
    Expression<int>? disciplineId,
    Expression<int>? categoryId,
    Expression<DateTime>? startAt,
    Expression<String>? phase,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (meetId != null) 'meet_id': meetId,
      if (meetType != null) 'meet_type': meetType,
      if (disciplineId != null) 'discipline_id': disciplineId,
      if (categoryId != null) 'category_id': categoryId,
      if (startAt != null) 'start_at': startAt,
      if (phase != null) 'phase': phase,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MeetEventCompanion copyWith(
      {Value<String>? id,
      Value<String>? meetId,
      Value<String>? meetType,
      Value<int>? disciplineId,
      Value<int>? categoryId,
      Value<DateTime>? startAt,
      Value<String?>? phase,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return MeetEventCompanion(
      id: id ?? this.id,
      meetId: meetId ?? this.meetId,
      meetType: meetType ?? this.meetType,
      disciplineId: disciplineId ?? this.disciplineId,
      categoryId: categoryId ?? this.categoryId,
      startAt: startAt ?? this.startAt,
      phase: phase ?? this.phase,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (meetId.present) {
      map['meet_id'] = Variable<String>(meetId.value);
    }
    if (meetType.present) {
      map['meet_type'] = Variable<String>(meetType.value);
    }
    if (disciplineId.present) {
      map['discipline_id'] = Variable<int>(disciplineId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (phase.present) {
      map['phase'] = Variable<String>(phase.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeetEventCompanion(')
          ..write('id: $id, ')
          ..write('meetId: $meetId, ')
          ..write('meetType: $meetType, ')
          ..write('disciplineId: $disciplineId, ')
          ..write('categoryId: $categoryId, ')
          ..write('startAt: $startAt, ')
          ..write('phase: $phase, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MeetTable extends Meet with TableInfo<$MeetTable, MeetData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeetTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startAtMeta =
      const VerificationMeta('startAt');
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
      'start_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
      'end_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _organizerMeta =
      const VerificationMeta('organizer');
  @override
  late final GeneratedColumn<String> organizer = GeneratedColumn<String>(
      'organizer', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        startAt,
        endAt,
        location,
        organizer,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meet';
  @override
  VerificationContext validateIntegrity(Insertable<MeetData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start_at')) {
      context.handle(_startAtMeta,
          startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta));
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
          _endAtMeta, endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta));
    } else if (isInserting) {
      context.missing(_endAtMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('organizer')) {
      context.handle(_organizerMeta,
          organizer.isAcceptableOrUnknown(data['organizer']!, _organizerMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MeetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeetData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      startAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_at'])!,
      endAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_at'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      organizer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}organizer']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $MeetTable createAlias(String alias) {
    return $MeetTable(attachedDatabase, alias);
  }
}

class MeetData extends DataClass implements Insertable<MeetData> {
  final String id;
  final String name;
  final DateTime startAt;
  final DateTime endAt;
  final String? location;
  final String? organizer;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const MeetData(
      {required this.id,
      required this.name,
      required this.startAt,
      required this.endAt,
      this.location,
      this.organizer,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['start_at'] = Variable<DateTime>(startAt);
    map['end_at'] = Variable<DateTime>(endAt);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || organizer != null) {
      map['organizer'] = Variable<String>(organizer);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  MeetCompanion toCompanion(bool nullToAbsent) {
    return MeetCompanion(
      id: Value(id),
      name: Value(name),
      startAt: Value(startAt),
      endAt: Value(endAt),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      organizer: organizer == null && nullToAbsent
          ? const Value.absent()
          : Value(organizer),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory MeetData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeetData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      startAt: serializer.fromJson<DateTime>(json['startAt']),
      endAt: serializer.fromJson<DateTime>(json['endAt']),
      location: serializer.fromJson<String?>(json['location']),
      organizer: serializer.fromJson<String?>(json['organizer']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'startAt': serializer.toJson<DateTime>(startAt),
      'endAt': serializer.toJson<DateTime>(endAt),
      'location': serializer.toJson<String?>(location),
      'organizer': serializer.toJson<String?>(organizer),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  MeetData copyWith(
          {String? id,
          String? name,
          DateTime? startAt,
          DateTime? endAt,
          Value<String?> location = const Value.absent(),
          Value<String?> organizer = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      MeetData(
        id: id ?? this.id,
        name: name ?? this.name,
        startAt: startAt ?? this.startAt,
        endAt: endAt ?? this.endAt,
        location: location.present ? location.value : this.location,
        organizer: organizer.present ? organizer.value : this.organizer,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  MeetData copyWithCompanion(MeetCompanion data) {
    return MeetData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
      location: data.location.present ? data.location.value : this.location,
      organizer: data.organizer.present ? data.organizer.value : this.organizer,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeetData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
          ..write('location: $location, ')
          ..write('organizer: $organizer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, startAt, endAt, location, organizer,
      createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeetData &&
          other.id == this.id &&
          other.name == this.name &&
          other.startAt == this.startAt &&
          other.endAt == this.endAt &&
          other.location == this.location &&
          other.organizer == this.organizer &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class MeetCompanion extends UpdateCompanion<MeetData> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> startAt;
  final Value<DateTime> endAt;
  final Value<String?> location;
  final Value<String?> organizer;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const MeetCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.startAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.location = const Value.absent(),
    this.organizer = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MeetCompanion.insert({
    required String id,
    required String name,
    required DateTime startAt,
    required DateTime endAt,
    this.location = const Value.absent(),
    this.organizer = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        startAt = Value(startAt),
        endAt = Value(endAt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<MeetData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? startAt,
    Expression<DateTime>? endAt,
    Expression<String>? location,
    Expression<String>? organizer,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (startAt != null) 'start_at': startAt,
      if (endAt != null) 'end_at': endAt,
      if (location != null) 'location': location,
      if (organizer != null) 'organizer': organizer,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MeetCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? startAt,
      Value<DateTime>? endAt,
      Value<String?>? location,
      Value<String?>? organizer,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return MeetCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      location: location ?? this.location,
      organizer: organizer ?? this.organizer,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (organizer.present) {
      map['organizer'] = Variable<String>(organizer.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeetCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
          ..write('location: $location, ')
          ..write('organizer: $organizer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemoteConfigTable extends RemoteConfig
    with TableInfo<$RemoteConfigTable, RemoteConfigData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemoteConfigTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _urgentMessageMeta =
      const VerificationMeta('urgentMessage');
  @override
  late final GeneratedColumn<String> urgentMessage = GeneratedColumn<String>(
      'urgent_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _minimumAppVersionMeta =
      const VerificationMeta('minimumAppVersion');
  @override
  late final GeneratedColumn<String> minimumAppVersion =
      GeneratedColumn<String>('minimum_app_version', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, urgentMessage, minimumAppVersion, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'remote_config';
  @override
  VerificationContext validateIntegrity(Insertable<RemoteConfigData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('urgent_message')) {
      context.handle(
          _urgentMessageMeta,
          urgentMessage.isAcceptableOrUnknown(
              data['urgent_message']!, _urgentMessageMeta));
    }
    if (data.containsKey('minimum_app_version')) {
      context.handle(
          _minimumAppVersionMeta,
          minimumAppVersion.isAcceptableOrUnknown(
              data['minimum_app_version']!, _minimumAppVersionMeta));
    } else if (isInserting) {
      context.missing(_minimumAppVersionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RemoteConfigData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RemoteConfigData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      urgentMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}urgent_message']),
      minimumAppVersion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}minimum_app_version'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $RemoteConfigTable createAlias(String alias) {
    return $RemoteConfigTable(attachedDatabase, alias);
  }
}

class RemoteConfigData extends DataClass
    implements Insertable<RemoteConfigData> {
  final int id;
  final String? urgentMessage;
  final String minimumAppVersion;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const RemoteConfigData(
      {required this.id,
      this.urgentMessage,
      required this.minimumAppVersion,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || urgentMessage != null) {
      map['urgent_message'] = Variable<String>(urgentMessage);
    }
    map['minimum_app_version'] = Variable<String>(minimumAppVersion);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  RemoteConfigCompanion toCompanion(bool nullToAbsent) {
    return RemoteConfigCompanion(
      id: Value(id),
      urgentMessage: urgentMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(urgentMessage),
      minimumAppVersion: Value(minimumAppVersion),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory RemoteConfigData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RemoteConfigData(
      id: serializer.fromJson<int>(json['id']),
      urgentMessage: serializer.fromJson<String?>(json['urgentMessage']),
      minimumAppVersion: serializer.fromJson<String>(json['minimumAppVersion']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'urgentMessage': serializer.toJson<String?>(urgentMessage),
      'minimumAppVersion': serializer.toJson<String>(minimumAppVersion),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  RemoteConfigData copyWith(
          {int? id,
          Value<String?> urgentMessage = const Value.absent(),
          String? minimumAppVersion,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      RemoteConfigData(
        id: id ?? this.id,
        urgentMessage:
            urgentMessage.present ? urgentMessage.value : this.urgentMessage,
        minimumAppVersion: minimumAppVersion ?? this.minimumAppVersion,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  RemoteConfigData copyWithCompanion(RemoteConfigCompanion data) {
    return RemoteConfigData(
      id: data.id.present ? data.id.value : this.id,
      urgentMessage: data.urgentMessage.present
          ? data.urgentMessage.value
          : this.urgentMessage,
      minimumAppVersion: data.minimumAppVersion.present
          ? data.minimumAppVersion.value
          : this.minimumAppVersion,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RemoteConfigData(')
          ..write('id: $id, ')
          ..write('urgentMessage: $urgentMessage, ')
          ..write('minimumAppVersion: $minimumAppVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, urgentMessage, minimumAppVersion, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RemoteConfigData &&
          other.id == this.id &&
          other.urgentMessage == this.urgentMessage &&
          other.minimumAppVersion == this.minimumAppVersion &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class RemoteConfigCompanion extends UpdateCompanion<RemoteConfigData> {
  final Value<int> id;
  final Value<String?> urgentMessage;
  final Value<String> minimumAppVersion;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const RemoteConfigCompanion({
    this.id = const Value.absent(),
    this.urgentMessage = const Value.absent(),
    this.minimumAppVersion = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  RemoteConfigCompanion.insert({
    this.id = const Value.absent(),
    this.urgentMessage = const Value.absent(),
    required String minimumAppVersion,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : minimumAppVersion = Value(minimumAppVersion),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<RemoteConfigData> custom({
    Expression<int>? id,
    Expression<String>? urgentMessage,
    Expression<String>? minimumAppVersion,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (urgentMessage != null) 'urgent_message': urgentMessage,
      if (minimumAppVersion != null) 'minimum_app_version': minimumAppVersion,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  RemoteConfigCompanion copyWith(
      {Value<int>? id,
      Value<String?>? urgentMessage,
      Value<String>? minimumAppVersion,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return RemoteConfigCompanion(
      id: id ?? this.id,
      urgentMessage: urgentMessage ?? this.urgentMessage,
      minimumAppVersion: minimumAppVersion ?? this.minimumAppVersion,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (urgentMessage.present) {
      map['urgent_message'] = Variable<String>(urgentMessage.value);
    }
    if (minimumAppVersion.present) {
      map['minimum_app_version'] = Variable<String>(minimumAppVersion.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemoteConfigCompanion(')
          ..write('id: $id, ')
          ..write('urgentMessage: $urgentMessage, ')
          ..write('minimumAppVersion: $minimumAppVersion, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $SchoolYearTable extends SchoolYear
    with TableInfo<$SchoolYearTable, SchoolYearData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchoolYearTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'school_year';
  @override
  VerificationContext validateIntegrity(Insertable<SchoolYearData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchoolYearData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchoolYearData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $SchoolYearTable createAlias(String alias) {
    return $SchoolYearTable(attachedDatabase, alias);
  }
}

class SchoolYearData extends DataClass implements Insertable<SchoolYearData> {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const SchoolYearData(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  SchoolYearCompanion toCompanion(bool nullToAbsent) {
    return SchoolYearCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory SchoolYearData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchoolYearData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  SchoolYearData copyWith(
          {String? id,
          String? name,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      SchoolYearData(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  SchoolYearData copyWithCompanion(SchoolYearCompanion data) {
    return SchoolYearData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchoolYearData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchoolYearData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class SchoolYearCompanion extends UpdateCompanion<SchoolYearData> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const SchoolYearCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SchoolYearCompanion.insert({
    required String id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SchoolYearData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SchoolYearCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return SchoolYearCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchoolYearCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SignUpFormStatusTable extends SignUpFormStatus
    with TableInfo<$SignUpFormStatusTable, SignUpFormStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SignUpFormStatusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sign_up_form_status';
  @override
  VerificationContext validateIntegrity(
      Insertable<SignUpFormStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SignUpFormStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SignUpFormStatusData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $SignUpFormStatusTable createAlias(String alias) {
    return $SignUpFormStatusTable(attachedDatabase, alias);
  }
}

class SignUpFormStatusData extends DataClass
    implements Insertable<SignUpFormStatusData> {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const SignUpFormStatusData(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  SignUpFormStatusCompanion toCompanion(bool nullToAbsent) {
    return SignUpFormStatusCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory SignUpFormStatusData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SignUpFormStatusData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  SignUpFormStatusData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      SignUpFormStatusData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  SignUpFormStatusData copyWithCompanion(SignUpFormStatusCompanion data) {
    return SignUpFormStatusData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SignUpFormStatusData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignUpFormStatusData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class SignUpFormStatusCompanion extends UpdateCompanion<SignUpFormStatusData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const SignUpFormStatusCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SignUpFormStatusCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SignUpFormStatusData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SignUpFormStatusCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return SignUpFormStatusCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SignUpFormStatusCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SignUpFormTable extends SignUpForm
    with TableInfo<$SignUpFormTable, SignUpFormData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SignUpFormTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _birthNumberMeta =
      const VerificationMeta('birthNumber');
  @override
  late final GeneratedColumn<String> birthNumber = GeneratedColumn<String>(
      'birth_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _zipMeta = const VerificationMeta('zip');
  @override
  late final GeneratedColumn<String> zip = GeneratedColumn<String>(
      'zip', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianFirstName1Meta =
      const VerificationMeta('guardianFirstName1');
  @override
  late final GeneratedColumn<String> guardianFirstName1 =
      GeneratedColumn<String>('guardian_first_name1', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _guardianLastName1Meta =
      const VerificationMeta('guardianLastName1');
  @override
  late final GeneratedColumn<String> guardianLastName1 =
      GeneratedColumn<String>('guardian_last_name1', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _guardianFirstName2Meta =
      const VerificationMeta('guardianFirstName2');
  @override
  late final GeneratedColumn<String> guardianFirstName2 =
      GeneratedColumn<String>('guardian_first_name2', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianLastName2Meta =
      const VerificationMeta('guardianLastName2');
  @override
  late final GeneratedColumn<String> guardianLastName2 =
      GeneratedColumn<String>('guardian_last_name2', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianPhone1Meta =
      const VerificationMeta('guardianPhone1');
  @override
  late final GeneratedColumn<String> guardianPhone1 = GeneratedColumn<String>(
      'guardian_phone1', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _guardianEmail1Meta =
      const VerificationMeta('guardianEmail1');
  @override
  late final GeneratedColumn<String> guardianEmail1 = GeneratedColumn<String>(
      'guardian_email1', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _guardianPhone2Meta =
      const VerificationMeta('guardianPhone2');
  @override
  late final GeneratedColumn<String> guardianPhone2 = GeneratedColumn<String>(
      'guardian_phone2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianEmail2Meta =
      const VerificationMeta('guardianEmail2');
  @override
  late final GeneratedColumn<String> guardianEmail2 = GeneratedColumn<String>(
      'guardian_email2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _signUpFormStatusIdMeta =
      const VerificationMeta('signUpFormStatusId');
  @override
  late final GeneratedColumn<String> signUpFormStatusId =
      GeneratedColumn<String>('sign_up_form_status_id', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 36, maxTextLength: 36),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _schoolYearIdMeta =
      const VerificationMeta('schoolYearId');
  @override
  late final GeneratedColumn<String> schoolYearId = GeneratedColumn<String>(
      'school_year_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        birthNumber,
        firstName,
        lastName,
        street,
        city,
        zip,
        email,
        phone,
        guardianFirstName1,
        guardianLastName1,
        guardianFirstName2,
        guardianLastName2,
        guardianPhone1,
        guardianEmail1,
        guardianPhone2,
        guardianEmail2,
        note,
        signUpFormStatusId,
        schoolYearId,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sign_up_form';
  @override
  VerificationContext validateIntegrity(Insertable<SignUpFormData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('birth_number')) {
      context.handle(
          _birthNumberMeta,
          birthNumber.isAcceptableOrUnknown(
              data['birth_number']!, _birthNumberMeta));
    } else if (isInserting) {
      context.missing(_birthNumberMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('zip')) {
      context.handle(
          _zipMeta, zip.isAcceptableOrUnknown(data['zip']!, _zipMeta));
    } else if (isInserting) {
      context.missing(_zipMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('guardian_first_name1')) {
      context.handle(
          _guardianFirstName1Meta,
          guardianFirstName1.isAcceptableOrUnknown(
              data['guardian_first_name1']!, _guardianFirstName1Meta));
    } else if (isInserting) {
      context.missing(_guardianFirstName1Meta);
    }
    if (data.containsKey('guardian_last_name1')) {
      context.handle(
          _guardianLastName1Meta,
          guardianLastName1.isAcceptableOrUnknown(
              data['guardian_last_name1']!, _guardianLastName1Meta));
    } else if (isInserting) {
      context.missing(_guardianLastName1Meta);
    }
    if (data.containsKey('guardian_first_name2')) {
      context.handle(
          _guardianFirstName2Meta,
          guardianFirstName2.isAcceptableOrUnknown(
              data['guardian_first_name2']!, _guardianFirstName2Meta));
    }
    if (data.containsKey('guardian_last_name2')) {
      context.handle(
          _guardianLastName2Meta,
          guardianLastName2.isAcceptableOrUnknown(
              data['guardian_last_name2']!, _guardianLastName2Meta));
    }
    if (data.containsKey('guardian_phone1')) {
      context.handle(
          _guardianPhone1Meta,
          guardianPhone1.isAcceptableOrUnknown(
              data['guardian_phone1']!, _guardianPhone1Meta));
    } else if (isInserting) {
      context.missing(_guardianPhone1Meta);
    }
    if (data.containsKey('guardian_email1')) {
      context.handle(
          _guardianEmail1Meta,
          guardianEmail1.isAcceptableOrUnknown(
              data['guardian_email1']!, _guardianEmail1Meta));
    } else if (isInserting) {
      context.missing(_guardianEmail1Meta);
    }
    if (data.containsKey('guardian_phone2')) {
      context.handle(
          _guardianPhone2Meta,
          guardianPhone2.isAcceptableOrUnknown(
              data['guardian_phone2']!, _guardianPhone2Meta));
    }
    if (data.containsKey('guardian_email2')) {
      context.handle(
          _guardianEmail2Meta,
          guardianEmail2.isAcceptableOrUnknown(
              data['guardian_email2']!, _guardianEmail2Meta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('sign_up_form_status_id')) {
      context.handle(
          _signUpFormStatusIdMeta,
          signUpFormStatusId.isAcceptableOrUnknown(
              data['sign_up_form_status_id']!, _signUpFormStatusIdMeta));
    } else if (isInserting) {
      context.missing(_signUpFormStatusIdMeta);
    }
    if (data.containsKey('school_year_id')) {
      context.handle(
          _schoolYearIdMeta,
          schoolYearId.isAcceptableOrUnknown(
              data['school_year_id']!, _schoolYearIdMeta));
    } else if (isInserting) {
      context.missing(_schoolYearIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SignUpFormData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SignUpFormData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      birthNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}birth_number'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      zip: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zip'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      guardianFirstName1: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_first_name1'])!,
      guardianLastName1: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_last_name1'])!,
      guardianFirstName2: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_first_name2']),
      guardianLastName2: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_last_name2']),
      guardianPhone1: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_phone1'])!,
      guardianEmail1: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_email1'])!,
      guardianPhone2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_phone2']),
      guardianEmail2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_email2']),
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      signUpFormStatusId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}sign_up_form_status_id'])!,
      schoolYearId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}school_year_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $SignUpFormTable createAlias(String alias) {
    return $SignUpFormTable(attachedDatabase, alias);
  }
}

class SignUpFormData extends DataClass implements Insertable<SignUpFormData> {
  final String id;
  final String birthNumber;
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String zip;
  final String? email;
  final String? phone;
  final String guardianFirstName1;
  final String guardianLastName1;
  final String? guardianFirstName2;
  final String? guardianLastName2;
  final String guardianPhone1;
  final String guardianEmail1;
  final String? guardianPhone2;
  final String? guardianEmail2;
  final String? note;
  final String signUpFormStatusId;
  final String schoolYearId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const SignUpFormData(
      {required this.id,
      required this.birthNumber,
      required this.firstName,
      required this.lastName,
      required this.street,
      required this.city,
      required this.zip,
      this.email,
      this.phone,
      required this.guardianFirstName1,
      required this.guardianLastName1,
      this.guardianFirstName2,
      this.guardianLastName2,
      required this.guardianPhone1,
      required this.guardianEmail1,
      this.guardianPhone2,
      this.guardianEmail2,
      this.note,
      required this.signUpFormStatusId,
      required this.schoolYearId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['birth_number'] = Variable<String>(birthNumber);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['street'] = Variable<String>(street);
    map['city'] = Variable<String>(city);
    map['zip'] = Variable<String>(zip);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['guardian_first_name1'] = Variable<String>(guardianFirstName1);
    map['guardian_last_name1'] = Variable<String>(guardianLastName1);
    if (!nullToAbsent || guardianFirstName2 != null) {
      map['guardian_first_name2'] = Variable<String>(guardianFirstName2);
    }
    if (!nullToAbsent || guardianLastName2 != null) {
      map['guardian_last_name2'] = Variable<String>(guardianLastName2);
    }
    map['guardian_phone1'] = Variable<String>(guardianPhone1);
    map['guardian_email1'] = Variable<String>(guardianEmail1);
    if (!nullToAbsent || guardianPhone2 != null) {
      map['guardian_phone2'] = Variable<String>(guardianPhone2);
    }
    if (!nullToAbsent || guardianEmail2 != null) {
      map['guardian_email2'] = Variable<String>(guardianEmail2);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['sign_up_form_status_id'] = Variable<String>(signUpFormStatusId);
    map['school_year_id'] = Variable<String>(schoolYearId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  SignUpFormCompanion toCompanion(bool nullToAbsent) {
    return SignUpFormCompanion(
      id: Value(id),
      birthNumber: Value(birthNumber),
      firstName: Value(firstName),
      lastName: Value(lastName),
      street: Value(street),
      city: Value(city),
      zip: Value(zip),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      guardianFirstName1: Value(guardianFirstName1),
      guardianLastName1: Value(guardianLastName1),
      guardianFirstName2: guardianFirstName2 == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianFirstName2),
      guardianLastName2: guardianLastName2 == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianLastName2),
      guardianPhone1: Value(guardianPhone1),
      guardianEmail1: Value(guardianEmail1),
      guardianPhone2: guardianPhone2 == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianPhone2),
      guardianEmail2: guardianEmail2 == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianEmail2),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      signUpFormStatusId: Value(signUpFormStatusId),
      schoolYearId: Value(schoolYearId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory SignUpFormData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SignUpFormData(
      id: serializer.fromJson<String>(json['id']),
      birthNumber: serializer.fromJson<String>(json['birthNumber']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      street: serializer.fromJson<String>(json['street']),
      city: serializer.fromJson<String>(json['city']),
      zip: serializer.fromJson<String>(json['zip']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      guardianFirstName1:
          serializer.fromJson<String>(json['guardianFirstName1']),
      guardianLastName1: serializer.fromJson<String>(json['guardianLastName1']),
      guardianFirstName2:
          serializer.fromJson<String?>(json['guardianFirstName2']),
      guardianLastName2:
          serializer.fromJson<String?>(json['guardianLastName2']),
      guardianPhone1: serializer.fromJson<String>(json['guardianPhone1']),
      guardianEmail1: serializer.fromJson<String>(json['guardianEmail1']),
      guardianPhone2: serializer.fromJson<String?>(json['guardianPhone2']),
      guardianEmail2: serializer.fromJson<String?>(json['guardianEmail2']),
      note: serializer.fromJson<String?>(json['note']),
      signUpFormStatusId:
          serializer.fromJson<String>(json['signUpFormStatusId']),
      schoolYearId: serializer.fromJson<String>(json['schoolYearId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'birthNumber': serializer.toJson<String>(birthNumber),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'street': serializer.toJson<String>(street),
      'city': serializer.toJson<String>(city),
      'zip': serializer.toJson<String>(zip),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'guardianFirstName1': serializer.toJson<String>(guardianFirstName1),
      'guardianLastName1': serializer.toJson<String>(guardianLastName1),
      'guardianFirstName2': serializer.toJson<String?>(guardianFirstName2),
      'guardianLastName2': serializer.toJson<String?>(guardianLastName2),
      'guardianPhone1': serializer.toJson<String>(guardianPhone1),
      'guardianEmail1': serializer.toJson<String>(guardianEmail1),
      'guardianPhone2': serializer.toJson<String?>(guardianPhone2),
      'guardianEmail2': serializer.toJson<String?>(guardianEmail2),
      'note': serializer.toJson<String?>(note),
      'signUpFormStatusId': serializer.toJson<String>(signUpFormStatusId),
      'schoolYearId': serializer.toJson<String>(schoolYearId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  SignUpFormData copyWith(
          {String? id,
          String? birthNumber,
          String? firstName,
          String? lastName,
          String? street,
          String? city,
          String? zip,
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          String? guardianFirstName1,
          String? guardianLastName1,
          Value<String?> guardianFirstName2 = const Value.absent(),
          Value<String?> guardianLastName2 = const Value.absent(),
          String? guardianPhone1,
          String? guardianEmail1,
          Value<String?> guardianPhone2 = const Value.absent(),
          Value<String?> guardianEmail2 = const Value.absent(),
          Value<String?> note = const Value.absent(),
          String? signUpFormStatusId,
          String? schoolYearId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      SignUpFormData(
        id: id ?? this.id,
        birthNumber: birthNumber ?? this.birthNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        street: street ?? this.street,
        city: city ?? this.city,
        zip: zip ?? this.zip,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        guardianFirstName1: guardianFirstName1 ?? this.guardianFirstName1,
        guardianLastName1: guardianLastName1 ?? this.guardianLastName1,
        guardianFirstName2: guardianFirstName2.present
            ? guardianFirstName2.value
            : this.guardianFirstName2,
        guardianLastName2: guardianLastName2.present
            ? guardianLastName2.value
            : this.guardianLastName2,
        guardianPhone1: guardianPhone1 ?? this.guardianPhone1,
        guardianEmail1: guardianEmail1 ?? this.guardianEmail1,
        guardianPhone2:
            guardianPhone2.present ? guardianPhone2.value : this.guardianPhone2,
        guardianEmail2:
            guardianEmail2.present ? guardianEmail2.value : this.guardianEmail2,
        note: note.present ? note.value : this.note,
        signUpFormStatusId: signUpFormStatusId ?? this.signUpFormStatusId,
        schoolYearId: schoolYearId ?? this.schoolYearId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  SignUpFormData copyWithCompanion(SignUpFormCompanion data) {
    return SignUpFormData(
      id: data.id.present ? data.id.value : this.id,
      birthNumber:
          data.birthNumber.present ? data.birthNumber.value : this.birthNumber,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      street: data.street.present ? data.street.value : this.street,
      city: data.city.present ? data.city.value : this.city,
      zip: data.zip.present ? data.zip.value : this.zip,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      guardianFirstName1: data.guardianFirstName1.present
          ? data.guardianFirstName1.value
          : this.guardianFirstName1,
      guardianLastName1: data.guardianLastName1.present
          ? data.guardianLastName1.value
          : this.guardianLastName1,
      guardianFirstName2: data.guardianFirstName2.present
          ? data.guardianFirstName2.value
          : this.guardianFirstName2,
      guardianLastName2: data.guardianLastName2.present
          ? data.guardianLastName2.value
          : this.guardianLastName2,
      guardianPhone1: data.guardianPhone1.present
          ? data.guardianPhone1.value
          : this.guardianPhone1,
      guardianEmail1: data.guardianEmail1.present
          ? data.guardianEmail1.value
          : this.guardianEmail1,
      guardianPhone2: data.guardianPhone2.present
          ? data.guardianPhone2.value
          : this.guardianPhone2,
      guardianEmail2: data.guardianEmail2.present
          ? data.guardianEmail2.value
          : this.guardianEmail2,
      note: data.note.present ? data.note.value : this.note,
      signUpFormStatusId: data.signUpFormStatusId.present
          ? data.signUpFormStatusId.value
          : this.signUpFormStatusId,
      schoolYearId: data.schoolYearId.present
          ? data.schoolYearId.value
          : this.schoolYearId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SignUpFormData(')
          ..write('id: $id, ')
          ..write('birthNumber: $birthNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('zip: $zip, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('guardianFirstName1: $guardianFirstName1, ')
          ..write('guardianLastName1: $guardianLastName1, ')
          ..write('guardianFirstName2: $guardianFirstName2, ')
          ..write('guardianLastName2: $guardianLastName2, ')
          ..write('guardianPhone1: $guardianPhone1, ')
          ..write('guardianEmail1: $guardianEmail1, ')
          ..write('guardianPhone2: $guardianPhone2, ')
          ..write('guardianEmail2: $guardianEmail2, ')
          ..write('note: $note, ')
          ..write('signUpFormStatusId: $signUpFormStatusId, ')
          ..write('schoolYearId: $schoolYearId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        birthNumber,
        firstName,
        lastName,
        street,
        city,
        zip,
        email,
        phone,
        guardianFirstName1,
        guardianLastName1,
        guardianFirstName2,
        guardianLastName2,
        guardianPhone1,
        guardianEmail1,
        guardianPhone2,
        guardianEmail2,
        note,
        signUpFormStatusId,
        schoolYearId,
        createdAt,
        updatedAt,
        deletedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SignUpFormData &&
          other.id == this.id &&
          other.birthNumber == this.birthNumber &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.street == this.street &&
          other.city == this.city &&
          other.zip == this.zip &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.guardianFirstName1 == this.guardianFirstName1 &&
          other.guardianLastName1 == this.guardianLastName1 &&
          other.guardianFirstName2 == this.guardianFirstName2 &&
          other.guardianLastName2 == this.guardianLastName2 &&
          other.guardianPhone1 == this.guardianPhone1 &&
          other.guardianEmail1 == this.guardianEmail1 &&
          other.guardianPhone2 == this.guardianPhone2 &&
          other.guardianEmail2 == this.guardianEmail2 &&
          other.note == this.note &&
          other.signUpFormStatusId == this.signUpFormStatusId &&
          other.schoolYearId == this.schoolYearId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class SignUpFormCompanion extends UpdateCompanion<SignUpFormData> {
  final Value<String> id;
  final Value<String> birthNumber;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> street;
  final Value<String> city;
  final Value<String> zip;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String> guardianFirstName1;
  final Value<String> guardianLastName1;
  final Value<String?> guardianFirstName2;
  final Value<String?> guardianLastName2;
  final Value<String> guardianPhone1;
  final Value<String> guardianEmail1;
  final Value<String?> guardianPhone2;
  final Value<String?> guardianEmail2;
  final Value<String?> note;
  final Value<String> signUpFormStatusId;
  final Value<String> schoolYearId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const SignUpFormCompanion({
    this.id = const Value.absent(),
    this.birthNumber = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.street = const Value.absent(),
    this.city = const Value.absent(),
    this.zip = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.guardianFirstName1 = const Value.absent(),
    this.guardianLastName1 = const Value.absent(),
    this.guardianFirstName2 = const Value.absent(),
    this.guardianLastName2 = const Value.absent(),
    this.guardianPhone1 = const Value.absent(),
    this.guardianEmail1 = const Value.absent(),
    this.guardianPhone2 = const Value.absent(),
    this.guardianEmail2 = const Value.absent(),
    this.note = const Value.absent(),
    this.signUpFormStatusId = const Value.absent(),
    this.schoolYearId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SignUpFormCompanion.insert({
    required String id,
    required String birthNumber,
    required String firstName,
    required String lastName,
    required String street,
    required String city,
    required String zip,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    required String guardianFirstName1,
    required String guardianLastName1,
    this.guardianFirstName2 = const Value.absent(),
    this.guardianLastName2 = const Value.absent(),
    required String guardianPhone1,
    required String guardianEmail1,
    this.guardianPhone2 = const Value.absent(),
    this.guardianEmail2 = const Value.absent(),
    this.note = const Value.absent(),
    required String signUpFormStatusId,
    required String schoolYearId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        birthNumber = Value(birthNumber),
        firstName = Value(firstName),
        lastName = Value(lastName),
        street = Value(street),
        city = Value(city),
        zip = Value(zip),
        guardianFirstName1 = Value(guardianFirstName1),
        guardianLastName1 = Value(guardianLastName1),
        guardianPhone1 = Value(guardianPhone1),
        guardianEmail1 = Value(guardianEmail1),
        signUpFormStatusId = Value(signUpFormStatusId),
        schoolYearId = Value(schoolYearId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SignUpFormData> custom({
    Expression<String>? id,
    Expression<String>? birthNumber,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? street,
    Expression<String>? city,
    Expression<String>? zip,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? guardianFirstName1,
    Expression<String>? guardianLastName1,
    Expression<String>? guardianFirstName2,
    Expression<String>? guardianLastName2,
    Expression<String>? guardianPhone1,
    Expression<String>? guardianEmail1,
    Expression<String>? guardianPhone2,
    Expression<String>? guardianEmail2,
    Expression<String>? note,
    Expression<String>? signUpFormStatusId,
    Expression<String>? schoolYearId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (birthNumber != null) 'birth_number': birthNumber,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (street != null) 'street': street,
      if (city != null) 'city': city,
      if (zip != null) 'zip': zip,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (guardianFirstName1 != null)
        'guardian_first_name1': guardianFirstName1,
      if (guardianLastName1 != null) 'guardian_last_name1': guardianLastName1,
      if (guardianFirstName2 != null)
        'guardian_first_name2': guardianFirstName2,
      if (guardianLastName2 != null) 'guardian_last_name2': guardianLastName2,
      if (guardianPhone1 != null) 'guardian_phone1': guardianPhone1,
      if (guardianEmail1 != null) 'guardian_email1': guardianEmail1,
      if (guardianPhone2 != null) 'guardian_phone2': guardianPhone2,
      if (guardianEmail2 != null) 'guardian_email2': guardianEmail2,
      if (note != null) 'note': note,
      if (signUpFormStatusId != null)
        'sign_up_form_status_id': signUpFormStatusId,
      if (schoolYearId != null) 'school_year_id': schoolYearId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SignUpFormCompanion copyWith(
      {Value<String>? id,
      Value<String>? birthNumber,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? street,
      Value<String>? city,
      Value<String>? zip,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String>? guardianFirstName1,
      Value<String>? guardianLastName1,
      Value<String?>? guardianFirstName2,
      Value<String?>? guardianLastName2,
      Value<String>? guardianPhone1,
      Value<String>? guardianEmail1,
      Value<String?>? guardianPhone2,
      Value<String?>? guardianEmail2,
      Value<String?>? note,
      Value<String>? signUpFormStatusId,
      Value<String>? schoolYearId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return SignUpFormCompanion(
      id: id ?? this.id,
      birthNumber: birthNumber ?? this.birthNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      street: street ?? this.street,
      city: city ?? this.city,
      zip: zip ?? this.zip,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      guardianFirstName1: guardianFirstName1 ?? this.guardianFirstName1,
      guardianLastName1: guardianLastName1 ?? this.guardianLastName1,
      guardianFirstName2: guardianFirstName2 ?? this.guardianFirstName2,
      guardianLastName2: guardianLastName2 ?? this.guardianLastName2,
      guardianPhone1: guardianPhone1 ?? this.guardianPhone1,
      guardianEmail1: guardianEmail1 ?? this.guardianEmail1,
      guardianPhone2: guardianPhone2 ?? this.guardianPhone2,
      guardianEmail2: guardianEmail2 ?? this.guardianEmail2,
      note: note ?? this.note,
      signUpFormStatusId: signUpFormStatusId ?? this.signUpFormStatusId,
      schoolYearId: schoolYearId ?? this.schoolYearId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (birthNumber.present) {
      map['birth_number'] = Variable<String>(birthNumber.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (zip.present) {
      map['zip'] = Variable<String>(zip.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (guardianFirstName1.present) {
      map['guardian_first_name1'] = Variable<String>(guardianFirstName1.value);
    }
    if (guardianLastName1.present) {
      map['guardian_last_name1'] = Variable<String>(guardianLastName1.value);
    }
    if (guardianFirstName2.present) {
      map['guardian_first_name2'] = Variable<String>(guardianFirstName2.value);
    }
    if (guardianLastName2.present) {
      map['guardian_last_name2'] = Variable<String>(guardianLastName2.value);
    }
    if (guardianPhone1.present) {
      map['guardian_phone1'] = Variable<String>(guardianPhone1.value);
    }
    if (guardianEmail1.present) {
      map['guardian_email1'] = Variable<String>(guardianEmail1.value);
    }
    if (guardianPhone2.present) {
      map['guardian_phone2'] = Variable<String>(guardianPhone2.value);
    }
    if (guardianEmail2.present) {
      map['guardian_email2'] = Variable<String>(guardianEmail2.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (signUpFormStatusId.present) {
      map['sign_up_form_status_id'] =
          Variable<String>(signUpFormStatusId.value);
    }
    if (schoolYearId.present) {
      map['school_year_id'] = Variable<String>(schoolYearId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SignUpFormCompanion(')
          ..write('id: $id, ')
          ..write('birthNumber: $birthNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('street: $street, ')
          ..write('city: $city, ')
          ..write('zip: $zip, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('guardianFirstName1: $guardianFirstName1, ')
          ..write('guardianLastName1: $guardianLastName1, ')
          ..write('guardianFirstName2: $guardianFirstName2, ')
          ..write('guardianLastName2: $guardianLastName2, ')
          ..write('guardianPhone1: $guardianPhone1, ')
          ..write('guardianEmail1: $guardianEmail1, ')
          ..write('guardianPhone2: $guardianPhone2, ')
          ..write('guardianEmail2: $guardianEmail2, ')
          ..write('note: $note, ')
          ..write('signUpFormStatusId: $signUpFormStatusId, ')
          ..write('schoolYearId: $schoolYearId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainerStatusTable extends TrainerStatus
    with TableInfo<$TrainerStatusTable, TrainerStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainerStatusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trainer_status';
  @override
  VerificationContext validateIntegrity(Insertable<TrainerStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainerStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainerStatusData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TrainerStatusTable createAlias(String alias) {
    return $TrainerStatusTable(attachedDatabase, alias);
  }
}

class TrainerStatusData extends DataClass
    implements Insertable<TrainerStatusData> {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TrainerStatusData(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TrainerStatusCompanion toCompanion(bool nullToAbsent) {
    return TrainerStatusCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TrainerStatusData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainerStatusData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TrainerStatusData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TrainerStatusData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TrainerStatusData copyWithCompanion(TrainerStatusCompanion data) {
    return TrainerStatusData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainerStatusData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainerStatusData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TrainerStatusCompanion extends UpdateCompanion<TrainerStatusData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TrainerStatusCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainerStatusCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrainerStatusData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainerStatusCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TrainerStatusCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainerStatusCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainerTable extends Trainer with TableInfo<$TrainerTable, TrainerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _athleteIdMeta =
      const VerificationMeta('athleteId');
  @override
  late final GeneratedColumn<String> athleteId = GeneratedColumn<String>(
      'athlete_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _trainerStatusIdMeta =
      const VerificationMeta('trainerStatusId');
  @override
  late final GeneratedColumn<String> trainerStatusId = GeneratedColumn<String>(
      'trainer_status_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _qualificationMeta =
      const VerificationMeta('qualification');
  @override
  late final GeneratedColumn<String> qualification = GeneratedColumn<String>(
      'qualification', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _salaryPerHourMeta =
      const VerificationMeta('salaryPerHour');
  @override
  late final GeneratedColumn<int> salaryPerHour = GeneratedColumn<int>(
      'salary_per_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        athleteId,
        trainerStatusId,
        qualification,
        salaryPerHour,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trainer';
  @override
  VerificationContext validateIntegrity(Insertable<TrainerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('athlete_id')) {
      context.handle(_athleteIdMeta,
          athleteId.isAcceptableOrUnknown(data['athlete_id']!, _athleteIdMeta));
    } else if (isInserting) {
      context.missing(_athleteIdMeta);
    }
    if (data.containsKey('trainer_status_id')) {
      context.handle(
          _trainerStatusIdMeta,
          trainerStatusId.isAcceptableOrUnknown(
              data['trainer_status_id']!, _trainerStatusIdMeta));
    } else if (isInserting) {
      context.missing(_trainerStatusIdMeta);
    }
    if (data.containsKey('qualification')) {
      context.handle(
          _qualificationMeta,
          qualification.isAcceptableOrUnknown(
              data['qualification']!, _qualificationMeta));
    } else if (isInserting) {
      context.missing(_qualificationMeta);
    }
    if (data.containsKey('salary_per_hour')) {
      context.handle(
          _salaryPerHourMeta,
          salaryPerHour.isAcceptableOrUnknown(
              data['salary_per_hour']!, _salaryPerHourMeta));
    } else if (isInserting) {
      context.missing(_salaryPerHourMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainerData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      athleteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}athlete_id'])!,
      trainerStatusId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}trainer_status_id'])!,
      qualification: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}qualification'])!,
      salaryPerHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}salary_per_hour'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TrainerTable createAlias(String alias) {
    return $TrainerTable(attachedDatabase, alias);
  }
}

class TrainerData extends DataClass implements Insertable<TrainerData> {
  final String id;
  final String athleteId;
  final String trainerStatusId;
  final String qualification;
  final int salaryPerHour;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TrainerData(
      {required this.id,
      required this.athleteId,
      required this.trainerStatusId,
      required this.qualification,
      required this.salaryPerHour,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['athlete_id'] = Variable<String>(athleteId);
    map['trainer_status_id'] = Variable<String>(trainerStatusId);
    map['qualification'] = Variable<String>(qualification);
    map['salary_per_hour'] = Variable<int>(salaryPerHour);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TrainerCompanion toCompanion(bool nullToAbsent) {
    return TrainerCompanion(
      id: Value(id),
      athleteId: Value(athleteId),
      trainerStatusId: Value(trainerStatusId),
      qualification: Value(qualification),
      salaryPerHour: Value(salaryPerHour),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TrainerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainerData(
      id: serializer.fromJson<String>(json['id']),
      athleteId: serializer.fromJson<String>(json['athleteId']),
      trainerStatusId: serializer.fromJson<String>(json['trainerStatusId']),
      qualification: serializer.fromJson<String>(json['qualification']),
      salaryPerHour: serializer.fromJson<int>(json['salaryPerHour']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'athleteId': serializer.toJson<String>(athleteId),
      'trainerStatusId': serializer.toJson<String>(trainerStatusId),
      'qualification': serializer.toJson<String>(qualification),
      'salaryPerHour': serializer.toJson<int>(salaryPerHour),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TrainerData copyWith(
          {String? id,
          String? athleteId,
          String? trainerStatusId,
          String? qualification,
          int? salaryPerHour,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TrainerData(
        id: id ?? this.id,
        athleteId: athleteId ?? this.athleteId,
        trainerStatusId: trainerStatusId ?? this.trainerStatusId,
        qualification: qualification ?? this.qualification,
        salaryPerHour: salaryPerHour ?? this.salaryPerHour,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TrainerData copyWithCompanion(TrainerCompanion data) {
    return TrainerData(
      id: data.id.present ? data.id.value : this.id,
      athleteId: data.athleteId.present ? data.athleteId.value : this.athleteId,
      trainerStatusId: data.trainerStatusId.present
          ? data.trainerStatusId.value
          : this.trainerStatusId,
      qualification: data.qualification.present
          ? data.qualification.value
          : this.qualification,
      salaryPerHour: data.salaryPerHour.present
          ? data.salaryPerHour.value
          : this.salaryPerHour,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainerData(')
          ..write('id: $id, ')
          ..write('athleteId: $athleteId, ')
          ..write('trainerStatusId: $trainerStatusId, ')
          ..write('qualification: $qualification, ')
          ..write('salaryPerHour: $salaryPerHour, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, athleteId, trainerStatusId, qualification,
      salaryPerHour, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainerData &&
          other.id == this.id &&
          other.athleteId == this.athleteId &&
          other.trainerStatusId == this.trainerStatusId &&
          other.qualification == this.qualification &&
          other.salaryPerHour == this.salaryPerHour &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TrainerCompanion extends UpdateCompanion<TrainerData> {
  final Value<String> id;
  final Value<String> athleteId;
  final Value<String> trainerStatusId;
  final Value<String> qualification;
  final Value<int> salaryPerHour;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TrainerCompanion({
    this.id = const Value.absent(),
    this.athleteId = const Value.absent(),
    this.trainerStatusId = const Value.absent(),
    this.qualification = const Value.absent(),
    this.salaryPerHour = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainerCompanion.insert({
    required String id,
    required String athleteId,
    required String trainerStatusId,
    required String qualification,
    required int salaryPerHour,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        athleteId = Value(athleteId),
        trainerStatusId = Value(trainerStatusId),
        qualification = Value(qualification),
        salaryPerHour = Value(salaryPerHour),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrainerData> custom({
    Expression<String>? id,
    Expression<String>? athleteId,
    Expression<String>? trainerStatusId,
    Expression<String>? qualification,
    Expression<int>? salaryPerHour,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (athleteId != null) 'athlete_id': athleteId,
      if (trainerStatusId != null) 'trainer_status_id': trainerStatusId,
      if (qualification != null) 'qualification': qualification,
      if (salaryPerHour != null) 'salary_per_hour': salaryPerHour,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainerCompanion copyWith(
      {Value<String>? id,
      Value<String>? athleteId,
      Value<String>? trainerStatusId,
      Value<String>? qualification,
      Value<int>? salaryPerHour,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TrainerCompanion(
      id: id ?? this.id,
      athleteId: athleteId ?? this.athleteId,
      trainerStatusId: trainerStatusId ?? this.trainerStatusId,
      qualification: qualification ?? this.qualification,
      salaryPerHour: salaryPerHour ?? this.salaryPerHour,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (athleteId.present) {
      map['athlete_id'] = Variable<String>(athleteId.value);
    }
    if (trainerStatusId.present) {
      map['trainer_status_id'] = Variable<String>(trainerStatusId.value);
    }
    if (qualification.present) {
      map['qualification'] = Variable<String>(qualification.value);
    }
    if (salaryPerHour.present) {
      map['salary_per_hour'] = Variable<int>(salaryPerHour.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainerCompanion(')
          ..write('id: $id, ')
          ..write('athleteId: $athleteId, ')
          ..write('trainerStatusId: $trainerStatusId, ')
          ..write('qualification: $qualification, ')
          ..write('salaryPerHour: $salaryPerHour, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingAthleteTable extends TrainingAthlete
    with TableInfo<$TrainingAthleteTable, TrainingAthleteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingAthleteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trainingIdMeta =
      const VerificationMeta('trainingId');
  @override
  late final GeneratedColumn<String> trainingId = GeneratedColumn<String>(
      'training_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _athleteIdMeta =
      const VerificationMeta('athleteId');
  @override
  late final GeneratedColumn<String> athleteId = GeneratedColumn<String>(
      'athlete_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _presenceMeta =
      const VerificationMeta('presence');
  @override
  late final GeneratedColumn<String> presence = GeneratedColumn<String>(
      'presence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [trainingId, athleteId, presence, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_athlete';
  @override
  VerificationContext validateIntegrity(
      Insertable<TrainingAthleteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('training_id')) {
      context.handle(
          _trainingIdMeta,
          trainingId.isAcceptableOrUnknown(
              data['training_id']!, _trainingIdMeta));
    } else if (isInserting) {
      context.missing(_trainingIdMeta);
    }
    if (data.containsKey('athlete_id')) {
      context.handle(_athleteIdMeta,
          athleteId.isAcceptableOrUnknown(data['athlete_id']!, _athleteIdMeta));
    } else if (isInserting) {
      context.missing(_athleteIdMeta);
    }
    if (data.containsKey('presence')) {
      context.handle(_presenceMeta,
          presence.isAcceptableOrUnknown(data['presence']!, _presenceMeta));
    } else if (isInserting) {
      context.missing(_presenceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trainingId, athleteId};
  @override
  TrainingAthleteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingAthleteData(
      trainingId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}training_id'])!,
      athleteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}athlete_id'])!,
      presence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}presence'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TrainingAthleteTable createAlias(String alias) {
    return $TrainingAthleteTable(attachedDatabase, alias);
  }
}

class TrainingAthleteData extends DataClass
    implements Insertable<TrainingAthleteData> {
  final String trainingId;
  final String athleteId;
  final String presence;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TrainingAthleteData(
      {required this.trainingId,
      required this.athleteId,
      required this.presence,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['training_id'] = Variable<String>(trainingId);
    map['athlete_id'] = Variable<String>(athleteId);
    map['presence'] = Variable<String>(presence);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TrainingAthleteCompanion toCompanion(bool nullToAbsent) {
    return TrainingAthleteCompanion(
      trainingId: Value(trainingId),
      athleteId: Value(athleteId),
      presence: Value(presence),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TrainingAthleteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingAthleteData(
      trainingId: serializer.fromJson<String>(json['trainingId']),
      athleteId: serializer.fromJson<String>(json['athleteId']),
      presence: serializer.fromJson<String>(json['presence']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trainingId': serializer.toJson<String>(trainingId),
      'athleteId': serializer.toJson<String>(athleteId),
      'presence': serializer.toJson<String>(presence),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TrainingAthleteData copyWith(
          {String? trainingId,
          String? athleteId,
          String? presence,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TrainingAthleteData(
        trainingId: trainingId ?? this.trainingId,
        athleteId: athleteId ?? this.athleteId,
        presence: presence ?? this.presence,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TrainingAthleteData copyWithCompanion(TrainingAthleteCompanion data) {
    return TrainingAthleteData(
      trainingId:
          data.trainingId.present ? data.trainingId.value : this.trainingId,
      athleteId: data.athleteId.present ? data.athleteId.value : this.athleteId,
      presence: data.presence.present ? data.presence.value : this.presence,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingAthleteData(')
          ..write('trainingId: $trainingId, ')
          ..write('athleteId: $athleteId, ')
          ..write('presence: $presence, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      trainingId, athleteId, presence, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingAthleteData &&
          other.trainingId == this.trainingId &&
          other.athleteId == this.athleteId &&
          other.presence == this.presence &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TrainingAthleteCompanion extends UpdateCompanion<TrainingAthleteData> {
  final Value<String> trainingId;
  final Value<String> athleteId;
  final Value<String> presence;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TrainingAthleteCompanion({
    this.trainingId = const Value.absent(),
    this.athleteId = const Value.absent(),
    this.presence = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingAthleteCompanion.insert({
    required String trainingId,
    required String athleteId,
    required String presence,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : trainingId = Value(trainingId),
        athleteId = Value(athleteId),
        presence = Value(presence),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrainingAthleteData> custom({
    Expression<String>? trainingId,
    Expression<String>? athleteId,
    Expression<String>? presence,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trainingId != null) 'training_id': trainingId,
      if (athleteId != null) 'athlete_id': athleteId,
      if (presence != null) 'presence': presence,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingAthleteCompanion copyWith(
      {Value<String>? trainingId,
      Value<String>? athleteId,
      Value<String>? presence,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TrainingAthleteCompanion(
      trainingId: trainingId ?? this.trainingId,
      athleteId: athleteId ?? this.athleteId,
      presence: presence ?? this.presence,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trainingId.present) {
      map['training_id'] = Variable<String>(trainingId.value);
    }
    if (athleteId.present) {
      map['athlete_id'] = Variable<String>(athleteId.value);
    }
    if (presence.present) {
      map['presence'] = Variable<String>(presence.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingAthleteCompanion(')
          ..write('trainingId: $trainingId, ')
          ..write('athleteId: $athleteId, ')
          ..write('presence: $presence, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingTimeTable extends TrainingTime
    with TableInfo<$TrainingTimeTable, TrainingTimeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingTimeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
      'day', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summerTimeMeta =
      const VerificationMeta('summerTime');
  @override
  late final GeneratedColumn<String> summerTime = GeneratedColumn<String>(
      'summer_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _winterTimeMeta =
      const VerificationMeta('winterTime');
  @override
  late final GeneratedColumn<String> winterTime = GeneratedColumn<String>(
      'winter_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, day, summerTime, winterTime, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_time';
  @override
  VerificationContext validateIntegrity(Insertable<TrainingTimeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('summer_time')) {
      context.handle(
          _summerTimeMeta,
          summerTime.isAcceptableOrUnknown(
              data['summer_time']!, _summerTimeMeta));
    } else if (isInserting) {
      context.missing(_summerTimeMeta);
    }
    if (data.containsKey('winter_time')) {
      context.handle(
          _winterTimeMeta,
          winterTime.isAcceptableOrUnknown(
              data['winter_time']!, _winterTimeMeta));
    } else if (isInserting) {
      context.missing(_winterTimeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingTimeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingTimeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}day'])!,
      summerTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summer_time'])!,
      winterTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}winter_time'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TrainingTimeTable createAlias(String alias) {
    return $TrainingTimeTable(attachedDatabase, alias);
  }
}

class TrainingTimeData extends DataClass
    implements Insertable<TrainingTimeData> {
  final String id;
  final String day;
  final String summerTime;
  final String winterTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TrainingTimeData(
      {required this.id,
      required this.day,
      required this.summerTime,
      required this.winterTime,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['day'] = Variable<String>(day);
    map['summer_time'] = Variable<String>(summerTime);
    map['winter_time'] = Variable<String>(winterTime);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TrainingTimeCompanion toCompanion(bool nullToAbsent) {
    return TrainingTimeCompanion(
      id: Value(id),
      day: Value(day),
      summerTime: Value(summerTime),
      winterTime: Value(winterTime),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TrainingTimeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingTimeData(
      id: serializer.fromJson<String>(json['id']),
      day: serializer.fromJson<String>(json['day']),
      summerTime: serializer.fromJson<String>(json['summerTime']),
      winterTime: serializer.fromJson<String>(json['winterTime']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'day': serializer.toJson<String>(day),
      'summerTime': serializer.toJson<String>(summerTime),
      'winterTime': serializer.toJson<String>(winterTime),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TrainingTimeData copyWith(
          {String? id,
          String? day,
          String? summerTime,
          String? winterTime,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TrainingTimeData(
        id: id ?? this.id,
        day: day ?? this.day,
        summerTime: summerTime ?? this.summerTime,
        winterTime: winterTime ?? this.winterTime,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TrainingTimeData copyWithCompanion(TrainingTimeCompanion data) {
    return TrainingTimeData(
      id: data.id.present ? data.id.value : this.id,
      day: data.day.present ? data.day.value : this.day,
      summerTime:
          data.summerTime.present ? data.summerTime.value : this.summerTime,
      winterTime:
          data.winterTime.present ? data.winterTime.value : this.winterTime,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingTimeData(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('summerTime: $summerTime, ')
          ..write('winterTime: $winterTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, day, summerTime, winterTime, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingTimeData &&
          other.id == this.id &&
          other.day == this.day &&
          other.summerTime == this.summerTime &&
          other.winterTime == this.winterTime &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TrainingTimeCompanion extends UpdateCompanion<TrainingTimeData> {
  final Value<String> id;
  final Value<String> day;
  final Value<String> summerTime;
  final Value<String> winterTime;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TrainingTimeCompanion({
    this.id = const Value.absent(),
    this.day = const Value.absent(),
    this.summerTime = const Value.absent(),
    this.winterTime = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingTimeCompanion.insert({
    required String id,
    required String day,
    required String summerTime,
    required String winterTime,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        day = Value(day),
        summerTime = Value(summerTime),
        winterTime = Value(winterTime),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrainingTimeData> custom({
    Expression<String>? id,
    Expression<String>? day,
    Expression<String>? summerTime,
    Expression<String>? winterTime,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (day != null) 'day': day,
      if (summerTime != null) 'summer_time': summerTime,
      if (winterTime != null) 'winter_time': winterTime,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingTimeCompanion copyWith(
      {Value<String>? id,
      Value<String>? day,
      Value<String>? summerTime,
      Value<String>? winterTime,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TrainingTimeCompanion(
      id: id ?? this.id,
      day: day ?? this.day,
      summerTime: summerTime ?? this.summerTime,
      winterTime: winterTime ?? this.winterTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (summerTime.present) {
      map['summer_time'] = Variable<String>(summerTime.value);
    }
    if (winterTime.present) {
      map['winter_time'] = Variable<String>(winterTime.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingTimeCompanion(')
          ..write('id: $id, ')
          ..write('day: $day, ')
          ..write('summerTime: $summerTime, ')
          ..write('winterTime: $winterTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingTrainerTable extends TrainingTrainer
    with TableInfo<$TrainingTrainerTable, TrainingTrainerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingTrainerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trainingIdMeta =
      const VerificationMeta('trainingId');
  @override
  late final GeneratedColumn<String> trainingId = GeneratedColumn<String>(
      'training_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _trainerIdMeta =
      const VerificationMeta('trainerId');
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
      'trainer_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _presenceMeta =
      const VerificationMeta('presence');
  @override
  late final GeneratedColumn<String> presence = GeneratedColumn<String>(
      'presence', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [trainingId, trainerId, presence, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_trainer';
  @override
  VerificationContext validateIntegrity(
      Insertable<TrainingTrainerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('training_id')) {
      context.handle(
          _trainingIdMeta,
          trainingId.isAcceptableOrUnknown(
              data['training_id']!, _trainingIdMeta));
    } else if (isInserting) {
      context.missing(_trainingIdMeta);
    }
    if (data.containsKey('trainer_id')) {
      context.handle(_trainerIdMeta,
          trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta));
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('presence')) {
      context.handle(_presenceMeta,
          presence.isAcceptableOrUnknown(data['presence']!, _presenceMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trainingId, trainerId};
  @override
  TrainingTrainerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingTrainerData(
      trainingId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}training_id'])!,
      trainerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trainer_id'])!,
      presence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}presence']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TrainingTrainerTable createAlias(String alias) {
    return $TrainingTrainerTable(attachedDatabase, alias);
  }
}

class TrainingTrainerData extends DataClass
    implements Insertable<TrainingTrainerData> {
  final String trainingId;
  final String trainerId;
  final String? presence;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TrainingTrainerData(
      {required this.trainingId,
      required this.trainerId,
      this.presence,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['training_id'] = Variable<String>(trainingId);
    map['trainer_id'] = Variable<String>(trainerId);
    if (!nullToAbsent || presence != null) {
      map['presence'] = Variable<String>(presence);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TrainingTrainerCompanion toCompanion(bool nullToAbsent) {
    return TrainingTrainerCompanion(
      trainingId: Value(trainingId),
      trainerId: Value(trainerId),
      presence: presence == null && nullToAbsent
          ? const Value.absent()
          : Value(presence),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TrainingTrainerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingTrainerData(
      trainingId: serializer.fromJson<String>(json['trainingId']),
      trainerId: serializer.fromJson<String>(json['trainerId']),
      presence: serializer.fromJson<String?>(json['presence']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trainingId': serializer.toJson<String>(trainingId),
      'trainerId': serializer.toJson<String>(trainerId),
      'presence': serializer.toJson<String?>(presence),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TrainingTrainerData copyWith(
          {String? trainingId,
          String? trainerId,
          Value<String?> presence = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TrainingTrainerData(
        trainingId: trainingId ?? this.trainingId,
        trainerId: trainerId ?? this.trainerId,
        presence: presence.present ? presence.value : this.presence,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TrainingTrainerData copyWithCompanion(TrainingTrainerCompanion data) {
    return TrainingTrainerData(
      trainingId:
          data.trainingId.present ? data.trainingId.value : this.trainingId,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      presence: data.presence.present ? data.presence.value : this.presence,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingTrainerData(')
          ..write('trainingId: $trainingId, ')
          ..write('trainerId: $trainerId, ')
          ..write('presence: $presence, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      trainingId, trainerId, presence, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingTrainerData &&
          other.trainingId == this.trainingId &&
          other.trainerId == this.trainerId &&
          other.presence == this.presence &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TrainingTrainerCompanion extends UpdateCompanion<TrainingTrainerData> {
  final Value<String> trainingId;
  final Value<String> trainerId;
  final Value<String?> presence;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TrainingTrainerCompanion({
    this.trainingId = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.presence = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingTrainerCompanion.insert({
    required String trainingId,
    required String trainerId,
    this.presence = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : trainingId = Value(trainingId),
        trainerId = Value(trainerId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrainingTrainerData> custom({
    Expression<String>? trainingId,
    Expression<String>? trainerId,
    Expression<String>? presence,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trainingId != null) 'training_id': trainingId,
      if (trainerId != null) 'trainer_id': trainerId,
      if (presence != null) 'presence': presence,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingTrainerCompanion copyWith(
      {Value<String>? trainingId,
      Value<String>? trainerId,
      Value<String?>? presence,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TrainingTrainerCompanion(
      trainingId: trainingId ?? this.trainingId,
      trainerId: trainerId ?? this.trainerId,
      presence: presence ?? this.presence,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trainingId.present) {
      map['training_id'] = Variable<String>(trainingId.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (presence.present) {
      map['presence'] = Variable<String>(presence.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingTrainerCompanion(')
          ..write('trainingId: $trainingId, ')
          ..write('trainerId: $trainerId, ')
          ..write('presence: $presence, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TrainingTable extends Training
    with TableInfo<$TrainingTable, TrainingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _datetimeMeta =
      const VerificationMeta('datetime');
  @override
  late final GeneratedColumn<DateTime> datetime = GeneratedColumn<DateTime>(
      'datetime', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMinutesMeta =
      const VerificationMeta('durationMinutes');
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
      'duration_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        datetime,
        groupId,
        description,
        durationMinutes,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training';
  @override
  VerificationContext validateIntegrity(Insertable<TrainingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(_datetimeMeta,
          datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta));
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
          _durationMinutesMeta,
          durationMinutes.isAcceptableOrUnknown(
              data['duration_minutes']!, _durationMinutesMeta));
    } else if (isInserting) {
      context.missing(_durationMinutesMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      datetime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}datetime'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      durationMinutes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_minutes'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TrainingTable createAlias(String alias) {
    return $TrainingTable(attachedDatabase, alias);
  }
}

class TrainingData extends DataClass implements Insertable<TrainingData> {
  final String id;
  final DateTime datetime;
  final String groupId;
  final String? description;
  final int durationMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TrainingData(
      {required this.id,
      required this.datetime,
      required this.groupId,
      this.description,
      required this.durationMinutes,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['datetime'] = Variable<DateTime>(datetime);
    map['group_id'] = Variable<String>(groupId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['duration_minutes'] = Variable<int>(durationMinutes);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TrainingCompanion toCompanion(bool nullToAbsent) {
    return TrainingCompanion(
      id: Value(id),
      datetime: Value(datetime),
      groupId: Value(groupId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      durationMinutes: Value(durationMinutes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TrainingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingData(
      id: serializer.fromJson<String>(json['id']),
      datetime: serializer.fromJson<DateTime>(json['datetime']),
      groupId: serializer.fromJson<String>(json['groupId']),
      description: serializer.fromJson<String?>(json['description']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'datetime': serializer.toJson<DateTime>(datetime),
      'groupId': serializer.toJson<String>(groupId),
      'description': serializer.toJson<String?>(description),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TrainingData copyWith(
          {String? id,
          DateTime? datetime,
          String? groupId,
          Value<String?> description = const Value.absent(),
          int? durationMinutes,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TrainingData(
        id: id ?? this.id,
        datetime: datetime ?? this.datetime,
        groupId: groupId ?? this.groupId,
        description: description.present ? description.value : this.description,
        durationMinutes: durationMinutes ?? this.durationMinutes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  TrainingData copyWithCompanion(TrainingCompanion data) {
    return TrainingData(
      id: data.id.present ? data.id.value : this.id,
      datetime: data.datetime.present ? data.datetime.value : this.datetime,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      description:
          data.description.present ? data.description.value : this.description,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingData(')
          ..write('id: $id, ')
          ..write('datetime: $datetime, ')
          ..write('groupId: $groupId, ')
          ..write('description: $description, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, datetime, groupId, description,
      durationMinutes, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingData &&
          other.id == this.id &&
          other.datetime == this.datetime &&
          other.groupId == this.groupId &&
          other.description == this.description &&
          other.durationMinutes == this.durationMinutes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TrainingCompanion extends UpdateCompanion<TrainingData> {
  final Value<String> id;
  final Value<DateTime> datetime;
  final Value<String> groupId;
  final Value<String?> description;
  final Value<int> durationMinutes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const TrainingCompanion({
    this.id = const Value.absent(),
    this.datetime = const Value.absent(),
    this.groupId = const Value.absent(),
    this.description = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TrainingCompanion.insert({
    required String id,
    required DateTime datetime,
    required String groupId,
    this.description = const Value.absent(),
    required int durationMinutes,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        datetime = Value(datetime),
        groupId = Value(groupId),
        durationMinutes = Value(durationMinutes),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TrainingData> custom({
    Expression<String>? id,
    Expression<DateTime>? datetime,
    Expression<String>? groupId,
    Expression<String>? description,
    Expression<int>? durationMinutes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (datetime != null) 'datetime': datetime,
      if (groupId != null) 'group_id': groupId,
      if (description != null) 'description': description,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TrainingCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? datetime,
      Value<String>? groupId,
      Value<String?>? description,
      Value<int>? durationMinutes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return TrainingCompanion(
      id: id ?? this.id,
      datetime: datetime ?? this.datetime,
      groupId: groupId ?? this.groupId,
      description: description ?? this.description,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<DateTime>(datetime.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingCompanion(')
          ..write('id: $id, ')
          ..write('datetime: $datetime, ')
          ..write('groupId: $groupId, ')
          ..write('description: $description, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WebPostTable extends WebPost with TableInfo<$WebPostTable, WebPostData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WebPostTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trainerIdMeta =
      const VerificationMeta('trainerId');
  @override
  late final GeneratedColumn<String> trainerId = GeneratedColumn<String>(
      'trainer_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, trainerId, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'web_post';
  @override
  VerificationContext validateIntegrity(Insertable<WebPostData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('trainer_id')) {
      context.handle(_trainerIdMeta,
          trainerId.isAcceptableOrUnknown(data['trainer_id']!, _trainerIdMeta));
    } else if (isInserting) {
      context.missing(_trainerIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WebPostData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WebPostData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      trainerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trainer_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $WebPostTable createAlias(String alias) {
    return $WebPostTable(attachedDatabase, alias);
  }
}

class WebPostData extends DataClass implements Insertable<WebPostData> {
  final String id;
  final String title;
  final String content;
  final String trainerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const WebPostData(
      {required this.id,
      required this.title,
      required this.content,
      required this.trainerId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['trainer_id'] = Variable<String>(trainerId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  WebPostCompanion toCompanion(bool nullToAbsent) {
    return WebPostCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      trainerId: Value(trainerId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory WebPostData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WebPostData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      trainerId: serializer.fromJson<String>(json['trainerId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'trainerId': serializer.toJson<String>(trainerId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  WebPostData copyWith(
          {String? id,
          String? title,
          String? content,
          String? trainerId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      WebPostData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        trainerId: trainerId ?? this.trainerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  WebPostData copyWithCompanion(WebPostCompanion data) {
    return WebPostData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      trainerId: data.trainerId.present ? data.trainerId.value : this.trainerId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WebPostData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('trainerId: $trainerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, content, trainerId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WebPostData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.trainerId == this.trainerId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class WebPostCompanion extends UpdateCompanion<WebPostData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String> trainerId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const WebPostCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.trainerId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WebPostCompanion.insert({
    required String id,
    required String title,
    required String content,
    required String trainerId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content),
        trainerId = Value(trainerId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<WebPostData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? trainerId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (trainerId != null) 'trainer_id': trainerId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WebPostCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String>? trainerId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return WebPostCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      trainerId: trainerId ?? this.trainerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (trainerId.present) {
      map['trainer_id'] = Variable<String>(trainerId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WebPostCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('trainerId: $trainerId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppSettingTable appSetting = $AppSettingTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $UserEmailTable userEmail = $UserEmailTable(this);
  late final $AthleteGuardianTable athleteGuardian =
      $AthleteGuardianTable(this);
  late final $AthleteMeetEventTable athleteMeetEvent =
      $AthleteMeetEventTable(this);
  late final $AthleteSignUpFormTable athleteSignUpForm =
      $AthleteSignUpFormTable(this);
  late final $AthleteStatusTable athleteStatus = $AthleteStatusTable(this);
  late final $AthleteTable athlete = $AthleteTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $ClubTable club = $ClubTable(this);
  late final $DisciplineTypeTable disciplineType = $DisciplineTypeTable(this);
  late final $DisciplineTable discipline = $DisciplineTable(this);
  late final $GroupAthleteTable groupAthlete = $GroupAthleteTable(this);
  late final $GroupTrainerTable groupTrainer = $GroupTrainerTable(this);
  late final $GroupTable group = $GroupTable(this);
  late final $GuardianTable guardian = $GuardianTable(this);
  late final $ItemTypeTable itemType = $ItemTypeTable(this);
  late final $ItemTable item = $ItemTable(this);
  late final $MeetEventTable meetEvent = $MeetEventTable(this);
  late final $MeetTable meet = $MeetTable(this);
  late final $RemoteConfigTable remoteConfig = $RemoteConfigTable(this);
  late final $SchoolYearTable schoolYear = $SchoolYearTable(this);
  late final $SignUpFormStatusTable signUpFormStatus =
      $SignUpFormStatusTable(this);
  late final $SignUpFormTable signUpForm = $SignUpFormTable(this);
  late final $TrainerStatusTable trainerStatus = $TrainerStatusTable(this);
  late final $TrainerTable trainer = $TrainerTable(this);
  late final $TrainingAthleteTable trainingAthlete =
      $TrainingAthleteTable(this);
  late final $TrainingTimeTable trainingTime = $TrainingTimeTable(this);
  late final $TrainingTrainerTable trainingTrainer =
      $TrainingTrainerTable(this);
  late final $TrainingTable training = $TrainingTable(this);
  late final $WebPostTable webPost = $WebPostTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        appSetting,
        syncQueue,
        userEmail,
        athleteGuardian,
        athleteMeetEvent,
        athleteSignUpForm,
        athleteStatus,
        athlete,
        category,
        club,
        disciplineType,
        discipline,
        groupAthlete,
        groupTrainer,
        group,
        guardian,
        itemType,
        item,
        meetEvent,
        meet,
        remoteConfig,
        schoolYear,
        signUpFormStatus,
        signUpForm,
        trainerStatus,
        trainer,
        trainingAthlete,
        trainingTime,
        trainingTrainer,
        training,
        webPost
      ];
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
typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  required String endpoint,
  required String method,
  Value<String?> data,
  Value<DateTime?> doneAt,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> endpoint,
  Value<String> method,
  Value<String?> data,
  Value<DateTime?> doneAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endpoint => $composableBuilder(
      column: $table.endpoint, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get method => $composableBuilder(
      column: $table.method, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get doneAt => $composableBuilder(
      column: $table.doneAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endpoint => $composableBuilder(
      column: $table.endpoint, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get method => $composableBuilder(
      column: $table.method, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get doneAt => $composableBuilder(
      column: $table.doneAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get endpoint =>
      $composableBuilder(column: $table.endpoint, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get doneAt =>
      $composableBuilder(column: $table.doneAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncQueueTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> endpoint = const Value.absent(),
            Value<String> method = const Value.absent(),
            Value<String?> data = const Value.absent(),
            Value<DateTime?> doneAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            endpoint: endpoint,
            method: method,
            data: data,
            doneAt: doneAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String endpoint,
            required String method,
            Value<String?> data = const Value.absent(),
            Value<DateTime?> doneAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            endpoint: endpoint,
            method: method,
            data: data,
            doneAt: doneAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()>;
typedef $$UserEmailTableCreateCompanionBuilder = UserEmailCompanion Function({
  Value<int> id,
  required String email,
});
typedef $$UserEmailTableUpdateCompanionBuilder = UserEmailCompanion Function({
  Value<int> id,
  Value<String> email,
});

class $$UserEmailTableFilterComposer
    extends Composer<_$AppDatabase, $UserEmailTable> {
  $$UserEmailTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));
}

class $$UserEmailTableOrderingComposer
    extends Composer<_$AppDatabase, $UserEmailTable> {
  $$UserEmailTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));
}

class $$UserEmailTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserEmailTable> {
  $$UserEmailTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);
}

class $$UserEmailTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserEmailTable,
    UserEmailData,
    $$UserEmailTableFilterComposer,
    $$UserEmailTableOrderingComposer,
    $$UserEmailTableAnnotationComposer,
    $$UserEmailTableCreateCompanionBuilder,
    $$UserEmailTableUpdateCompanionBuilder,
    (
      UserEmailData,
      BaseReferences<_$AppDatabase, $UserEmailTable, UserEmailData>
    ),
    UserEmailData,
    PrefetchHooks Function()> {
  $$UserEmailTableTableManager(_$AppDatabase db, $UserEmailTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserEmailTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserEmailTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserEmailTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> email = const Value.absent(),
          }) =>
              UserEmailCompanion(
            id: id,
            email: email,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String email,
          }) =>
              UserEmailCompanion.insert(
            id: id,
            email: email,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserEmailTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserEmailTable,
    UserEmailData,
    $$UserEmailTableFilterComposer,
    $$UserEmailTableOrderingComposer,
    $$UserEmailTableAnnotationComposer,
    $$UserEmailTableCreateCompanionBuilder,
    $$UserEmailTableUpdateCompanionBuilder,
    (
      UserEmailData,
      BaseReferences<_$AppDatabase, $UserEmailTable, UserEmailData>
    ),
    UserEmailData,
    PrefetchHooks Function()>;
typedef $$AthleteGuardianTableCreateCompanionBuilder = AthleteGuardianCompanion
    Function({
  required String athleteId,
  required String guardianId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$AthleteGuardianTableUpdateCompanionBuilder = AthleteGuardianCompanion
    Function({
  Value<String> athleteId,
  Value<String> guardianId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$AthleteGuardianTableFilterComposer
    extends Composer<_$AppDatabase, $AthleteGuardianTable> {
  $$AthleteGuardianTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianId => $composableBuilder(
      column: $table.guardianId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$AthleteGuardianTableOrderingComposer
    extends Composer<_$AppDatabase, $AthleteGuardianTable> {
  $$AthleteGuardianTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianId => $composableBuilder(
      column: $table.guardianId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$AthleteGuardianTableAnnotationComposer
    extends Composer<_$AppDatabase, $AthleteGuardianTable> {
  $$AthleteGuardianTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get athleteId =>
      $composableBuilder(column: $table.athleteId, builder: (column) => column);

  GeneratedColumn<String> get guardianId => $composableBuilder(
      column: $table.guardianId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$AthleteGuardianTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AthleteGuardianTable,
    AthleteGuardianData,
    $$AthleteGuardianTableFilterComposer,
    $$AthleteGuardianTableOrderingComposer,
    $$AthleteGuardianTableAnnotationComposer,
    $$AthleteGuardianTableCreateCompanionBuilder,
    $$AthleteGuardianTableUpdateCompanionBuilder,
    (
      AthleteGuardianData,
      BaseReferences<_$AppDatabase, $AthleteGuardianTable, AthleteGuardianData>
    ),
    AthleteGuardianData,
    PrefetchHooks Function()> {
  $$AthleteGuardianTableTableManager(
      _$AppDatabase db, $AthleteGuardianTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AthleteGuardianTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AthleteGuardianTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AthleteGuardianTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> athleteId = const Value.absent(),
            Value<String> guardianId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteGuardianCompanion(
            athleteId: athleteId,
            guardianId: guardianId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String athleteId,
            required String guardianId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteGuardianCompanion.insert(
            athleteId: athleteId,
            guardianId: guardianId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AthleteGuardianTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AthleteGuardianTable,
    AthleteGuardianData,
    $$AthleteGuardianTableFilterComposer,
    $$AthleteGuardianTableOrderingComposer,
    $$AthleteGuardianTableAnnotationComposer,
    $$AthleteGuardianTableCreateCompanionBuilder,
    $$AthleteGuardianTableUpdateCompanionBuilder,
    (
      AthleteGuardianData,
      BaseReferences<_$AppDatabase, $AthleteGuardianTable, AthleteGuardianData>
    ),
    AthleteGuardianData,
    PrefetchHooks Function()>;
typedef $$AthleteMeetEventTableCreateCompanionBuilder
    = AthleteMeetEventCompanion Function({
  required String athleteId,
  required String meetEventId,
  Value<String?> result,
  Value<String?> wind,
  Value<String?> pbSb,
  Value<String?> points,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$AthleteMeetEventTableUpdateCompanionBuilder
    = AthleteMeetEventCompanion Function({
  Value<String> athleteId,
  Value<String> meetEventId,
  Value<String?> result,
  Value<String?> wind,
  Value<String?> pbSb,
  Value<String?> points,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$AthleteMeetEventTableFilterComposer
    extends Composer<_$AppDatabase, $AthleteMeetEventTable> {
  $$AthleteMeetEventTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetEventId => $composableBuilder(
      column: $table.meetEventId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wind => $composableBuilder(
      column: $table.wind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pbSb => $composableBuilder(
      column: $table.pbSb, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get points => $composableBuilder(
      column: $table.points, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$AthleteMeetEventTableOrderingComposer
    extends Composer<_$AppDatabase, $AthleteMeetEventTable> {
  $$AthleteMeetEventTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetEventId => $composableBuilder(
      column: $table.meetEventId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wind => $composableBuilder(
      column: $table.wind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pbSb => $composableBuilder(
      column: $table.pbSb, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get points => $composableBuilder(
      column: $table.points, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$AthleteMeetEventTableAnnotationComposer
    extends Composer<_$AppDatabase, $AthleteMeetEventTable> {
  $$AthleteMeetEventTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get athleteId =>
      $composableBuilder(column: $table.athleteId, builder: (column) => column);

  GeneratedColumn<String> get meetEventId => $composableBuilder(
      column: $table.meetEventId, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get wind =>
      $composableBuilder(column: $table.wind, builder: (column) => column);

  GeneratedColumn<String> get pbSb =>
      $composableBuilder(column: $table.pbSb, builder: (column) => column);

  GeneratedColumn<String> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$AthleteMeetEventTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AthleteMeetEventTable,
    AthleteMeetEventData,
    $$AthleteMeetEventTableFilterComposer,
    $$AthleteMeetEventTableOrderingComposer,
    $$AthleteMeetEventTableAnnotationComposer,
    $$AthleteMeetEventTableCreateCompanionBuilder,
    $$AthleteMeetEventTableUpdateCompanionBuilder,
    (
      AthleteMeetEventData,
      BaseReferences<_$AppDatabase, $AthleteMeetEventTable,
          AthleteMeetEventData>
    ),
    AthleteMeetEventData,
    PrefetchHooks Function()> {
  $$AthleteMeetEventTableTableManager(
      _$AppDatabase db, $AthleteMeetEventTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AthleteMeetEventTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AthleteMeetEventTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AthleteMeetEventTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> athleteId = const Value.absent(),
            Value<String> meetEventId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> wind = const Value.absent(),
            Value<String?> pbSb = const Value.absent(),
            Value<String?> points = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteMeetEventCompanion(
            athleteId: athleteId,
            meetEventId: meetEventId,
            result: result,
            wind: wind,
            pbSb: pbSb,
            points: points,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String athleteId,
            required String meetEventId,
            Value<String?> result = const Value.absent(),
            Value<String?> wind = const Value.absent(),
            Value<String?> pbSb = const Value.absent(),
            Value<String?> points = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteMeetEventCompanion.insert(
            athleteId: athleteId,
            meetEventId: meetEventId,
            result: result,
            wind: wind,
            pbSb: pbSb,
            points: points,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AthleteMeetEventTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AthleteMeetEventTable,
    AthleteMeetEventData,
    $$AthleteMeetEventTableFilterComposer,
    $$AthleteMeetEventTableOrderingComposer,
    $$AthleteMeetEventTableAnnotationComposer,
    $$AthleteMeetEventTableCreateCompanionBuilder,
    $$AthleteMeetEventTableUpdateCompanionBuilder,
    (
      AthleteMeetEventData,
      BaseReferences<_$AppDatabase, $AthleteMeetEventTable,
          AthleteMeetEventData>
    ),
    AthleteMeetEventData,
    PrefetchHooks Function()>;
typedef $$AthleteSignUpFormTableCreateCompanionBuilder
    = AthleteSignUpFormCompanion Function({
  required String athleteId,
  required String signUpFormId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$AthleteSignUpFormTableUpdateCompanionBuilder
    = AthleteSignUpFormCompanion Function({
  Value<String> athleteId,
  Value<String> signUpFormId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$AthleteSignUpFormTableFilterComposer
    extends Composer<_$AppDatabase, $AthleteSignUpFormTable> {
  $$AthleteSignUpFormTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get signUpFormId => $composableBuilder(
      column: $table.signUpFormId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$AthleteSignUpFormTableOrderingComposer
    extends Composer<_$AppDatabase, $AthleteSignUpFormTable> {
  $$AthleteSignUpFormTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get signUpFormId => $composableBuilder(
      column: $table.signUpFormId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$AthleteSignUpFormTableAnnotationComposer
    extends Composer<_$AppDatabase, $AthleteSignUpFormTable> {
  $$AthleteSignUpFormTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get athleteId =>
      $composableBuilder(column: $table.athleteId, builder: (column) => column);

  GeneratedColumn<String> get signUpFormId => $composableBuilder(
      column: $table.signUpFormId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$AthleteSignUpFormTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AthleteSignUpFormTable,
    AthleteSignUpFormData,
    $$AthleteSignUpFormTableFilterComposer,
    $$AthleteSignUpFormTableOrderingComposer,
    $$AthleteSignUpFormTableAnnotationComposer,
    $$AthleteSignUpFormTableCreateCompanionBuilder,
    $$AthleteSignUpFormTableUpdateCompanionBuilder,
    (
      AthleteSignUpFormData,
      BaseReferences<_$AppDatabase, $AthleteSignUpFormTable,
          AthleteSignUpFormData>
    ),
    AthleteSignUpFormData,
    PrefetchHooks Function()> {
  $$AthleteSignUpFormTableTableManager(
      _$AppDatabase db, $AthleteSignUpFormTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AthleteSignUpFormTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AthleteSignUpFormTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AthleteSignUpFormTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> athleteId = const Value.absent(),
            Value<String> signUpFormId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteSignUpFormCompanion(
            athleteId: athleteId,
            signUpFormId: signUpFormId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String athleteId,
            required String signUpFormId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteSignUpFormCompanion.insert(
            athleteId: athleteId,
            signUpFormId: signUpFormId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AthleteSignUpFormTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AthleteSignUpFormTable,
    AthleteSignUpFormData,
    $$AthleteSignUpFormTableFilterComposer,
    $$AthleteSignUpFormTableOrderingComposer,
    $$AthleteSignUpFormTableAnnotationComposer,
    $$AthleteSignUpFormTableCreateCompanionBuilder,
    $$AthleteSignUpFormTableUpdateCompanionBuilder,
    (
      AthleteSignUpFormData,
      BaseReferences<_$AppDatabase, $AthleteSignUpFormTable,
          AthleteSignUpFormData>
    ),
    AthleteSignUpFormData,
    PrefetchHooks Function()>;
typedef $$AthleteStatusTableCreateCompanionBuilder = AthleteStatusCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$AthleteStatusTableUpdateCompanionBuilder = AthleteStatusCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$AthleteStatusTableFilterComposer
    extends Composer<_$AppDatabase, $AthleteStatusTable> {
  $$AthleteStatusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$AthleteStatusTableOrderingComposer
    extends Composer<_$AppDatabase, $AthleteStatusTable> {
  $$AthleteStatusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$AthleteStatusTableAnnotationComposer
    extends Composer<_$AppDatabase, $AthleteStatusTable> {
  $$AthleteStatusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$AthleteStatusTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AthleteStatusTable,
    AthleteStatusData,
    $$AthleteStatusTableFilterComposer,
    $$AthleteStatusTableOrderingComposer,
    $$AthleteStatusTableAnnotationComposer,
    $$AthleteStatusTableCreateCompanionBuilder,
    $$AthleteStatusTableUpdateCompanionBuilder,
    (
      AthleteStatusData,
      BaseReferences<_$AppDatabase, $AthleteStatusTable, AthleteStatusData>
    ),
    AthleteStatusData,
    PrefetchHooks Function()> {
  $$AthleteStatusTableTableManager(_$AppDatabase db, $AthleteStatusTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AthleteStatusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AthleteStatusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AthleteStatusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteStatusCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteStatusCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AthleteStatusTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AthleteStatusTable,
    AthleteStatusData,
    $$AthleteStatusTableFilterComposer,
    $$AthleteStatusTableOrderingComposer,
    $$AthleteStatusTableAnnotationComposer,
    $$AthleteStatusTableCreateCompanionBuilder,
    $$AthleteStatusTableUpdateCompanionBuilder,
    (
      AthleteStatusData,
      BaseReferences<_$AppDatabase, $AthleteStatusTable, AthleteStatusData>
    ),
    AthleteStatusData,
    PrefetchHooks Function()>;
typedef $$AthleteTableCreateCompanionBuilder = AthleteCompanion Function({
  required String id,
  required String birthNumber,
  required String firstName,
  required String lastName,
  required String street,
  required String city,
  required String zip,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> ean,
  Value<String?> note,
  Value<String?> clubId,
  Value<String?> profilePicture,
  required String athleteStatusId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$AthleteTableUpdateCompanionBuilder = AthleteCompanion Function({
  Value<String> id,
  Value<String> birthNumber,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> street,
  Value<String> city,
  Value<String> zip,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> ean,
  Value<String?> note,
  Value<String?> clubId,
  Value<String?> profilePicture,
  Value<String> athleteStatusId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$AthleteTableFilterComposer
    extends Composer<_$AppDatabase, $AthleteTable> {
  $$AthleteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get birthNumber => $composableBuilder(
      column: $table.birthNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get zip => $composableBuilder(
      column: $table.zip, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get ean => $composableBuilder(
      column: $table.ean, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clubId => $composableBuilder(
      column: $table.clubId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profilePicture => $composableBuilder(
      column: $table.profilePicture,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get athleteStatusId => $composableBuilder(
      column: $table.athleteStatusId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$AthleteTableOrderingComposer
    extends Composer<_$AppDatabase, $AthleteTable> {
  $$AthleteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get birthNumber => $composableBuilder(
      column: $table.birthNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zip => $composableBuilder(
      column: $table.zip, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get ean => $composableBuilder(
      column: $table.ean, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clubId => $composableBuilder(
      column: $table.clubId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profilePicture => $composableBuilder(
      column: $table.profilePicture,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get athleteStatusId => $composableBuilder(
      column: $table.athleteStatusId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$AthleteTableAnnotationComposer
    extends Composer<_$AppDatabase, $AthleteTable> {
  $$AthleteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get birthNumber => $composableBuilder(
      column: $table.birthNumber, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get zip =>
      $composableBuilder(column: $table.zip, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get ean =>
      $composableBuilder(column: $table.ean, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get clubId =>
      $composableBuilder(column: $table.clubId, builder: (column) => column);

  GeneratedColumn<String> get profilePicture => $composableBuilder(
      column: $table.profilePicture, builder: (column) => column);

  GeneratedColumn<String> get athleteStatusId => $composableBuilder(
      column: $table.athleteStatusId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$AthleteTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AthleteTable,
    AthleteData,
    $$AthleteTableFilterComposer,
    $$AthleteTableOrderingComposer,
    $$AthleteTableAnnotationComposer,
    $$AthleteTableCreateCompanionBuilder,
    $$AthleteTableUpdateCompanionBuilder,
    (AthleteData, BaseReferences<_$AppDatabase, $AthleteTable, AthleteData>),
    AthleteData,
    PrefetchHooks Function()> {
  $$AthleteTableTableManager(_$AppDatabase db, $AthleteTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AthleteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AthleteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AthleteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> birthNumber = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> street = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<String> zip = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> ean = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> clubId = const Value.absent(),
            Value<String?> profilePicture = const Value.absent(),
            Value<String> athleteStatusId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteCompanion(
            id: id,
            birthNumber: birthNumber,
            firstName: firstName,
            lastName: lastName,
            street: street,
            city: city,
            zip: zip,
            email: email,
            phone: phone,
            ean: ean,
            note: note,
            clubId: clubId,
            profilePicture: profilePicture,
            athleteStatusId: athleteStatusId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String birthNumber,
            required String firstName,
            required String lastName,
            required String street,
            required String city,
            required String zip,
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> ean = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String?> clubId = const Value.absent(),
            Value<String?> profilePicture = const Value.absent(),
            required String athleteStatusId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AthleteCompanion.insert(
            id: id,
            birthNumber: birthNumber,
            firstName: firstName,
            lastName: lastName,
            street: street,
            city: city,
            zip: zip,
            email: email,
            phone: phone,
            ean: ean,
            note: note,
            clubId: clubId,
            profilePicture: profilePicture,
            athleteStatusId: athleteStatusId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AthleteTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AthleteTable,
    AthleteData,
    $$AthleteTableFilterComposer,
    $$AthleteTableOrderingComposer,
    $$AthleteTableAnnotationComposer,
    $$AthleteTableCreateCompanionBuilder,
    $$AthleteTableUpdateCompanionBuilder,
    (AthleteData, BaseReferences<_$AppDatabase, $AthleteTable, AthleteData>),
    AthleteData,
    PrefetchHooks Function()>;
typedef $$CategoryTableCreateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  required int sex,
  required String description,
  required String shortDescription,
  required String descriptionEn,
  required String shortDescriptionEn,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$CategoryTableUpdateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  Value<int> sex,
  Value<String> description,
  Value<String> shortDescription,
  Value<String> descriptionEn,
  Value<String> shortDescriptionEn,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

class $$CategoryTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descriptionEn => $composableBuilder(
      column: $table.descriptionEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortDescriptionEn => $composableBuilder(
      column: $table.shortDescriptionEn,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$CategoryTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descriptionEn => $composableBuilder(
      column: $table.descriptionEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortDescriptionEn => $composableBuilder(
      column: $table.shortDescriptionEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$CategoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTable> {
  $$CategoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription, builder: (column) => column);

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
      column: $table.descriptionEn, builder: (column) => column);

  GeneratedColumn<String> get shortDescriptionEn => $composableBuilder(
      column: $table.shortDescriptionEn, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CategoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>),
    CategoryData,
    PrefetchHooks Function()> {
  $$CategoryTableTableManager(_$AppDatabase db, $CategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sex = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> shortDescription = const Value.absent(),
            Value<String> descriptionEn = const Value.absent(),
            Value<String> shortDescriptionEn = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              CategoryCompanion(
            id: id,
            sex: sex,
            description: description,
            shortDescription: shortDescription,
            descriptionEn: descriptionEn,
            shortDescriptionEn: shortDescriptionEn,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int sex,
            required String description,
            required String shortDescription,
            required String descriptionEn,
            required String shortDescriptionEn,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              CategoryCompanion.insert(
            id: id,
            sex: sex,
            description: description,
            shortDescription: shortDescription,
            descriptionEn: descriptionEn,
            shortDescriptionEn: shortDescriptionEn,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableAnnotationComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder,
    (CategoryData, BaseReferences<_$AppDatabase, $CategoryTable, CategoryData>),
    CategoryData,
    PrefetchHooks Function()>;
typedef $$ClubTableCreateCompanionBuilder = ClubCompanion Function({
  required String id,
  required String name,
  required String description,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ClubTableUpdateCompanionBuilder = ClubCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$ClubTableFilterComposer extends Composer<_$AppDatabase, $ClubTable> {
  $$ClubTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$ClubTableOrderingComposer extends Composer<_$AppDatabase, $ClubTable> {
  $$ClubTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$ClubTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClubTable> {
  $$ClubTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ClubTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClubTable,
    ClubData,
    $$ClubTableFilterComposer,
    $$ClubTableOrderingComposer,
    $$ClubTableAnnotationComposer,
    $$ClubTableCreateCompanionBuilder,
    $$ClubTableUpdateCompanionBuilder,
    (ClubData, BaseReferences<_$AppDatabase, $ClubTable, ClubData>),
    ClubData,
    PrefetchHooks Function()> {
  $$ClubTableTableManager(_$AppDatabase db, $ClubTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClubTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClubTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClubTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClubCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String description,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClubCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClubTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClubTable,
    ClubData,
    $$ClubTableFilterComposer,
    $$ClubTableOrderingComposer,
    $$ClubTableAnnotationComposer,
    $$ClubTableCreateCompanionBuilder,
    $$ClubTableUpdateCompanionBuilder,
    (ClubData, BaseReferences<_$AppDatabase, $ClubTable, ClubData>),
    ClubData,
    PrefetchHooks Function()>;
typedef $$DisciplineTypeTableCreateCompanionBuilder = DisciplineTypeCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$DisciplineTypeTableUpdateCompanionBuilder = DisciplineTypeCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

class $$DisciplineTypeTableFilterComposer
    extends Composer<_$AppDatabase, $DisciplineTypeTable> {
  $$DisciplineTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$DisciplineTypeTableOrderingComposer
    extends Composer<_$AppDatabase, $DisciplineTypeTable> {
  $$DisciplineTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$DisciplineTypeTableAnnotationComposer
    extends Composer<_$AppDatabase, $DisciplineTypeTable> {
  $$DisciplineTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$DisciplineTypeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DisciplineTypeTable,
    DisciplineTypeData,
    $$DisciplineTypeTableFilterComposer,
    $$DisciplineTypeTableOrderingComposer,
    $$DisciplineTypeTableAnnotationComposer,
    $$DisciplineTypeTableCreateCompanionBuilder,
    $$DisciplineTypeTableUpdateCompanionBuilder,
    (
      DisciplineTypeData,
      BaseReferences<_$AppDatabase, $DisciplineTypeTable, DisciplineTypeData>
    ),
    DisciplineTypeData,
    PrefetchHooks Function()> {
  $$DisciplineTypeTableTableManager(
      _$AppDatabase db, $DisciplineTypeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DisciplineTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DisciplineTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DisciplineTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DisciplineTypeCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DisciplineTypeCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DisciplineTypeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DisciplineTypeTable,
    DisciplineTypeData,
    $$DisciplineTypeTableFilterComposer,
    $$DisciplineTypeTableOrderingComposer,
    $$DisciplineTypeTableAnnotationComposer,
    $$DisciplineTypeTableCreateCompanionBuilder,
    $$DisciplineTypeTableUpdateCompanionBuilder,
    (
      DisciplineTypeData,
      BaseReferences<_$AppDatabase, $DisciplineTypeTable, DisciplineTypeData>
    ),
    DisciplineTypeData,
    PrefetchHooks Function()>;
typedef $$DisciplineTableCreateCompanionBuilder = DisciplineCompanion Function({
  Value<int> id,
  required int disciplineTypeId,
  required String description,
  required String shortDescription,
  required String descriptionEn,
  required String shortDescriptionEn,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$DisciplineTableUpdateCompanionBuilder = DisciplineCompanion Function({
  Value<int> id,
  Value<int> disciplineTypeId,
  Value<String> description,
  Value<String> shortDescription,
  Value<String> descriptionEn,
  Value<String> shortDescriptionEn,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

class $$DisciplineTableFilterComposer
    extends Composer<_$AppDatabase, $DisciplineTable> {
  $$DisciplineTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get disciplineTypeId => $composableBuilder(
      column: $table.disciplineTypeId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descriptionEn => $composableBuilder(
      column: $table.descriptionEn, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortDescriptionEn => $composableBuilder(
      column: $table.shortDescriptionEn,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$DisciplineTableOrderingComposer
    extends Composer<_$AppDatabase, $DisciplineTable> {
  $$DisciplineTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get disciplineTypeId => $composableBuilder(
      column: $table.disciplineTypeId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descriptionEn => $composableBuilder(
      column: $table.descriptionEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortDescriptionEn => $composableBuilder(
      column: $table.shortDescriptionEn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$DisciplineTableAnnotationComposer
    extends Composer<_$AppDatabase, $DisciplineTable> {
  $$DisciplineTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get disciplineTypeId => $composableBuilder(
      column: $table.disciplineTypeId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get shortDescription => $composableBuilder(
      column: $table.shortDescription, builder: (column) => column);

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
      column: $table.descriptionEn, builder: (column) => column);

  GeneratedColumn<String> get shortDescriptionEn => $composableBuilder(
      column: $table.shortDescriptionEn, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$DisciplineTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DisciplineTable,
    DisciplineData,
    $$DisciplineTableFilterComposer,
    $$DisciplineTableOrderingComposer,
    $$DisciplineTableAnnotationComposer,
    $$DisciplineTableCreateCompanionBuilder,
    $$DisciplineTableUpdateCompanionBuilder,
    (
      DisciplineData,
      BaseReferences<_$AppDatabase, $DisciplineTable, DisciplineData>
    ),
    DisciplineData,
    PrefetchHooks Function()> {
  $$DisciplineTableTableManager(_$AppDatabase db, $DisciplineTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DisciplineTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DisciplineTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DisciplineTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> disciplineTypeId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> shortDescription = const Value.absent(),
            Value<String> descriptionEn = const Value.absent(),
            Value<String> shortDescriptionEn = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DisciplineCompanion(
            id: id,
            disciplineTypeId: disciplineTypeId,
            description: description,
            shortDescription: shortDescription,
            descriptionEn: descriptionEn,
            shortDescriptionEn: shortDescriptionEn,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int disciplineTypeId,
            required String description,
            required String shortDescription,
            required String descriptionEn,
            required String shortDescriptionEn,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              DisciplineCompanion.insert(
            id: id,
            disciplineTypeId: disciplineTypeId,
            description: description,
            shortDescription: shortDescription,
            descriptionEn: descriptionEn,
            shortDescriptionEn: shortDescriptionEn,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DisciplineTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DisciplineTable,
    DisciplineData,
    $$DisciplineTableFilterComposer,
    $$DisciplineTableOrderingComposer,
    $$DisciplineTableAnnotationComposer,
    $$DisciplineTableCreateCompanionBuilder,
    $$DisciplineTableUpdateCompanionBuilder,
    (
      DisciplineData,
      BaseReferences<_$AppDatabase, $DisciplineTable, DisciplineData>
    ),
    DisciplineData,
    PrefetchHooks Function()>;
typedef $$GroupAthleteTableCreateCompanionBuilder = GroupAthleteCompanion
    Function({
  required String groupId,
  required String athleteId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$GroupAthleteTableUpdateCompanionBuilder = GroupAthleteCompanion
    Function({
  Value<String> groupId,
  Value<String> athleteId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$GroupAthleteTableFilterComposer
    extends Composer<_$AppDatabase, $GroupAthleteTable> {
  $$GroupAthleteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$GroupAthleteTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupAthleteTable> {
  $$GroupAthleteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$GroupAthleteTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupAthleteTable> {
  $$GroupAthleteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get athleteId =>
      $composableBuilder(column: $table.athleteId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$GroupAthleteTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroupAthleteTable,
    GroupAthleteData,
    $$GroupAthleteTableFilterComposer,
    $$GroupAthleteTableOrderingComposer,
    $$GroupAthleteTableAnnotationComposer,
    $$GroupAthleteTableCreateCompanionBuilder,
    $$GroupAthleteTableUpdateCompanionBuilder,
    (
      GroupAthleteData,
      BaseReferences<_$AppDatabase, $GroupAthleteTable, GroupAthleteData>
    ),
    GroupAthleteData,
    PrefetchHooks Function()> {
  $$GroupAthleteTableTableManager(_$AppDatabase db, $GroupAthleteTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupAthleteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupAthleteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupAthleteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> groupId = const Value.absent(),
            Value<String> athleteId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupAthleteCompanion(
            groupId: groupId,
            athleteId: athleteId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String groupId,
            required String athleteId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupAthleteCompanion.insert(
            groupId: groupId,
            athleteId: athleteId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupAthleteTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GroupAthleteTable,
    GroupAthleteData,
    $$GroupAthleteTableFilterComposer,
    $$GroupAthleteTableOrderingComposer,
    $$GroupAthleteTableAnnotationComposer,
    $$GroupAthleteTableCreateCompanionBuilder,
    $$GroupAthleteTableUpdateCompanionBuilder,
    (
      GroupAthleteData,
      BaseReferences<_$AppDatabase, $GroupAthleteTable, GroupAthleteData>
    ),
    GroupAthleteData,
    PrefetchHooks Function()>;
typedef $$GroupTrainerTableCreateCompanionBuilder = GroupTrainerCompanion
    Function({
  required String groupId,
  required String trainerId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$GroupTrainerTableUpdateCompanionBuilder = GroupTrainerCompanion
    Function({
  Value<String> groupId,
  Value<String> trainerId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$GroupTrainerTableFilterComposer
    extends Composer<_$AppDatabase, $GroupTrainerTable> {
  $$GroupTrainerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trainerId => $composableBuilder(
      column: $table.trainerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$GroupTrainerTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupTrainerTable> {
  $$GroupTrainerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trainerId => $composableBuilder(
      column: $table.trainerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$GroupTrainerTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupTrainerTable> {
  $$GroupTrainerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$GroupTrainerTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroupTrainerTable,
    GroupTrainerData,
    $$GroupTrainerTableFilterComposer,
    $$GroupTrainerTableOrderingComposer,
    $$GroupTrainerTableAnnotationComposer,
    $$GroupTrainerTableCreateCompanionBuilder,
    $$GroupTrainerTableUpdateCompanionBuilder,
    (
      GroupTrainerData,
      BaseReferences<_$AppDatabase, $GroupTrainerTable, GroupTrainerData>
    ),
    GroupTrainerData,
    PrefetchHooks Function()> {
  $$GroupTrainerTableTableManager(_$AppDatabase db, $GroupTrainerTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupTrainerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupTrainerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupTrainerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> groupId = const Value.absent(),
            Value<String> trainerId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupTrainerCompanion(
            groupId: groupId,
            trainerId: trainerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String groupId,
            required String trainerId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupTrainerCompanion.insert(
            groupId: groupId,
            trainerId: trainerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupTrainerTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GroupTrainerTable,
    GroupTrainerData,
    $$GroupTrainerTableFilterComposer,
    $$GroupTrainerTableOrderingComposer,
    $$GroupTrainerTableAnnotationComposer,
    $$GroupTrainerTableCreateCompanionBuilder,
    $$GroupTrainerTableUpdateCompanionBuilder,
    (
      GroupTrainerData,
      BaseReferences<_$AppDatabase, $GroupTrainerTable, GroupTrainerData>
    ),
    GroupTrainerData,
    PrefetchHooks Function()>;
typedef $$GroupTableCreateCompanionBuilder = GroupCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  required String trainingTimeId,
  required String schoolYearId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$GroupTableUpdateCompanionBuilder = GroupCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String> trainingTimeId,
  Value<String> schoolYearId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$GroupTableFilterComposer extends Composer<_$AppDatabase, $GroupTable> {
  $$GroupTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trainingTimeId => $composableBuilder(
      column: $table.trainingTimeId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get schoolYearId => $composableBuilder(
      column: $table.schoolYearId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$GroupTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupTable> {
  $$GroupTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trainingTimeId => $composableBuilder(
      column: $table.trainingTimeId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get schoolYearId => $composableBuilder(
      column: $table.schoolYearId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$GroupTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupTable> {
  $$GroupTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get trainingTimeId => $composableBuilder(
      column: $table.trainingTimeId, builder: (column) => column);

  GeneratedColumn<String> get schoolYearId => $composableBuilder(
      column: $table.schoolYearId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$GroupTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroupTable,
    GroupData,
    $$GroupTableFilterComposer,
    $$GroupTableOrderingComposer,
    $$GroupTableAnnotationComposer,
    $$GroupTableCreateCompanionBuilder,
    $$GroupTableUpdateCompanionBuilder,
    (GroupData, BaseReferences<_$AppDatabase, $GroupTable, GroupData>),
    GroupData,
    PrefetchHooks Function()> {
  $$GroupTableTableManager(_$AppDatabase db, $GroupTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> trainingTimeId = const Value.absent(),
            Value<String> schoolYearId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupCompanion(
            id: id,
            name: name,
            description: description,
            trainingTimeId: trainingTimeId,
            schoolYearId: schoolYearId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            required String trainingTimeId,
            required String schoolYearId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupCompanion.insert(
            id: id,
            name: name,
            description: description,
            trainingTimeId: trainingTimeId,
            schoolYearId: schoolYearId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GroupTable,
    GroupData,
    $$GroupTableFilterComposer,
    $$GroupTableOrderingComposer,
    $$GroupTableAnnotationComposer,
    $$GroupTableCreateCompanionBuilder,
    $$GroupTableUpdateCompanionBuilder,
    (GroupData, BaseReferences<_$AppDatabase, $GroupTable, GroupData>),
    GroupData,
    PrefetchHooks Function()>;
typedef $$GuardianTableCreateCompanionBuilder = GuardianCompanion Function({
  required String id,
  required String firstName,
  required String lastName,
  required String email,
  required String phone,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$GuardianTableUpdateCompanionBuilder = GuardianCompanion Function({
  Value<String> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> email,
  Value<String> phone,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$GuardianTableFilterComposer
    extends Composer<_$AppDatabase, $GuardianTable> {
  $$GuardianTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$GuardianTableOrderingComposer
    extends Composer<_$AppDatabase, $GuardianTable> {
  $$GuardianTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$GuardianTableAnnotationComposer
    extends Composer<_$AppDatabase, $GuardianTable> {
  $$GuardianTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$GuardianTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GuardianTable,
    GuardianData,
    $$GuardianTableFilterComposer,
    $$GuardianTableOrderingComposer,
    $$GuardianTableAnnotationComposer,
    $$GuardianTableCreateCompanionBuilder,
    $$GuardianTableUpdateCompanionBuilder,
    (GuardianData, BaseReferences<_$AppDatabase, $GuardianTable, GuardianData>),
    GuardianData,
    PrefetchHooks Function()> {
  $$GuardianTableTableManager(_$AppDatabase db, $GuardianTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuardianTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuardianTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuardianTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GuardianCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String firstName,
            required String lastName,
            required String email,
            required String phone,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GuardianCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GuardianTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GuardianTable,
    GuardianData,
    $$GuardianTableFilterComposer,
    $$GuardianTableOrderingComposer,
    $$GuardianTableAnnotationComposer,
    $$GuardianTableCreateCompanionBuilder,
    $$GuardianTableUpdateCompanionBuilder,
    (GuardianData, BaseReferences<_$AppDatabase, $GuardianTable, GuardianData>),
    GuardianData,
    PrefetchHooks Function()>;
typedef $$ItemTypeTableCreateCompanionBuilder = ItemTypeCompanion Function({
  required String id,
  required String name,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ItemTypeTableUpdateCompanionBuilder = ItemTypeCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$ItemTypeTableFilterComposer
    extends Composer<_$AppDatabase, $ItemTypeTable> {
  $$ItemTypeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$ItemTypeTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemTypeTable> {
  $$ItemTypeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$ItemTypeTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemTypeTable> {
  $$ItemTypeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ItemTypeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemTypeTable,
    ItemTypeData,
    $$ItemTypeTableFilterComposer,
    $$ItemTypeTableOrderingComposer,
    $$ItemTypeTableAnnotationComposer,
    $$ItemTypeTableCreateCompanionBuilder,
    $$ItemTypeTableUpdateCompanionBuilder,
    (ItemTypeData, BaseReferences<_$AppDatabase, $ItemTypeTable, ItemTypeData>),
    ItemTypeData,
    PrefetchHooks Function()> {
  $$ItemTypeTableTableManager(_$AppDatabase db, $ItemTypeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemTypeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemTypeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemTypeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemTypeCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemTypeCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ItemTypeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ItemTypeTable,
    ItemTypeData,
    $$ItemTypeTableFilterComposer,
    $$ItemTypeTableOrderingComposer,
    $$ItemTypeTableAnnotationComposer,
    $$ItemTypeTableCreateCompanionBuilder,
    $$ItemTypeTableUpdateCompanionBuilder,
    (ItemTypeData, BaseReferences<_$AppDatabase, $ItemTypeTable, ItemTypeData>),
    ItemTypeData,
    PrefetchHooks Function()>;
typedef $$ItemTableCreateCompanionBuilder = ItemCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> image,
  required int count,
  required String itemTypeId,
  Value<String?> athleteId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ItemTableUpdateCompanionBuilder = ItemCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> image,
  Value<int> count,
  Value<String> itemTypeId,
  Value<String?> athleteId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$ItemTableFilterComposer extends Composer<_$AppDatabase, $ItemTable> {
  $$ItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemTypeId => $composableBuilder(
      column: $table.itemTypeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$ItemTableOrderingComposer extends Composer<_$AppDatabase, $ItemTable> {
  $$ItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get count => $composableBuilder(
      column: $table.count, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemTypeId => $composableBuilder(
      column: $table.itemTypeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$ItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemTable> {
  $$ItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<String> get itemTypeId => $composableBuilder(
      column: $table.itemTypeId, builder: (column) => column);

  GeneratedColumn<String> get athleteId =>
      $composableBuilder(column: $table.athleteId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$ItemTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemTable,
    ItemData,
    $$ItemTableFilterComposer,
    $$ItemTableOrderingComposer,
    $$ItemTableAnnotationComposer,
    $$ItemTableCreateCompanionBuilder,
    $$ItemTableUpdateCompanionBuilder,
    (ItemData, BaseReferences<_$AppDatabase, $ItemTable, ItemData>),
    ItemData,
    PrefetchHooks Function()> {
  $$ItemTableTableManager(_$AppDatabase db, $ItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int> count = const Value.absent(),
            Value<String> itemTypeId = const Value.absent(),
            Value<String?> athleteId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemCompanion(
            id: id,
            name: name,
            description: description,
            image: image,
            count: count,
            itemTypeId: itemTypeId,
            athleteId: athleteId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            required int count,
            required String itemTypeId,
            Value<String?> athleteId = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemCompanion.insert(
            id: id,
            name: name,
            description: description,
            image: image,
            count: count,
            itemTypeId: itemTypeId,
            athleteId: athleteId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ItemTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ItemTable,
    ItemData,
    $$ItemTableFilterComposer,
    $$ItemTableOrderingComposer,
    $$ItemTableAnnotationComposer,
    $$ItemTableCreateCompanionBuilder,
    $$ItemTableUpdateCompanionBuilder,
    (ItemData, BaseReferences<_$AppDatabase, $ItemTable, ItemData>),
    ItemData,
    PrefetchHooks Function()>;
typedef $$MeetEventTableCreateCompanionBuilder = MeetEventCompanion Function({
  required String id,
  required String meetId,
  required String meetType,
  required int disciplineId,
  required int categoryId,
  required DateTime startAt,
  Value<String?> phase,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$MeetEventTableUpdateCompanionBuilder = MeetEventCompanion Function({
  Value<String> id,
  Value<String> meetId,
  Value<String> meetType,
  Value<int> disciplineId,
  Value<int> categoryId,
  Value<DateTime> startAt,
  Value<String?> phase,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$MeetEventTableFilterComposer
    extends Composer<_$AppDatabase, $MeetEventTable> {
  $$MeetEventTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetId => $composableBuilder(
      column: $table.meetId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetType => $composableBuilder(
      column: $table.meetType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get disciplineId => $composableBuilder(
      column: $table.disciplineId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startAt => $composableBuilder(
      column: $table.startAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phase => $composableBuilder(
      column: $table.phase, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$MeetEventTableOrderingComposer
    extends Composer<_$AppDatabase, $MeetEventTable> {
  $$MeetEventTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetId => $composableBuilder(
      column: $table.meetId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetType => $composableBuilder(
      column: $table.meetType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get disciplineId => $composableBuilder(
      column: $table.disciplineId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
      column: $table.startAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phase => $composableBuilder(
      column: $table.phase, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$MeetEventTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeetEventTable> {
  $$MeetEventTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get meetId =>
      $composableBuilder(column: $table.meetId, builder: (column) => column);

  GeneratedColumn<String> get meetType =>
      $composableBuilder(column: $table.meetType, builder: (column) => column);

  GeneratedColumn<int> get disciplineId => $composableBuilder(
      column: $table.disciplineId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<String> get phase =>
      $composableBuilder(column: $table.phase, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$MeetEventTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MeetEventTable,
    MeetEventData,
    $$MeetEventTableFilterComposer,
    $$MeetEventTableOrderingComposer,
    $$MeetEventTableAnnotationComposer,
    $$MeetEventTableCreateCompanionBuilder,
    $$MeetEventTableUpdateCompanionBuilder,
    (
      MeetEventData,
      BaseReferences<_$AppDatabase, $MeetEventTable, MeetEventData>
    ),
    MeetEventData,
    PrefetchHooks Function()> {
  $$MeetEventTableTableManager(_$AppDatabase db, $MeetEventTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeetEventTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeetEventTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeetEventTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> meetId = const Value.absent(),
            Value<String> meetType = const Value.absent(),
            Value<int> disciplineId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<DateTime> startAt = const Value.absent(),
            Value<String?> phase = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetEventCompanion(
            id: id,
            meetId: meetId,
            meetType: meetType,
            disciplineId: disciplineId,
            categoryId: categoryId,
            startAt: startAt,
            phase: phase,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String meetId,
            required String meetType,
            required int disciplineId,
            required int categoryId,
            required DateTime startAt,
            Value<String?> phase = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetEventCompanion.insert(
            id: id,
            meetId: meetId,
            meetType: meetType,
            disciplineId: disciplineId,
            categoryId: categoryId,
            startAt: startAt,
            phase: phase,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MeetEventTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MeetEventTable,
    MeetEventData,
    $$MeetEventTableFilterComposer,
    $$MeetEventTableOrderingComposer,
    $$MeetEventTableAnnotationComposer,
    $$MeetEventTableCreateCompanionBuilder,
    $$MeetEventTableUpdateCompanionBuilder,
    (
      MeetEventData,
      BaseReferences<_$AppDatabase, $MeetEventTable, MeetEventData>
    ),
    MeetEventData,
    PrefetchHooks Function()>;
typedef $$MeetTableCreateCompanionBuilder = MeetCompanion Function({
  required String id,
  required String name,
  required DateTime startAt,
  required DateTime endAt,
  Value<String?> location,
  Value<String?> organizer,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$MeetTableUpdateCompanionBuilder = MeetCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<DateTime> startAt,
  Value<DateTime> endAt,
  Value<String?> location,
  Value<String?> organizer,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$MeetTableFilterComposer extends Composer<_$AppDatabase, $MeetTable> {
  $$MeetTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startAt => $composableBuilder(
      column: $table.startAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endAt => $composableBuilder(
      column: $table.endAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get organizer => $composableBuilder(
      column: $table.organizer, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$MeetTableOrderingComposer extends Composer<_$AppDatabase, $MeetTable> {
  $$MeetTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
      column: $table.startAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endAt => $composableBuilder(
      column: $table.endAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get organizer => $composableBuilder(
      column: $table.organizer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$MeetTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeetTable> {
  $$MeetTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get organizer =>
      $composableBuilder(column: $table.organizer, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$MeetTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MeetTable,
    MeetData,
    $$MeetTableFilterComposer,
    $$MeetTableOrderingComposer,
    $$MeetTableAnnotationComposer,
    $$MeetTableCreateCompanionBuilder,
    $$MeetTableUpdateCompanionBuilder,
    (MeetData, BaseReferences<_$AppDatabase, $MeetTable, MeetData>),
    MeetData,
    PrefetchHooks Function()> {
  $$MeetTableTableManager(_$AppDatabase db, $MeetTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeetTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeetTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeetTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> startAt = const Value.absent(),
            Value<DateTime> endAt = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<String?> organizer = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetCompanion(
            id: id,
            name: name,
            startAt: startAt,
            endAt: endAt,
            location: location,
            organizer: organizer,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required DateTime startAt,
            required DateTime endAt,
            Value<String?> location = const Value.absent(),
            Value<String?> organizer = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MeetCompanion.insert(
            id: id,
            name: name,
            startAt: startAt,
            endAt: endAt,
            location: location,
            organizer: organizer,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MeetTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MeetTable,
    MeetData,
    $$MeetTableFilterComposer,
    $$MeetTableOrderingComposer,
    $$MeetTableAnnotationComposer,
    $$MeetTableCreateCompanionBuilder,
    $$MeetTableUpdateCompanionBuilder,
    (MeetData, BaseReferences<_$AppDatabase, $MeetTable, MeetData>),
    MeetData,
    PrefetchHooks Function()>;
typedef $$RemoteConfigTableCreateCompanionBuilder = RemoteConfigCompanion
    Function({
  Value<int> id,
  Value<String?> urgentMessage,
  required String minimumAppVersion,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$RemoteConfigTableUpdateCompanionBuilder = RemoteConfigCompanion
    Function({
  Value<int> id,
  Value<String?> urgentMessage,
  Value<String> minimumAppVersion,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

class $$RemoteConfigTableFilterComposer
    extends Composer<_$AppDatabase, $RemoteConfigTable> {
  $$RemoteConfigTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get urgentMessage => $composableBuilder(
      column: $table.urgentMessage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get minimumAppVersion => $composableBuilder(
      column: $table.minimumAppVersion,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$RemoteConfigTableOrderingComposer
    extends Composer<_$AppDatabase, $RemoteConfigTable> {
  $$RemoteConfigTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get urgentMessage => $composableBuilder(
      column: $table.urgentMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get minimumAppVersion => $composableBuilder(
      column: $table.minimumAppVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$RemoteConfigTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemoteConfigTable> {
  $$RemoteConfigTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get urgentMessage => $composableBuilder(
      column: $table.urgentMessage, builder: (column) => column);

  GeneratedColumn<String> get minimumAppVersion => $composableBuilder(
      column: $table.minimumAppVersion, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$RemoteConfigTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RemoteConfigTable,
    RemoteConfigData,
    $$RemoteConfigTableFilterComposer,
    $$RemoteConfigTableOrderingComposer,
    $$RemoteConfigTableAnnotationComposer,
    $$RemoteConfigTableCreateCompanionBuilder,
    $$RemoteConfigTableUpdateCompanionBuilder,
    (
      RemoteConfigData,
      BaseReferences<_$AppDatabase, $RemoteConfigTable, RemoteConfigData>
    ),
    RemoteConfigData,
    PrefetchHooks Function()> {
  $$RemoteConfigTableTableManager(_$AppDatabase db, $RemoteConfigTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemoteConfigTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemoteConfigTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemoteConfigTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> urgentMessage = const Value.absent(),
            Value<String> minimumAppVersion = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              RemoteConfigCompanion(
            id: id,
            urgentMessage: urgentMessage,
            minimumAppVersion: minimumAppVersion,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> urgentMessage = const Value.absent(),
            required String minimumAppVersion,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              RemoteConfigCompanion.insert(
            id: id,
            urgentMessage: urgentMessage,
            minimumAppVersion: minimumAppVersion,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RemoteConfigTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RemoteConfigTable,
    RemoteConfigData,
    $$RemoteConfigTableFilterComposer,
    $$RemoteConfigTableOrderingComposer,
    $$RemoteConfigTableAnnotationComposer,
    $$RemoteConfigTableCreateCompanionBuilder,
    $$RemoteConfigTableUpdateCompanionBuilder,
    (
      RemoteConfigData,
      BaseReferences<_$AppDatabase, $RemoteConfigTable, RemoteConfigData>
    ),
    RemoteConfigData,
    PrefetchHooks Function()>;
typedef $$SchoolYearTableCreateCompanionBuilder = SchoolYearCompanion Function({
  required String id,
  required String name,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$SchoolYearTableUpdateCompanionBuilder = SchoolYearCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$SchoolYearTableFilterComposer
    extends Composer<_$AppDatabase, $SchoolYearTable> {
  $$SchoolYearTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$SchoolYearTableOrderingComposer
    extends Composer<_$AppDatabase, $SchoolYearTable> {
  $$SchoolYearTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$SchoolYearTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchoolYearTable> {
  $$SchoolYearTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$SchoolYearTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SchoolYearTable,
    SchoolYearData,
    $$SchoolYearTableFilterComposer,
    $$SchoolYearTableOrderingComposer,
    $$SchoolYearTableAnnotationComposer,
    $$SchoolYearTableCreateCompanionBuilder,
    $$SchoolYearTableUpdateCompanionBuilder,
    (
      SchoolYearData,
      BaseReferences<_$AppDatabase, $SchoolYearTable, SchoolYearData>
    ),
    SchoolYearData,
    PrefetchHooks Function()> {
  $$SchoolYearTableTableManager(_$AppDatabase db, $SchoolYearTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchoolYearTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SchoolYearTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SchoolYearTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SchoolYearCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SchoolYearCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SchoolYearTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SchoolYearTable,
    SchoolYearData,
    $$SchoolYearTableFilterComposer,
    $$SchoolYearTableOrderingComposer,
    $$SchoolYearTableAnnotationComposer,
    $$SchoolYearTableCreateCompanionBuilder,
    $$SchoolYearTableUpdateCompanionBuilder,
    (
      SchoolYearData,
      BaseReferences<_$AppDatabase, $SchoolYearTable, SchoolYearData>
    ),
    SchoolYearData,
    PrefetchHooks Function()>;
typedef $$SignUpFormStatusTableCreateCompanionBuilder
    = SignUpFormStatusCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$SignUpFormStatusTableUpdateCompanionBuilder
    = SignUpFormStatusCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$SignUpFormStatusTableFilterComposer
    extends Composer<_$AppDatabase, $SignUpFormStatusTable> {
  $$SignUpFormStatusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$SignUpFormStatusTableOrderingComposer
    extends Composer<_$AppDatabase, $SignUpFormStatusTable> {
  $$SignUpFormStatusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$SignUpFormStatusTableAnnotationComposer
    extends Composer<_$AppDatabase, $SignUpFormStatusTable> {
  $$SignUpFormStatusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$SignUpFormStatusTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SignUpFormStatusTable,
    SignUpFormStatusData,
    $$SignUpFormStatusTableFilterComposer,
    $$SignUpFormStatusTableOrderingComposer,
    $$SignUpFormStatusTableAnnotationComposer,
    $$SignUpFormStatusTableCreateCompanionBuilder,
    $$SignUpFormStatusTableUpdateCompanionBuilder,
    (
      SignUpFormStatusData,
      BaseReferences<_$AppDatabase, $SignUpFormStatusTable,
          SignUpFormStatusData>
    ),
    SignUpFormStatusData,
    PrefetchHooks Function()> {
  $$SignUpFormStatusTableTableManager(
      _$AppDatabase db, $SignUpFormStatusTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SignUpFormStatusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SignUpFormStatusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SignUpFormStatusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SignUpFormStatusCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SignUpFormStatusCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SignUpFormStatusTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SignUpFormStatusTable,
    SignUpFormStatusData,
    $$SignUpFormStatusTableFilterComposer,
    $$SignUpFormStatusTableOrderingComposer,
    $$SignUpFormStatusTableAnnotationComposer,
    $$SignUpFormStatusTableCreateCompanionBuilder,
    $$SignUpFormStatusTableUpdateCompanionBuilder,
    (
      SignUpFormStatusData,
      BaseReferences<_$AppDatabase, $SignUpFormStatusTable,
          SignUpFormStatusData>
    ),
    SignUpFormStatusData,
    PrefetchHooks Function()>;
typedef $$SignUpFormTableCreateCompanionBuilder = SignUpFormCompanion Function({
  required String id,
  required String birthNumber,
  required String firstName,
  required String lastName,
  required String street,
  required String city,
  required String zip,
  Value<String?> email,
  Value<String?> phone,
  required String guardianFirstName1,
  required String guardianLastName1,
  Value<String?> guardianFirstName2,
  Value<String?> guardianLastName2,
  required String guardianPhone1,
  required String guardianEmail1,
  Value<String?> guardianPhone2,
  Value<String?> guardianEmail2,
  Value<String?> note,
  required String signUpFormStatusId,
  required String schoolYearId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$SignUpFormTableUpdateCompanionBuilder = SignUpFormCompanion Function({
  Value<String> id,
  Value<String> birthNumber,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> street,
  Value<String> city,
  Value<String> zip,
  Value<String?> email,
  Value<String?> phone,
  Value<String> guardianFirstName1,
  Value<String> guardianLastName1,
  Value<String?> guardianFirstName2,
  Value<String?> guardianLastName2,
  Value<String> guardianPhone1,
  Value<String> guardianEmail1,
  Value<String?> guardianPhone2,
  Value<String?> guardianEmail2,
  Value<String?> note,
  Value<String> signUpFormStatusId,
  Value<String> schoolYearId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$SignUpFormTableFilterComposer
    extends Composer<_$AppDatabase, $SignUpFormTable> {
  $$SignUpFormTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get birthNumber => $composableBuilder(
      column: $table.birthNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get zip => $composableBuilder(
      column: $table.zip, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianFirstName1 => $composableBuilder(
      column: $table.guardianFirstName1,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianLastName1 => $composableBuilder(
      column: $table.guardianLastName1,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianFirstName2 => $composableBuilder(
      column: $table.guardianFirstName2,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianLastName2 => $composableBuilder(
      column: $table.guardianLastName2,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianPhone1 => $composableBuilder(
      column: $table.guardianPhone1,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianEmail1 => $composableBuilder(
      column: $table.guardianEmail1,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianPhone2 => $composableBuilder(
      column: $table.guardianPhone2,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianEmail2 => $composableBuilder(
      column: $table.guardianEmail2,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get signUpFormStatusId => $composableBuilder(
      column: $table.signUpFormStatusId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get schoolYearId => $composableBuilder(
      column: $table.schoolYearId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$SignUpFormTableOrderingComposer
    extends Composer<_$AppDatabase, $SignUpFormTable> {
  $$SignUpFormTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get birthNumber => $composableBuilder(
      column: $table.birthNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zip => $composableBuilder(
      column: $table.zip, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianFirstName1 => $composableBuilder(
      column: $table.guardianFirstName1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianLastName1 => $composableBuilder(
      column: $table.guardianLastName1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianFirstName2 => $composableBuilder(
      column: $table.guardianFirstName2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianLastName2 => $composableBuilder(
      column: $table.guardianLastName2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianPhone1 => $composableBuilder(
      column: $table.guardianPhone1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianEmail1 => $composableBuilder(
      column: $table.guardianEmail1,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianPhone2 => $composableBuilder(
      column: $table.guardianPhone2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianEmail2 => $composableBuilder(
      column: $table.guardianEmail2,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get signUpFormStatusId => $composableBuilder(
      column: $table.signUpFormStatusId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get schoolYearId => $composableBuilder(
      column: $table.schoolYearId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$SignUpFormTableAnnotationComposer
    extends Composer<_$AppDatabase, $SignUpFormTable> {
  $$SignUpFormTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get birthNumber => $composableBuilder(
      column: $table.birthNumber, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get zip =>
      $composableBuilder(column: $table.zip, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get guardianFirstName1 => $composableBuilder(
      column: $table.guardianFirstName1, builder: (column) => column);

  GeneratedColumn<String> get guardianLastName1 => $composableBuilder(
      column: $table.guardianLastName1, builder: (column) => column);

  GeneratedColumn<String> get guardianFirstName2 => $composableBuilder(
      column: $table.guardianFirstName2, builder: (column) => column);

  GeneratedColumn<String> get guardianLastName2 => $composableBuilder(
      column: $table.guardianLastName2, builder: (column) => column);

  GeneratedColumn<String> get guardianPhone1 => $composableBuilder(
      column: $table.guardianPhone1, builder: (column) => column);

  GeneratedColumn<String> get guardianEmail1 => $composableBuilder(
      column: $table.guardianEmail1, builder: (column) => column);

  GeneratedColumn<String> get guardianPhone2 => $composableBuilder(
      column: $table.guardianPhone2, builder: (column) => column);

  GeneratedColumn<String> get guardianEmail2 => $composableBuilder(
      column: $table.guardianEmail2, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<String> get signUpFormStatusId => $composableBuilder(
      column: $table.signUpFormStatusId, builder: (column) => column);

  GeneratedColumn<String> get schoolYearId => $composableBuilder(
      column: $table.schoolYearId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$SignUpFormTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SignUpFormTable,
    SignUpFormData,
    $$SignUpFormTableFilterComposer,
    $$SignUpFormTableOrderingComposer,
    $$SignUpFormTableAnnotationComposer,
    $$SignUpFormTableCreateCompanionBuilder,
    $$SignUpFormTableUpdateCompanionBuilder,
    (
      SignUpFormData,
      BaseReferences<_$AppDatabase, $SignUpFormTable, SignUpFormData>
    ),
    SignUpFormData,
    PrefetchHooks Function()> {
  $$SignUpFormTableTableManager(_$AppDatabase db, $SignUpFormTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SignUpFormTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SignUpFormTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SignUpFormTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> birthNumber = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> street = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<String> zip = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String> guardianFirstName1 = const Value.absent(),
            Value<String> guardianLastName1 = const Value.absent(),
            Value<String?> guardianFirstName2 = const Value.absent(),
            Value<String?> guardianLastName2 = const Value.absent(),
            Value<String> guardianPhone1 = const Value.absent(),
            Value<String> guardianEmail1 = const Value.absent(),
            Value<String?> guardianPhone2 = const Value.absent(),
            Value<String?> guardianEmail2 = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String> signUpFormStatusId = const Value.absent(),
            Value<String> schoolYearId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SignUpFormCompanion(
            id: id,
            birthNumber: birthNumber,
            firstName: firstName,
            lastName: lastName,
            street: street,
            city: city,
            zip: zip,
            email: email,
            phone: phone,
            guardianFirstName1: guardianFirstName1,
            guardianLastName1: guardianLastName1,
            guardianFirstName2: guardianFirstName2,
            guardianLastName2: guardianLastName2,
            guardianPhone1: guardianPhone1,
            guardianEmail1: guardianEmail1,
            guardianPhone2: guardianPhone2,
            guardianEmail2: guardianEmail2,
            note: note,
            signUpFormStatusId: signUpFormStatusId,
            schoolYearId: schoolYearId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String birthNumber,
            required String firstName,
            required String lastName,
            required String street,
            required String city,
            required String zip,
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            required String guardianFirstName1,
            required String guardianLastName1,
            Value<String?> guardianFirstName2 = const Value.absent(),
            Value<String?> guardianLastName2 = const Value.absent(),
            required String guardianPhone1,
            required String guardianEmail1,
            Value<String?> guardianPhone2 = const Value.absent(),
            Value<String?> guardianEmail2 = const Value.absent(),
            Value<String?> note = const Value.absent(),
            required String signUpFormStatusId,
            required String schoolYearId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SignUpFormCompanion.insert(
            id: id,
            birthNumber: birthNumber,
            firstName: firstName,
            lastName: lastName,
            street: street,
            city: city,
            zip: zip,
            email: email,
            phone: phone,
            guardianFirstName1: guardianFirstName1,
            guardianLastName1: guardianLastName1,
            guardianFirstName2: guardianFirstName2,
            guardianLastName2: guardianLastName2,
            guardianPhone1: guardianPhone1,
            guardianEmail1: guardianEmail1,
            guardianPhone2: guardianPhone2,
            guardianEmail2: guardianEmail2,
            note: note,
            signUpFormStatusId: signUpFormStatusId,
            schoolYearId: schoolYearId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SignUpFormTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SignUpFormTable,
    SignUpFormData,
    $$SignUpFormTableFilterComposer,
    $$SignUpFormTableOrderingComposer,
    $$SignUpFormTableAnnotationComposer,
    $$SignUpFormTableCreateCompanionBuilder,
    $$SignUpFormTableUpdateCompanionBuilder,
    (
      SignUpFormData,
      BaseReferences<_$AppDatabase, $SignUpFormTable, SignUpFormData>
    ),
    SignUpFormData,
    PrefetchHooks Function()>;
typedef $$TrainerStatusTableCreateCompanionBuilder = TrainerStatusCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TrainerStatusTableUpdateCompanionBuilder = TrainerStatusCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TrainerStatusTableFilterComposer
    extends Composer<_$AppDatabase, $TrainerStatusTable> {
  $$TrainerStatusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TrainerStatusTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainerStatusTable> {
  $$TrainerStatusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TrainerStatusTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainerStatusTable> {
  $$TrainerStatusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TrainerStatusTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainerStatusTable,
    TrainerStatusData,
    $$TrainerStatusTableFilterComposer,
    $$TrainerStatusTableOrderingComposer,
    $$TrainerStatusTableAnnotationComposer,
    $$TrainerStatusTableCreateCompanionBuilder,
    $$TrainerStatusTableUpdateCompanionBuilder,
    (
      TrainerStatusData,
      BaseReferences<_$AppDatabase, $TrainerStatusTable, TrainerStatusData>
    ),
    TrainerStatusData,
    PrefetchHooks Function()> {
  $$TrainerStatusTableTableManager(_$AppDatabase db, $TrainerStatusTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainerStatusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainerStatusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainerStatusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainerStatusCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainerStatusCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainerStatusTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainerStatusTable,
    TrainerStatusData,
    $$TrainerStatusTableFilterComposer,
    $$TrainerStatusTableOrderingComposer,
    $$TrainerStatusTableAnnotationComposer,
    $$TrainerStatusTableCreateCompanionBuilder,
    $$TrainerStatusTableUpdateCompanionBuilder,
    (
      TrainerStatusData,
      BaseReferences<_$AppDatabase, $TrainerStatusTable, TrainerStatusData>
    ),
    TrainerStatusData,
    PrefetchHooks Function()>;
typedef $$TrainerTableCreateCompanionBuilder = TrainerCompanion Function({
  required String id,
  required String athleteId,
  required String trainerStatusId,
  required String qualification,
  required int salaryPerHour,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TrainerTableUpdateCompanionBuilder = TrainerCompanion Function({
  Value<String> id,
  Value<String> athleteId,
  Value<String> trainerStatusId,
  Value<String> qualification,
  Value<int> salaryPerHour,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TrainerTableFilterComposer
    extends Composer<_$AppDatabase, $TrainerTable> {
  $$TrainerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trainerStatusId => $composableBuilder(
      column: $table.trainerStatusId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get qualification => $composableBuilder(
      column: $table.qualification, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get salaryPerHour => $composableBuilder(
      column: $table.salaryPerHour, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TrainerTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainerTable> {
  $$TrainerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trainerStatusId => $composableBuilder(
      column: $table.trainerStatusId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get qualification => $composableBuilder(
      column: $table.qualification,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get salaryPerHour => $composableBuilder(
      column: $table.salaryPerHour,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TrainerTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainerTable> {
  $$TrainerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get athleteId =>
      $composableBuilder(column: $table.athleteId, builder: (column) => column);

  GeneratedColumn<String> get trainerStatusId => $composableBuilder(
      column: $table.trainerStatusId, builder: (column) => column);

  GeneratedColumn<String> get qualification => $composableBuilder(
      column: $table.qualification, builder: (column) => column);

  GeneratedColumn<int> get salaryPerHour => $composableBuilder(
      column: $table.salaryPerHour, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TrainerTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainerTable,
    TrainerData,
    $$TrainerTableFilterComposer,
    $$TrainerTableOrderingComposer,
    $$TrainerTableAnnotationComposer,
    $$TrainerTableCreateCompanionBuilder,
    $$TrainerTableUpdateCompanionBuilder,
    (TrainerData, BaseReferences<_$AppDatabase, $TrainerTable, TrainerData>),
    TrainerData,
    PrefetchHooks Function()> {
  $$TrainerTableTableManager(_$AppDatabase db, $TrainerTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> athleteId = const Value.absent(),
            Value<String> trainerStatusId = const Value.absent(),
            Value<String> qualification = const Value.absent(),
            Value<int> salaryPerHour = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainerCompanion(
            id: id,
            athleteId: athleteId,
            trainerStatusId: trainerStatusId,
            qualification: qualification,
            salaryPerHour: salaryPerHour,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String athleteId,
            required String trainerStatusId,
            required String qualification,
            required int salaryPerHour,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainerCompanion.insert(
            id: id,
            athleteId: athleteId,
            trainerStatusId: trainerStatusId,
            qualification: qualification,
            salaryPerHour: salaryPerHour,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainerTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainerTable,
    TrainerData,
    $$TrainerTableFilterComposer,
    $$TrainerTableOrderingComposer,
    $$TrainerTableAnnotationComposer,
    $$TrainerTableCreateCompanionBuilder,
    $$TrainerTableUpdateCompanionBuilder,
    (TrainerData, BaseReferences<_$AppDatabase, $TrainerTable, TrainerData>),
    TrainerData,
    PrefetchHooks Function()>;
typedef $$TrainingAthleteTableCreateCompanionBuilder = TrainingAthleteCompanion
    Function({
  required String trainingId,
  required String athleteId,
  required String presence,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TrainingAthleteTableUpdateCompanionBuilder = TrainingAthleteCompanion
    Function({
  Value<String> trainingId,
  Value<String> athleteId,
  Value<String> presence,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TrainingAthleteTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingAthleteTable> {
  $$TrainingAthleteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get trainingId => $composableBuilder(
      column: $table.trainingId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get presence => $composableBuilder(
      column: $table.presence, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TrainingAthleteTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingAthleteTable> {
  $$TrainingAthleteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get trainingId => $composableBuilder(
      column: $table.trainingId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get athleteId => $composableBuilder(
      column: $table.athleteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get presence => $composableBuilder(
      column: $table.presence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TrainingAthleteTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingAthleteTable> {
  $$TrainingAthleteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trainingId => $composableBuilder(
      column: $table.trainingId, builder: (column) => column);

  GeneratedColumn<String> get athleteId =>
      $composableBuilder(column: $table.athleteId, builder: (column) => column);

  GeneratedColumn<String> get presence =>
      $composableBuilder(column: $table.presence, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TrainingAthleteTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingAthleteTable,
    TrainingAthleteData,
    $$TrainingAthleteTableFilterComposer,
    $$TrainingAthleteTableOrderingComposer,
    $$TrainingAthleteTableAnnotationComposer,
    $$TrainingAthleteTableCreateCompanionBuilder,
    $$TrainingAthleteTableUpdateCompanionBuilder,
    (
      TrainingAthleteData,
      BaseReferences<_$AppDatabase, $TrainingAthleteTable, TrainingAthleteData>
    ),
    TrainingAthleteData,
    PrefetchHooks Function()> {
  $$TrainingAthleteTableTableManager(
      _$AppDatabase db, $TrainingAthleteTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingAthleteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingAthleteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingAthleteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> trainingId = const Value.absent(),
            Value<String> athleteId = const Value.absent(),
            Value<String> presence = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingAthleteCompanion(
            trainingId: trainingId,
            athleteId: athleteId,
            presence: presence,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String trainingId,
            required String athleteId,
            required String presence,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingAthleteCompanion.insert(
            trainingId: trainingId,
            athleteId: athleteId,
            presence: presence,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainingAthleteTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainingAthleteTable,
    TrainingAthleteData,
    $$TrainingAthleteTableFilterComposer,
    $$TrainingAthleteTableOrderingComposer,
    $$TrainingAthleteTableAnnotationComposer,
    $$TrainingAthleteTableCreateCompanionBuilder,
    $$TrainingAthleteTableUpdateCompanionBuilder,
    (
      TrainingAthleteData,
      BaseReferences<_$AppDatabase, $TrainingAthleteTable, TrainingAthleteData>
    ),
    TrainingAthleteData,
    PrefetchHooks Function()>;
typedef $$TrainingTimeTableCreateCompanionBuilder = TrainingTimeCompanion
    Function({
  required String id,
  required String day,
  required String summerTime,
  required String winterTime,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TrainingTimeTableUpdateCompanionBuilder = TrainingTimeCompanion
    Function({
  Value<String> id,
  Value<String> day,
  Value<String> summerTime,
  Value<String> winterTime,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TrainingTimeTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingTimeTable> {
  $$TrainingTimeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summerTime => $composableBuilder(
      column: $table.summerTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get winterTime => $composableBuilder(
      column: $table.winterTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TrainingTimeTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingTimeTable> {
  $$TrainingTimeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summerTime => $composableBuilder(
      column: $table.summerTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get winterTime => $composableBuilder(
      column: $table.winterTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TrainingTimeTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingTimeTable> {
  $$TrainingTimeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<String> get summerTime => $composableBuilder(
      column: $table.summerTime, builder: (column) => column);

  GeneratedColumn<String> get winterTime => $composableBuilder(
      column: $table.winterTime, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TrainingTimeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingTimeTable,
    TrainingTimeData,
    $$TrainingTimeTableFilterComposer,
    $$TrainingTimeTableOrderingComposer,
    $$TrainingTimeTableAnnotationComposer,
    $$TrainingTimeTableCreateCompanionBuilder,
    $$TrainingTimeTableUpdateCompanionBuilder,
    (
      TrainingTimeData,
      BaseReferences<_$AppDatabase, $TrainingTimeTable, TrainingTimeData>
    ),
    TrainingTimeData,
    PrefetchHooks Function()> {
  $$TrainingTimeTableTableManager(_$AppDatabase db, $TrainingTimeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingTimeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingTimeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingTimeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> day = const Value.absent(),
            Value<String> summerTime = const Value.absent(),
            Value<String> winterTime = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingTimeCompanion(
            id: id,
            day: day,
            summerTime: summerTime,
            winterTime: winterTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String day,
            required String summerTime,
            required String winterTime,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingTimeCompanion.insert(
            id: id,
            day: day,
            summerTime: summerTime,
            winterTime: winterTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainingTimeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainingTimeTable,
    TrainingTimeData,
    $$TrainingTimeTableFilterComposer,
    $$TrainingTimeTableOrderingComposer,
    $$TrainingTimeTableAnnotationComposer,
    $$TrainingTimeTableCreateCompanionBuilder,
    $$TrainingTimeTableUpdateCompanionBuilder,
    (
      TrainingTimeData,
      BaseReferences<_$AppDatabase, $TrainingTimeTable, TrainingTimeData>
    ),
    TrainingTimeData,
    PrefetchHooks Function()>;
typedef $$TrainingTrainerTableCreateCompanionBuilder = TrainingTrainerCompanion
    Function({
  required String trainingId,
  required String trainerId,
  Value<String?> presence,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TrainingTrainerTableUpdateCompanionBuilder = TrainingTrainerCompanion
    Function({
  Value<String> trainingId,
  Value<String> trainerId,
  Value<String?> presence,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TrainingTrainerTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingTrainerTable> {
  $$TrainingTrainerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get trainingId => $composableBuilder(
      column: $table.trainingId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trainerId => $composableBuilder(
      column: $table.trainerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get presence => $composableBuilder(
      column: $table.presence, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TrainingTrainerTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingTrainerTable> {
  $$TrainingTrainerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get trainingId => $composableBuilder(
      column: $table.trainingId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trainerId => $composableBuilder(
      column: $table.trainerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get presence => $composableBuilder(
      column: $table.presence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TrainingTrainerTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingTrainerTable> {
  $$TrainingTrainerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trainingId => $composableBuilder(
      column: $table.trainingId, builder: (column) => column);

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<String> get presence =>
      $composableBuilder(column: $table.presence, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TrainingTrainerTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingTrainerTable,
    TrainingTrainerData,
    $$TrainingTrainerTableFilterComposer,
    $$TrainingTrainerTableOrderingComposer,
    $$TrainingTrainerTableAnnotationComposer,
    $$TrainingTrainerTableCreateCompanionBuilder,
    $$TrainingTrainerTableUpdateCompanionBuilder,
    (
      TrainingTrainerData,
      BaseReferences<_$AppDatabase, $TrainingTrainerTable, TrainingTrainerData>
    ),
    TrainingTrainerData,
    PrefetchHooks Function()> {
  $$TrainingTrainerTableTableManager(
      _$AppDatabase db, $TrainingTrainerTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingTrainerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingTrainerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingTrainerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> trainingId = const Value.absent(),
            Value<String> trainerId = const Value.absent(),
            Value<String?> presence = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingTrainerCompanion(
            trainingId: trainingId,
            trainerId: trainerId,
            presence: presence,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String trainingId,
            required String trainerId,
            Value<String?> presence = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingTrainerCompanion.insert(
            trainingId: trainingId,
            trainerId: trainerId,
            presence: presence,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainingTrainerTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainingTrainerTable,
    TrainingTrainerData,
    $$TrainingTrainerTableFilterComposer,
    $$TrainingTrainerTableOrderingComposer,
    $$TrainingTrainerTableAnnotationComposer,
    $$TrainingTrainerTableCreateCompanionBuilder,
    $$TrainingTrainerTableUpdateCompanionBuilder,
    (
      TrainingTrainerData,
      BaseReferences<_$AppDatabase, $TrainingTrainerTable, TrainingTrainerData>
    ),
    TrainingTrainerData,
    PrefetchHooks Function()>;
typedef $$TrainingTableCreateCompanionBuilder = TrainingCompanion Function({
  required String id,
  required DateTime datetime,
  required String groupId,
  Value<String?> description,
  required int durationMinutes,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$TrainingTableUpdateCompanionBuilder = TrainingCompanion Function({
  Value<String> id,
  Value<DateTime> datetime,
  Value<String> groupId,
  Value<String?> description,
  Value<int> durationMinutes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$TrainingTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingTable> {
  $$TrainingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get datetime => $composableBuilder(
      column: $table.datetime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$TrainingTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingTable> {
  $$TrainingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get datetime => $composableBuilder(
      column: $table.datetime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TrainingTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingTable> {
  $$TrainingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get datetime =>
      $composableBuilder(column: $table.datetime, builder: (column) => column);

  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
      column: $table.durationMinutes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$TrainingTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TrainingTable,
    TrainingData,
    $$TrainingTableFilterComposer,
    $$TrainingTableOrderingComposer,
    $$TrainingTableAnnotationComposer,
    $$TrainingTableCreateCompanionBuilder,
    $$TrainingTableUpdateCompanionBuilder,
    (TrainingData, BaseReferences<_$AppDatabase, $TrainingTable, TrainingData>),
    TrainingData,
    PrefetchHooks Function()> {
  $$TrainingTableTableManager(_$AppDatabase db, $TrainingTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> datetime = const Value.absent(),
            Value<String> groupId = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> durationMinutes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingCompanion(
            id: id,
            datetime: datetime,
            groupId: groupId,
            description: description,
            durationMinutes: durationMinutes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime datetime,
            required String groupId,
            Value<String?> description = const Value.absent(),
            required int durationMinutes,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TrainingCompanion.insert(
            id: id,
            datetime: datetime,
            groupId: groupId,
            description: description,
            durationMinutes: durationMinutes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TrainingTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TrainingTable,
    TrainingData,
    $$TrainingTableFilterComposer,
    $$TrainingTableOrderingComposer,
    $$TrainingTableAnnotationComposer,
    $$TrainingTableCreateCompanionBuilder,
    $$TrainingTableUpdateCompanionBuilder,
    (TrainingData, BaseReferences<_$AppDatabase, $TrainingTable, TrainingData>),
    TrainingData,
    PrefetchHooks Function()>;
typedef $$WebPostTableCreateCompanionBuilder = WebPostCompanion Function({
  required String id,
  required String title,
  required String content,
  required String trainerId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$WebPostTableUpdateCompanionBuilder = WebPostCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> content,
  Value<String> trainerId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$WebPostTableFilterComposer
    extends Composer<_$AppDatabase, $WebPostTable> {
  $$WebPostTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trainerId => $composableBuilder(
      column: $table.trainerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$WebPostTableOrderingComposer
    extends Composer<_$AppDatabase, $WebPostTable> {
  $$WebPostTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trainerId => $composableBuilder(
      column: $table.trainerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$WebPostTableAnnotationComposer
    extends Composer<_$AppDatabase, $WebPostTable> {
  $$WebPostTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get trainerId =>
      $composableBuilder(column: $table.trainerId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$WebPostTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WebPostTable,
    WebPostData,
    $$WebPostTableFilterComposer,
    $$WebPostTableOrderingComposer,
    $$WebPostTableAnnotationComposer,
    $$WebPostTableCreateCompanionBuilder,
    $$WebPostTableUpdateCompanionBuilder,
    (WebPostData, BaseReferences<_$AppDatabase, $WebPostTable, WebPostData>),
    WebPostData,
    PrefetchHooks Function()> {
  $$WebPostTableTableManager(_$AppDatabase db, $WebPostTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WebPostTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WebPostTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WebPostTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> trainerId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WebPostCompanion(
            id: id,
            title: title,
            content: content,
            trainerId: trainerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String content,
            required String trainerId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WebPostCompanion.insert(
            id: id,
            title: title,
            content: content,
            trainerId: trainerId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WebPostTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WebPostTable,
    WebPostData,
    $$WebPostTableFilterComposer,
    $$WebPostTableOrderingComposer,
    $$WebPostTableAnnotationComposer,
    $$WebPostTableCreateCompanionBuilder,
    $$WebPostTableUpdateCompanionBuilder,
    (WebPostData, BaseReferences<_$AppDatabase, $WebPostTable, WebPostData>),
    WebPostData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppSettingTableTableManager get appSetting =>
      $$AppSettingTableTableManager(_db, _db.appSetting);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$UserEmailTableTableManager get userEmail =>
      $$UserEmailTableTableManager(_db, _db.userEmail);
  $$AthleteGuardianTableTableManager get athleteGuardian =>
      $$AthleteGuardianTableTableManager(_db, _db.athleteGuardian);
  $$AthleteMeetEventTableTableManager get athleteMeetEvent =>
      $$AthleteMeetEventTableTableManager(_db, _db.athleteMeetEvent);
  $$AthleteSignUpFormTableTableManager get athleteSignUpForm =>
      $$AthleteSignUpFormTableTableManager(_db, _db.athleteSignUpForm);
  $$AthleteStatusTableTableManager get athleteStatus =>
      $$AthleteStatusTableTableManager(_db, _db.athleteStatus);
  $$AthleteTableTableManager get athlete =>
      $$AthleteTableTableManager(_db, _db.athlete);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$ClubTableTableManager get club => $$ClubTableTableManager(_db, _db.club);
  $$DisciplineTypeTableTableManager get disciplineType =>
      $$DisciplineTypeTableTableManager(_db, _db.disciplineType);
  $$DisciplineTableTableManager get discipline =>
      $$DisciplineTableTableManager(_db, _db.discipline);
  $$GroupAthleteTableTableManager get groupAthlete =>
      $$GroupAthleteTableTableManager(_db, _db.groupAthlete);
  $$GroupTrainerTableTableManager get groupTrainer =>
      $$GroupTrainerTableTableManager(_db, _db.groupTrainer);
  $$GroupTableTableManager get group =>
      $$GroupTableTableManager(_db, _db.group);
  $$GuardianTableTableManager get guardian =>
      $$GuardianTableTableManager(_db, _db.guardian);
  $$ItemTypeTableTableManager get itemType =>
      $$ItemTypeTableTableManager(_db, _db.itemType);
  $$ItemTableTableManager get item => $$ItemTableTableManager(_db, _db.item);
  $$MeetEventTableTableManager get meetEvent =>
      $$MeetEventTableTableManager(_db, _db.meetEvent);
  $$MeetTableTableManager get meet => $$MeetTableTableManager(_db, _db.meet);
  $$RemoteConfigTableTableManager get remoteConfig =>
      $$RemoteConfigTableTableManager(_db, _db.remoteConfig);
  $$SchoolYearTableTableManager get schoolYear =>
      $$SchoolYearTableTableManager(_db, _db.schoolYear);
  $$SignUpFormStatusTableTableManager get signUpFormStatus =>
      $$SignUpFormStatusTableTableManager(_db, _db.signUpFormStatus);
  $$SignUpFormTableTableManager get signUpForm =>
      $$SignUpFormTableTableManager(_db, _db.signUpForm);
  $$TrainerStatusTableTableManager get trainerStatus =>
      $$TrainerStatusTableTableManager(_db, _db.trainerStatus);
  $$TrainerTableTableManager get trainer =>
      $$TrainerTableTableManager(_db, _db.trainer);
  $$TrainingAthleteTableTableManager get trainingAthlete =>
      $$TrainingAthleteTableTableManager(_db, _db.trainingAthlete);
  $$TrainingTimeTableTableManager get trainingTime =>
      $$TrainingTimeTableTableManager(_db, _db.trainingTime);
  $$TrainingTrainerTableTableManager get trainingTrainer =>
      $$TrainingTrainerTableTableManager(_db, _db.trainingTrainer);
  $$TrainingTableTableManager get training =>
      $$TrainingTableTableManager(_db, _db.training);
  $$WebPostTableTableManager get webPost =>
      $$WebPostTableTableManager(_db, _db.webPost);
}
