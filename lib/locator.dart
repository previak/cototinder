import 'package:get_it/get_it.dart';
import 'package:cototinder/data/services/cat_api_service.dart';
import 'package:cototinder/domain/cubits/liked_cats_cubit.dart';
import 'package:cototinder/domain/cubits/filter_cubit.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt
    ..registerSingleton(CatApiService())
    ..registerSingleton(LikedCatsCubit())
    ..registerSingleton(FilterCubit());
}
