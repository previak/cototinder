import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cototinder/data/models/cat_breed.dart';

class LikedCatsCubit extends Cubit<List<CatBreed>> {
  LikedCatsCubit() : super([]);

  void addLikedCat(CatBreed cat) => emit([...state, cat]);

  void removeLikedCat(String id) =>
      emit(state.where((c) => c.id != id).toList());
}
