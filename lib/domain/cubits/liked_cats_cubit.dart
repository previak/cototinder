import 'package:cototinder/data/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cototinder/data/models/cat_breed.dart';

class LikedCatsCubit extends Cubit<List<CatBreed>> {
  final AppDatabase _database;

  LikedCatsCubit(this._database) : super([]) {
    _loadLikedCats();
  }

  Future<void> _loadLikedCats() async {
    final cats = await _database.getLikedCats();
    emit(cats);
  }

  Future<void> addLikedCat(CatBreed cat) async {
    await _database.addLikedCat(cat);
    await _loadLikedCats();
  }

  Future<void> removeLikedCat(String id) async {
    await _database.removeLikedCat(id);
    await _loadLikedCats();
  }
}
