import 'dart:io';
import 'package:cototinder/data/models/cat_breed.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class LikedCats extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breedName => text()();
  TextColumn get description => text()();
  DateTimeColumn get likedDate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class CachedCatBreeds extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breedName => text()();
  TextColumn get description => text()();
  DateTimeColumn get cachedDate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [LikedCats, CachedCatBreeds])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<CatBreed>> getLikedCats() async {
    final query = select(likedCats);
    final likedCatRecords = await query.get();
    return likedCatRecords.map((row) {
      return CatBreed(
        id: row.id,
        imageUrl: row.imageUrl,
        breedName: row.breedName,
        description: row.description,
        likedDate: row.likedDate,
      );
    }).toList();
  }

  Future<void> addLikedCat(CatBreed cat) async {
    await into(likedCats).insert(
      LikedCatsCompanion.insert(
        id: cat.id,
        imageUrl: cat.imageUrl,
        breedName: cat.breedName,
        description: cat.description,
        likedDate: cat.likedDate,
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> removeLikedCat(String id) async {
    await (delete(likedCats)..where((t) => t.id.equals(id))).go();
  }

  Future<List<CatBreed>> getCachedCatBreeds() async {
    final cached = await select(cachedCatBreeds).get();
    return cached.map((row) {
      return CatBreed(
        id: row.id,
        imageUrl: row.imageUrl,
        breedName: row.breedName,
        description: row.description,
        likedDate: row.cachedDate,
      );
    }).toList();
  }

  Future<void> cacheCatBreed(CatBreed breed) async {
    await into(cachedCatBreeds).insert(
      CachedCatBreedsCompanion.insert(
        id: breed.id,
        imageUrl: breed.imageUrl,
        breedName: breed.breedName,
        description: breed.description,
        cachedDate: DateTime.now(),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
