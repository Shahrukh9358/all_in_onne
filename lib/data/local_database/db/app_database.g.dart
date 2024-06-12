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

class $StocksTableTable extends StocksTable
    with TableInfo<$StocksTableTable, StocksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StocksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nseSymbolMeta =
      const VerificationMeta('nseSymbol');
  @override
  late final GeneratedColumn<String> nseSymbol = GeneratedColumn<String>(
      'nse_symbol', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bseSymbolMeta =
      const VerificationMeta('bseSymbol');
  @override
  late final GeneratedColumn<String> bseSymbol = GeneratedColumn<String>(
      'bse_symbol', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isinMeta = const VerificationMeta('isin');
  @override
  late final GeneratedColumn<String> isin = GeneratedColumn<String>(
      'isin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dayRangeLowMeta =
      const VerificationMeta('dayRangeLow');
  @override
  late final GeneratedColumn<double> dayRangeLow = GeneratedColumn<double>(
      'day_range_low', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dayRangeHighMeta =
      const VerificationMeta('dayRangeHigh');
  @override
  late final GeneratedColumn<double> dayRangeHigh = GeneratedColumn<double>(
      'day_range_high', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nseSymbol,
        bseSymbol,
        companyName,
        isin,
        price,
        dayRangeLow,
        dayRangeHigh,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stocks_table';
  @override
  VerificationContext validateIntegrity(Insertable<StocksTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nse_symbol')) {
      context.handle(_nseSymbolMeta,
          nseSymbol.isAcceptableOrUnknown(data['nse_symbol']!, _nseSymbolMeta));
    }
    if (data.containsKey('bse_symbol')) {
      context.handle(_bseSymbolMeta,
          bseSymbol.isAcceptableOrUnknown(data['bse_symbol']!, _bseSymbolMeta));
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    }
    if (data.containsKey('isin')) {
      context.handle(
          _isinMeta, isin.isAcceptableOrUnknown(data['isin']!, _isinMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('day_range_low')) {
      context.handle(
          _dayRangeLowMeta,
          dayRangeLow.isAcceptableOrUnknown(
              data['day_range_low']!, _dayRangeLowMeta));
    }
    if (data.containsKey('day_range_high')) {
      context.handle(
          _dayRangeHighMeta,
          dayRangeHigh.isAcceptableOrUnknown(
              data['day_range_high']!, _dayRangeHighMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StocksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StocksTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nseSymbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nse_symbol']),
      bseSymbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bse_symbol']),
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name']),
      isin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}isin']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      dayRangeLow: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}day_range_low']),
      dayRangeHigh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}day_range_high']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $StocksTableTable createAlias(String alias) {
    return $StocksTableTable(attachedDatabase, alias);
  }
}

class StocksTableData extends DataClass implements Insertable<StocksTableData> {
  final int id;
  final String? nseSymbol;
  final String? bseSymbol;
  final String? companyName;
  final String? isin;
  final double? price;
  final double? dayRangeLow;
  final double? dayRangeHigh;
  final DateTime? updatedAt;
  const StocksTableData(
      {required this.id,
      this.nseSymbol,
      this.bseSymbol,
      this.companyName,
      this.isin,
      this.price,
      this.dayRangeLow,
      this.dayRangeHigh,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || nseSymbol != null) {
      map['nse_symbol'] = Variable<String>(nseSymbol);
    }
    if (!nullToAbsent || bseSymbol != null) {
      map['bse_symbol'] = Variable<String>(bseSymbol);
    }
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || isin != null) {
      map['isin'] = Variable<String>(isin);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || dayRangeLow != null) {
      map['day_range_low'] = Variable<double>(dayRangeLow);
    }
    if (!nullToAbsent || dayRangeHigh != null) {
      map['day_range_high'] = Variable<double>(dayRangeHigh);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  StocksTableCompanion toCompanion(bool nullToAbsent) {
    return StocksTableCompanion(
      id: Value(id),
      nseSymbol: nseSymbol == null && nullToAbsent
          ? const Value.absent()
          : Value(nseSymbol),
      bseSymbol: bseSymbol == null && nullToAbsent
          ? const Value.absent()
          : Value(bseSymbol),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      isin: isin == null && nullToAbsent ? const Value.absent() : Value(isin),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      dayRangeLow: dayRangeLow == null && nullToAbsent
          ? const Value.absent()
          : Value(dayRangeLow),
      dayRangeHigh: dayRangeHigh == null && nullToAbsent
          ? const Value.absent()
          : Value(dayRangeHigh),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory StocksTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StocksTableData(
      id: serializer.fromJson<int>(json['id']),
      nseSymbol: serializer.fromJson<String?>(json['nseSymbol']),
      bseSymbol: serializer.fromJson<String?>(json['bseSymbol']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      isin: serializer.fromJson<String?>(json['isin']),
      price: serializer.fromJson<double?>(json['price']),
      dayRangeLow: serializer.fromJson<double?>(json['dayRangeLow']),
      dayRangeHigh: serializer.fromJson<double?>(json['dayRangeHigh']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nseSymbol': serializer.toJson<String?>(nseSymbol),
      'bseSymbol': serializer.toJson<String?>(bseSymbol),
      'companyName': serializer.toJson<String?>(companyName),
      'isin': serializer.toJson<String?>(isin),
      'price': serializer.toJson<double?>(price),
      'dayRangeLow': serializer.toJson<double?>(dayRangeLow),
      'dayRangeHigh': serializer.toJson<double?>(dayRangeHigh),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  StocksTableData copyWith(
          {int? id,
          Value<String?> nseSymbol = const Value.absent(),
          Value<String?> bseSymbol = const Value.absent(),
          Value<String?> companyName = const Value.absent(),
          Value<String?> isin = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<double?> dayRangeLow = const Value.absent(),
          Value<double?> dayRangeHigh = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      StocksTableData(
        id: id ?? this.id,
        nseSymbol: nseSymbol.present ? nseSymbol.value : this.nseSymbol,
        bseSymbol: bseSymbol.present ? bseSymbol.value : this.bseSymbol,
        companyName: companyName.present ? companyName.value : this.companyName,
        isin: isin.present ? isin.value : this.isin,
        price: price.present ? price.value : this.price,
        dayRangeLow: dayRangeLow.present ? dayRangeLow.value : this.dayRangeLow,
        dayRangeHigh:
            dayRangeHigh.present ? dayRangeHigh.value : this.dayRangeHigh,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('StocksTableData(')
          ..write('id: $id, ')
          ..write('nseSymbol: $nseSymbol, ')
          ..write('bseSymbol: $bseSymbol, ')
          ..write('companyName: $companyName, ')
          ..write('isin: $isin, ')
          ..write('price: $price, ')
          ..write('dayRangeLow: $dayRangeLow, ')
          ..write('dayRangeHigh: $dayRangeHigh, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nseSymbol, bseSymbol, companyName, isin,
      price, dayRangeLow, dayRangeHigh, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StocksTableData &&
          other.id == this.id &&
          other.nseSymbol == this.nseSymbol &&
          other.bseSymbol == this.bseSymbol &&
          other.companyName == this.companyName &&
          other.isin == this.isin &&
          other.price == this.price &&
          other.dayRangeLow == this.dayRangeLow &&
          other.dayRangeHigh == this.dayRangeHigh &&
          other.updatedAt == this.updatedAt);
}

class StocksTableCompanion extends UpdateCompanion<StocksTableData> {
  final Value<int> id;
  final Value<String?> nseSymbol;
  final Value<String?> bseSymbol;
  final Value<String?> companyName;
  final Value<String?> isin;
  final Value<double?> price;
  final Value<double?> dayRangeLow;
  final Value<double?> dayRangeHigh;
  final Value<DateTime?> updatedAt;
  const StocksTableCompanion({
    this.id = const Value.absent(),
    this.nseSymbol = const Value.absent(),
    this.bseSymbol = const Value.absent(),
    this.companyName = const Value.absent(),
    this.isin = const Value.absent(),
    this.price = const Value.absent(),
    this.dayRangeLow = const Value.absent(),
    this.dayRangeHigh = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StocksTableCompanion.insert({
    this.id = const Value.absent(),
    this.nseSymbol = const Value.absent(),
    this.bseSymbol = const Value.absent(),
    this.companyName = const Value.absent(),
    this.isin = const Value.absent(),
    this.price = const Value.absent(),
    this.dayRangeLow = const Value.absent(),
    this.dayRangeHigh = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<StocksTableData> custom({
    Expression<int>? id,
    Expression<String>? nseSymbol,
    Expression<String>? bseSymbol,
    Expression<String>? companyName,
    Expression<String>? isin,
    Expression<double>? price,
    Expression<double>? dayRangeLow,
    Expression<double>? dayRangeHigh,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nseSymbol != null) 'nse_symbol': nseSymbol,
      if (bseSymbol != null) 'bse_symbol': bseSymbol,
      if (companyName != null) 'company_name': companyName,
      if (isin != null) 'isin': isin,
      if (price != null) 'price': price,
      if (dayRangeLow != null) 'day_range_low': dayRangeLow,
      if (dayRangeHigh != null) 'day_range_high': dayRangeHigh,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StocksTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? nseSymbol,
      Value<String?>? bseSymbol,
      Value<String?>? companyName,
      Value<String?>? isin,
      Value<double?>? price,
      Value<double?>? dayRangeLow,
      Value<double?>? dayRangeHigh,
      Value<DateTime?>? updatedAt}) {
    return StocksTableCompanion(
      id: id ?? this.id,
      nseSymbol: nseSymbol ?? this.nseSymbol,
      bseSymbol: bseSymbol ?? this.bseSymbol,
      companyName: companyName ?? this.companyName,
      isin: isin ?? this.isin,
      price: price ?? this.price,
      dayRangeLow: dayRangeLow ?? this.dayRangeLow,
      dayRangeHigh: dayRangeHigh ?? this.dayRangeHigh,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nseSymbol.present) {
      map['nse_symbol'] = Variable<String>(nseSymbol.value);
    }
    if (bseSymbol.present) {
      map['bse_symbol'] = Variable<String>(bseSymbol.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (isin.present) {
      map['isin'] = Variable<String>(isin.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (dayRangeLow.present) {
      map['day_range_low'] = Variable<double>(dayRangeLow.value);
    }
    if (dayRangeHigh.present) {
      map['day_range_high'] = Variable<double>(dayRangeHigh.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StocksTableCompanion(')
          ..write('id: $id, ')
          ..write('nseSymbol: $nseSymbol, ')
          ..write('bseSymbol: $bseSymbol, ')
          ..write('companyName: $companyName, ')
          ..write('isin: $isin, ')
          ..write('price: $price, ')
          ..write('dayRangeLow: $dayRangeLow, ')
          ..write('dayRangeHigh: $dayRangeHigh, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $WatchlistTableTable watchlistTable = $WatchlistTableTable(this);
  late final $StocksTableTable stocksTable = $StocksTableTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final WatchlistDao watchlistDao = WatchlistDao(this as AppDatabase);
  late final StocksDao stocksDao = StocksDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, watchlistTable, stocksTable];
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

typedef $$StocksTableTableInsertCompanionBuilder = StocksTableCompanion
    Function({
  Value<int> id,
  Value<String?> nseSymbol,
  Value<String?> bseSymbol,
  Value<String?> companyName,
  Value<String?> isin,
  Value<double?> price,
  Value<double?> dayRangeLow,
  Value<double?> dayRangeHigh,
  Value<DateTime?> updatedAt,
});
typedef $$StocksTableTableUpdateCompanionBuilder = StocksTableCompanion
    Function({
  Value<int> id,
  Value<String?> nseSymbol,
  Value<String?> bseSymbol,
  Value<String?> companyName,
  Value<String?> isin,
  Value<double?> price,
  Value<double?> dayRangeLow,
  Value<double?> dayRangeHigh,
  Value<DateTime?> updatedAt,
});

class $$StocksTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StocksTableTable,
    StocksTableData,
    $$StocksTableTableFilterComposer,
    $$StocksTableTableOrderingComposer,
    $$StocksTableTableProcessedTableManager,
    $$StocksTableTableInsertCompanionBuilder,
    $$StocksTableTableUpdateCompanionBuilder> {
  $$StocksTableTableTableManager(_$AppDatabase db, $StocksTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$StocksTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$StocksTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$StocksTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> nseSymbol = const Value.absent(),
            Value<String?> bseSymbol = const Value.absent(),
            Value<String?> companyName = const Value.absent(),
            Value<String?> isin = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<double?> dayRangeLow = const Value.absent(),
            Value<double?> dayRangeHigh = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              StocksTableCompanion(
            id: id,
            nseSymbol: nseSymbol,
            bseSymbol: bseSymbol,
            companyName: companyName,
            isin: isin,
            price: price,
            dayRangeLow: dayRangeLow,
            dayRangeHigh: dayRangeHigh,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> nseSymbol = const Value.absent(),
            Value<String?> bseSymbol = const Value.absent(),
            Value<String?> companyName = const Value.absent(),
            Value<String?> isin = const Value.absent(),
            Value<double?> price = const Value.absent(),
            Value<double?> dayRangeLow = const Value.absent(),
            Value<double?> dayRangeHigh = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              StocksTableCompanion.insert(
            id: id,
            nseSymbol: nseSymbol,
            bseSymbol: bseSymbol,
            companyName: companyName,
            isin: isin,
            price: price,
            dayRangeLow: dayRangeLow,
            dayRangeHigh: dayRangeHigh,
            updatedAt: updatedAt,
          ),
        ));
}

class $$StocksTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $StocksTableTable,
    StocksTableData,
    $$StocksTableTableFilterComposer,
    $$StocksTableTableOrderingComposer,
    $$StocksTableTableProcessedTableManager,
    $$StocksTableTableInsertCompanionBuilder,
    $$StocksTableTableUpdateCompanionBuilder> {
  $$StocksTableTableProcessedTableManager(super.$state);
}

class $$StocksTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StocksTableTable> {
  $$StocksTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nseSymbol => $state.composableBuilder(
      column: $state.table.nseSymbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bseSymbol => $state.composableBuilder(
      column: $state.table.bseSymbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get companyName => $state.composableBuilder(
      column: $state.table.companyName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get isin => $state.composableBuilder(
      column: $state.table.isin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dayRangeLow => $state.composableBuilder(
      column: $state.table.dayRangeLow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dayRangeHigh => $state.composableBuilder(
      column: $state.table.dayRangeHigh,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$StocksTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StocksTableTable> {
  $$StocksTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nseSymbol => $state.composableBuilder(
      column: $state.table.nseSymbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bseSymbol => $state.composableBuilder(
      column: $state.table.bseSymbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get companyName => $state.composableBuilder(
      column: $state.table.companyName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get isin => $state.composableBuilder(
      column: $state.table.isin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dayRangeLow => $state.composableBuilder(
      column: $state.table.dayRangeLow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dayRangeHigh => $state.composableBuilder(
      column: $state.table.dayRangeHigh,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
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
  $$StocksTableTableTableManager get stocksTable =>
      $$StocksTableTableTableManager(_db, _db.stocksTable);
}
