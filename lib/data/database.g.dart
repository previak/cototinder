// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _breedNameMeta =
      const VerificationMeta('breedName');
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
      'breed_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _likedDateMeta =
      const VerificationMeta('likedDate');
  @override
  late final GeneratedColumn<DateTime> likedDate = GeneratedColumn<DateTime>(
      'liked_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, imageUrl, breedName, description, likedDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(Insertable<LikedCat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed_name')) {
      context.handle(_breedNameMeta,
          breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta));
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('liked_date')) {
      context.handle(_likedDateMeta,
          likedDate.isAcceptableOrUnknown(data['liked_date']!, _likedDateMeta));
    } else if (isInserting) {
      context.missing(_likedDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      breedName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      likedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}liked_date'])!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCat extends DataClass implements Insertable<LikedCat> {
  final String id;
  final String imageUrl;
  final String breedName;
  final String description;
  final DateTime likedDate;
  const LikedCat(
      {required this.id,
      required this.imageUrl,
      required this.breedName,
      required this.description,
      required this.likedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['breed_name'] = Variable<String>(breedName);
    map['description'] = Variable<String>(description);
    map['liked_date'] = Variable<DateTime>(likedDate);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breedName: Value(breedName),
      description: Value(description),
      likedDate: Value(likedDate),
    );
  }

  factory LikedCat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCat(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breedName: serializer.fromJson<String>(json['breedName']),
      description: serializer.fromJson<String>(json['description']),
      likedDate: serializer.fromJson<DateTime>(json['likedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breedName': serializer.toJson<String>(breedName),
      'description': serializer.toJson<String>(description),
      'likedDate': serializer.toJson<DateTime>(likedDate),
    };
  }

  LikedCat copyWith(
          {String? id,
          String? imageUrl,
          String? breedName,
          String? description,
          DateTime? likedDate}) =>
      LikedCat(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        breedName: breedName ?? this.breedName,
        description: description ?? this.description,
        likedDate: likedDate ?? this.likedDate,
      );
  LikedCat copyWithCompanion(LikedCatsCompanion data) {
    return LikedCat(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      description:
          data.description.present ? data.description.value : this.description,
      likedDate: data.likedDate.present ? data.likedDate.value : this.likedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCat(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('likedDate: $likedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, imageUrl, breedName, description, likedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCat &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breedName == this.breedName &&
          other.description == this.description &&
          other.likedDate == this.likedDate);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCat> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String> breedName;
  final Value<String> description;
  final Value<DateTime> likedDate;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breedName = const Value.absent(),
    this.description = const Value.absent(),
    this.likedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String id,
    required String imageUrl,
    required String breedName,
    required String description,
    required DateTime likedDate,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        imageUrl = Value(imageUrl),
        breedName = Value(breedName),
        description = Value(description),
        likedDate = Value(likedDate);
  static Insertable<LikedCat> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breedName,
    Expression<String>? description,
    Expression<DateTime>? likedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breedName != null) 'breed_name': breedName,
      if (description != null) 'description': description,
      if (likedDate != null) 'liked_date': likedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith(
      {Value<String>? id,
      Value<String>? imageUrl,
      Value<String>? breedName,
      Value<String>? description,
      Value<DateTime>? likedDate,
      Value<int>? rowid}) {
    return LikedCatsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      likedDate: likedDate ?? this.likedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (likedDate.present) {
      map['liked_date'] = Variable<DateTime>(likedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('likedDate: $likedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedCatBreedsTable extends CachedCatBreeds
    with TableInfo<$CachedCatBreedsTable, CachedCatBreed> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCatBreedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _breedNameMeta =
      const VerificationMeta('breedName');
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
      'breed_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedDateMeta =
      const VerificationMeta('cachedDate');
  @override
  late final GeneratedColumn<DateTime> cachedDate = GeneratedColumn<DateTime>(
      'cached_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, imageUrl, breedName, description, cachedDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_cat_breeds';
  @override
  VerificationContext validateIntegrity(Insertable<CachedCatBreed> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed_name')) {
      context.handle(_breedNameMeta,
          breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta));
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cached_date')) {
      context.handle(
          _cachedDateMeta,
          cachedDate.isAcceptableOrUnknown(
              data['cached_date']!, _cachedDateMeta));
    } else if (isInserting) {
      context.missing(_cachedDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedCatBreed map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCatBreed(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      breedName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      cachedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cached_date'])!,
    );
  }

  @override
  $CachedCatBreedsTable createAlias(String alias) {
    return $CachedCatBreedsTable(attachedDatabase, alias);
  }
}

class CachedCatBreed extends DataClass implements Insertable<CachedCatBreed> {
  final String id;
  final String imageUrl;
  final String breedName;
  final String description;
  final DateTime cachedDate;
  const CachedCatBreed(
      {required this.id,
      required this.imageUrl,
      required this.breedName,
      required this.description,
      required this.cachedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['breed_name'] = Variable<String>(breedName);
    map['description'] = Variable<String>(description);
    map['cached_date'] = Variable<DateTime>(cachedDate);
    return map;
  }

  CachedCatBreedsCompanion toCompanion(bool nullToAbsent) {
    return CachedCatBreedsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breedName: Value(breedName),
      description: Value(description),
      cachedDate: Value(cachedDate),
    );
  }

  factory CachedCatBreed.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCatBreed(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breedName: serializer.fromJson<String>(json['breedName']),
      description: serializer.fromJson<String>(json['description']),
      cachedDate: serializer.fromJson<DateTime>(json['cachedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breedName': serializer.toJson<String>(breedName),
      'description': serializer.toJson<String>(description),
      'cachedDate': serializer.toJson<DateTime>(cachedDate),
    };
  }

  CachedCatBreed copyWith(
          {String? id,
          String? imageUrl,
          String? breedName,
          String? description,
          DateTime? cachedDate}) =>
      CachedCatBreed(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        breedName: breedName ?? this.breedName,
        description: description ?? this.description,
        cachedDate: cachedDate ?? this.cachedDate,
      );
  CachedCatBreed copyWithCompanion(CachedCatBreedsCompanion data) {
    return CachedCatBreed(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      description:
          data.description.present ? data.description.value : this.description,
      cachedDate:
          data.cachedDate.present ? data.cachedDate.value : this.cachedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCatBreed(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('cachedDate: $cachedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, imageUrl, breedName, description, cachedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCatBreed &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breedName == this.breedName &&
          other.description == this.description &&
          other.cachedDate == this.cachedDate);
}

class CachedCatBreedsCompanion extends UpdateCompanion<CachedCatBreed> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String> breedName;
  final Value<String> description;
  final Value<DateTime> cachedDate;
  final Value<int> rowid;
  const CachedCatBreedsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breedName = const Value.absent(),
    this.description = const Value.absent(),
    this.cachedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedCatBreedsCompanion.insert({
    required String id,
    required String imageUrl,
    required String breedName,
    required String description,
    required DateTime cachedDate,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        imageUrl = Value(imageUrl),
        breedName = Value(breedName),
        description = Value(description),
        cachedDate = Value(cachedDate);
  static Insertable<CachedCatBreed> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breedName,
    Expression<String>? description,
    Expression<DateTime>? cachedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breedName != null) 'breed_name': breedName,
      if (description != null) 'description': description,
      if (cachedDate != null) 'cached_date': cachedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedCatBreedsCompanion copyWith(
      {Value<String>? id,
      Value<String>? imageUrl,
      Value<String>? breedName,
      Value<String>? description,
      Value<DateTime>? cachedDate,
      Value<int>? rowid}) {
    return CachedCatBreedsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      cachedDate: cachedDate ?? this.cachedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cachedDate.present) {
      map['cached_date'] = Variable<DateTime>(cachedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCatBreedsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('cachedDate: $cachedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  late final $CachedCatBreedsTable cachedCatBreeds =
      $CachedCatBreedsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [likedCats, cachedCatBreeds];
}

typedef $$LikedCatsTableCreateCompanionBuilder = LikedCatsCompanion Function({
  required String id,
  required String imageUrl,
  required String breedName,
  required String description,
  required DateTime likedDate,
  Value<int> rowid,
});
typedef $$LikedCatsTableUpdateCompanionBuilder = LikedCatsCompanion Function({
  Value<String> id,
  Value<String> imageUrl,
  Value<String> breedName,
  Value<String> description,
  Value<DateTime> likedDate,
  Value<int> rowid,
});

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get likedDate => $composableBuilder(
      column: $table.likedDate, builder: (column) => ColumnFilters(column));
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get likedDate => $composableBuilder(
      column: $table.likedDate, builder: (column) => ColumnOrderings(column));
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get likedDate =>
      $composableBuilder(column: $table.likedDate, builder: (column) => column);
}

class $$LikedCatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LikedCatsTable,
    LikedCat,
    $$LikedCatsTableFilterComposer,
    $$LikedCatsTableOrderingComposer,
    $$LikedCatsTableAnnotationComposer,
    $$LikedCatsTableCreateCompanionBuilder,
    $$LikedCatsTableUpdateCompanionBuilder,
    (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
    LikedCat,
    PrefetchHooks Function()> {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> breedName = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> likedDate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LikedCatsCompanion(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            likedDate: likedDate,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String imageUrl,
            required String breedName,
            required String description,
            required DateTime likedDate,
            Value<int> rowid = const Value.absent(),
          }) =>
              LikedCatsCompanion.insert(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            likedDate: likedDate,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LikedCatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LikedCatsTable,
    LikedCat,
    $$LikedCatsTableFilterComposer,
    $$LikedCatsTableOrderingComposer,
    $$LikedCatsTableAnnotationComposer,
    $$LikedCatsTableCreateCompanionBuilder,
    $$LikedCatsTableUpdateCompanionBuilder,
    (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
    LikedCat,
    PrefetchHooks Function()>;
typedef $$CachedCatBreedsTableCreateCompanionBuilder = CachedCatBreedsCompanion
    Function({
  required String id,
  required String imageUrl,
  required String breedName,
  required String description,
  required DateTime cachedDate,
  Value<int> rowid,
});
typedef $$CachedCatBreedsTableUpdateCompanionBuilder = CachedCatBreedsCompanion
    Function({
  Value<String> id,
  Value<String> imageUrl,
  Value<String> breedName,
  Value<String> description,
  Value<DateTime> cachedDate,
  Value<int> rowid,
});

class $$CachedCatBreedsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCatBreedsTable> {
  $$CachedCatBreedsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cachedDate => $composableBuilder(
      column: $table.cachedDate, builder: (column) => ColumnFilters(column));
}

class $$CachedCatBreedsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCatBreedsTable> {
  $$CachedCatBreedsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cachedDate => $composableBuilder(
      column: $table.cachedDate, builder: (column) => ColumnOrderings(column));
}

class $$CachedCatBreedsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCatBreedsTable> {
  $$CachedCatBreedsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedDate => $composableBuilder(
      column: $table.cachedDate, builder: (column) => column);
}

class $$CachedCatBreedsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedCatBreedsTable,
    CachedCatBreed,
    $$CachedCatBreedsTableFilterComposer,
    $$CachedCatBreedsTableOrderingComposer,
    $$CachedCatBreedsTableAnnotationComposer,
    $$CachedCatBreedsTableCreateCompanionBuilder,
    $$CachedCatBreedsTableUpdateCompanionBuilder,
    (
      CachedCatBreed,
      BaseReferences<_$AppDatabase, $CachedCatBreedsTable, CachedCatBreed>
    ),
    CachedCatBreed,
    PrefetchHooks Function()> {
  $$CachedCatBreedsTableTableManager(
      _$AppDatabase db, $CachedCatBreedsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedCatBreedsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedCatBreedsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedCatBreedsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> breedName = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> cachedDate = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCatBreedsCompanion(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            cachedDate: cachedDate,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String imageUrl,
            required String breedName,
            required String description,
            required DateTime cachedDate,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCatBreedsCompanion.insert(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            cachedDate: cachedDate,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedCatBreedsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedCatBreedsTable,
    CachedCatBreed,
    $$CachedCatBreedsTableFilterComposer,
    $$CachedCatBreedsTableOrderingComposer,
    $$CachedCatBreedsTableAnnotationComposer,
    $$CachedCatBreedsTableCreateCompanionBuilder,
    $$CachedCatBreedsTableUpdateCompanionBuilder,
    (
      CachedCatBreed,
      BaseReferences<_$AppDatabase, $CachedCatBreedsTable, CachedCatBreed>
    ),
    CachedCatBreed,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
  $$CachedCatBreedsTableTableManager get cachedCatBreeds =>
      $$CachedCatBreedsTableTableManager(_db, _db.cachedCatBreeds);
}
