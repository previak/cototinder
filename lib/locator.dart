import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cototinder/data/database.dart';
import 'package:cototinder/domain/cubits/network_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:cototinder/data/services/cat_api_service.dart';
import 'package:cototinder/domain/cubits/liked_cats_cubit.dart';
import 'package:cototinder/domain/cubits/filter_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final database = AppDatabase();
  getIt.registerSingleton<AppDatabase>(database);

  getIt.registerSingleton<CatApiService>(CatApiService(getIt<AppDatabase>()));

  getIt.registerSingleton<NetworkCubit>(NetworkCubit(Connectivity()));
  getIt.registerSingleton<LikedCatsCubit>(LikedCatsCubit(getIt<AppDatabase>()));
  getIt.registerSingleton<FilterCubit>(FilterCubit());
}
