// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [localId, id, fullName, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
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
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int localId;
  final int id;
  final String fullName;
  final String email;
  const User(
      {required this.localId,
      required this.id,
      required this.fullName,
      required this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_id'] = Variable<int>(localId);
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['email'] = Variable<String>(email);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      localId: Value(localId),
      id: Value(id),
      fullName: Value(fullName),
      email: Value(email),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      localId: serializer.fromJson<int>(json['localId']),
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localId': serializer.toJson<int>(localId),
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String>(email),
    };
  }

  User copyWith({int? localId, int? id, String? fullName, String? email}) =>
      User(
        localId: localId ?? this.localId,
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localId, id, fullName, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.localId == this.localId &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.email == this.email);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> localId;
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> email;
  const UsersCompanion({
    this.localId = const Value.absent(),
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
  });
  UsersCompanion.insert({
    this.localId = const Value.absent(),
    required int id,
    required String fullName,
    required String email,
  })  : id = Value(id),
        fullName = Value(fullName),
        email = Value(email);
  static Insertable<User> custom({
    Expression<int>? localId,
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (localId != null) 'local_id': localId,
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? localId,
      Value<int>? id,
      Value<String>? fullName,
      Value<String>? email}) {
    return UsersCompanion(
      localId: localId ?? this.localId,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('localId: $localId, ')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $WatchlistTableTable extends WatchlistTable
    with TableInfo<$WatchlistTableTable, WatchlistTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WatchlistTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _watchlistNameMeta =
      const VerificationMeta('watchlistName');
  @override
  late final GeneratedColumn<String> watchlistName = GeneratedColumn<String>(
      'watchlist_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _watchlistIdMeta =
      const VerificationMeta('watchlistId');
  @override
  late final GeneratedColumn<int> watchlistId = GeneratedColumn<int>(
      'watchlist_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, watchlistName, watchlistId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'watchlist_table';
  @override
  VerificationContext validateIntegrity(Insertable<WatchlistTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('watchlist_name')) {
      context.handle(
          _watchlistNameMeta,
          watchlistName.isAcceptableOrUnknown(
              data['watchlist_name']!, _watchlistNameMeta));
    }
    if (data.containsKey('watchlist_id')) {
      context.handle(
          _watchlistIdMeta,
          watchlistId.isAcceptableOrUnknown(
              data['watchlist_id']!, _watchlistIdMeta));
    } else if (isInserting) {
      context.missing(_watchlistIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WatchlistTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WatchlistTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      watchlistName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}watchlist_name']),
      watchlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watchlist_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  $WatchlistTableTable createAlias(String alias) {
    return $WatchlistTableTable(attachedDatabase, alias);
  }
}

class WatchlistTableData extends DataClass
    implements Insertable<WatchlistTableData> {
  final int id;
  final String? watchlistName;
  final int watchlistId;
  final int userId;
  const WatchlistTableData(
      {required this.id,
      this.watchlistName,
      required this.watchlistId,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || watchlistName != null) {
      map['watchlist_name'] = Variable<String>(watchlistName);
    }
    map['watchlist_id'] = Variable<int>(watchlistId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  WatchlistTableCompanion toCompanion(bool nullToAbsent) {
    return WatchlistTableCompanion(
      id: Value(id),
      watchlistName: watchlistName == null && nullToAbsent
          ? const Value.absent()
          : Value(watchlistName),
      watchlistId: Value(watchlistId),
      userId: Value(userId),
    );
  }

  factory WatchlistTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WatchlistTableData(
      id: serializer.fromJson<int>(json['id']),
      watchlistName: serializer.fromJson<String?>(json['watchlistName']),
      watchlistId: serializer.fromJson<int>(json['watchlistId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'watchlistName': serializer.toJson<String?>(watchlistName),
      'watchlistId': serializer.toJson<int>(watchlistId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  WatchlistTableData copyWith(
          {int? id,
          Value<String?> watchlistName = const Value.absent(),
          int? watchlistId,
          int? userId}) =>
      WatchlistTableData(
        id: id ?? this.id,
        watchlistName:
            watchlistName.present ? watchlistName.value : this.watchlistName,
        watchlistId: watchlistId ?? this.watchlistId,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('WatchlistTableData(')
          ..write('id: $id, ')
          ..write('watchlistName: $watchlistName, ')
          ..write('watchlistId: $watchlistId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, watchlistName, watchlistId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WatchlistTableData &&
          other.id == this.id &&
          other.watchlistName == this.watchlistName &&
          other.watchlistId == this.watchlistId &&
          other.userId == this.userId);
}

class WatchlistTableCompanion extends UpdateCompanion<WatchlistTableData> {
  final Value<int> id;
  final Value<String?> watchlistName;
  final Value<int> watchlistId;
  final Value<int> userId;
  const WatchlistTableCompanion({
    this.id = const Value.absent(),
    this.watchlistName = const Value.absent(),
    this.watchlistId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  WatchlistTableCompanion.insert({
    this.id = const Value.absent(),
    this.watchlistName = const Value.absent(),
    required int watchlistId,
    required int userId,
  })  : watchlistId = Value(watchlistId),
        userId = Value(userId);
  static Insertable<WatchlistTableData> custom({
    Expression<int>? id,
    Expression<String>? watchlistName,
    Expression<int>? watchlistId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (watchlistName != null) 'watchlist_name': watchlistName,
      if (watchlistId != null) 'watchlist_id': watchlistId,
      if (userId != null) 'user_id': userId,
    });
  }

  WatchlistTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? watchlistName,
      Value<int>? watchlistId,
      Value<int>? userId}) {
    return WatchlistTableCompanion(
      id: id ?? this.id,
      watchlistName: watchlistName ?? this.watchlistName,
      watchlistId: watchlistId ?? this.watchlistId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (watchlistName.present) {
      map['watchlist_name'] = Variable<String>(watchlistName.value);
    }
    if (watchlistId.present) {
      map['watchlist_id'] = Variable<int>(watchlistId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WatchlistTableCompanion(')
          ..write('id: $id, ')
          ..write('watchlistName: $watchlistName, ')
          ..write('watchlistId: $watchlistId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $WatchlistTableTable watchlistTable = $WatchlistTableTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final WatchlistDao watchlistDao = WatchlistDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, watchlistTable];
}

typedef $$UsersTableInsertCompanionBuilder = UsersCompanion Function({
  Value<int> localId,
  required int id,
  required String fullName,
  required String email,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> localId,
  Value<int> id,
  Value<String> fullName,
  Value<String> email,
});

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableProcessedTableManager,
    $$UsersTableInsertCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$UsersTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> localId = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> email = const Value.absent(),
          }) =>
              UsersCompanion(
            localId: localId,
            id: id,
            fullName: fullName,
            email: email,
          ),
          getInsertCompanionBuilder: ({
            Value<int> localId = const Value.absent(),
            required int id,
            required String fullName,
            required String email,
          }) =>
              UsersCompanion.insert(
            localId: localId,
            id: id,
            fullName: fullName,
            email: email,
          ),
        ));
}

class $$UsersTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableProcessedTableManager,
    $$UsersTableInsertCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder> {
  $$UsersTableProcessedTableManager(super.$state);
}

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get localId => $state.composableBuilder(
      column: $state.table.localId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fullName => $state.composableBuilder(
      column: $state.table.fullName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get localId => $state.composableBuilder(
      column: $state.table.localId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fullName => $state.composableBuilder(
      column: $state.table.fullName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$WatchlistTableTableInsertCompanionBuilder = WatchlistTableCompanion
    Function({
  Value<int> id,
  Value<String?> watchlistName,
  required int watchlistId,
  required int userId,
});
typedef $$WatchlistTableTableUpdateCompanionBuilder = WatchlistTableCompanion
    Function({
  Value<int> id,
  Value<String?> watchlistName,
  Value<int> watchlistId,
  Value<int> userId,
});

class $$WatchlistTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WatchlistTableTable,
    WatchlistTableData,
    $$WatchlistTableTableFilterComposer,
    $$WatchlistTableTableOrderingComposer,
    $$WatchlistTableTableProcessedTableManager,
    $$WatchlistTableTableInsertCompanionBuilder,
    $$WatchlistTableTableUpdateCompanionBuilder> {
  $$WatchlistTableTableTableManager(
      _$AppDatabase db, $WatchlistTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WatchlistTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WatchlistTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$WatchlistTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> watchlistName = const Value.absent(),
            Value<int> watchlistId = const Value.absent(),
            Value<int> userId = const Value.absent(),
          }) =>
              WatchlistTableCompanion(
            id: id,
            watchlistName: watchlistName,
            watchlistId: watchlistId,
            userId: userId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> watchlistName = const Value.absent(),
            required int watchlistId,
            required int userId,
          }) =>
              WatchlistTableCompanion.insert(
            id: id,
            watchlistName: watchlistName,
            watchlistId: watchlistId,
            userId: userId,
          ),
        ));
}

class $$WatchlistTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $WatchlistTableTable,
    WatchlistTableData,
    $$WatchlistTableTableFilterComposer,
    $$WatchlistTableTableOrderingComposer,
    $$WatchlistTableTableProcessedTableManager,
    $$WatchlistTableTableInsertCompanionBuilder,
    $$WatchlistTableTableUpdateCompanionBuilder> {
  $$WatchlistTableTableProcessedTableManager(super.$state);
}

class $$WatchlistTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WatchlistTableTable> {
  $$WatchlistTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get watchlistName => $state.composableBuilder(
      column: $state.table.watchlistName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchlistId => $state.composableBuilder(
      column: $state.table.watchlistId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WatchlistTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WatchlistTableTable> {
  $$WatchlistTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get watchlistName => $state.composableBuilder(
      column: $state.table.watchlistName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchlistId => $state.composableBuilder(
      column: $state.table.watchlistId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$WatchlistTableTableTableManager get watchlistTable =>
      $$WatchlistTableTableTableManager(_db, _db.watchlistTable);
}
