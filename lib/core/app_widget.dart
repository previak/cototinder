import 'package:cototinder/domain/cubits/filter_cubit.dart';
import 'package:cototinder/domain/cubits/liked_cats_cubit.dart';
import 'package:cototinder/domain/cubits/network_cubit.dart';
import 'package:cototinder/locator.dart';
import 'package:cototinder/presentation/screens/home_screen/home_screen.dart';
import 'package:cototinder/presentation/screens/liked_cats_screen/liked_cats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LikedCatsCubit>()),
        BlocProvider(create: (_) => getIt<FilterCubit>()),
        BlocProvider(create: (_) => getIt<NetworkCubit>()),
      ],
      child: BlocListener<NetworkCubit, bool>(
        listener: (context, hasConnection) {
          if (!hasConnection) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No internet connection'),
                duration: Duration(seconds: 3),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Internet connection restored'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        child: MaterialApp(
          home: const HomeScreen(),
          routes: {
            '/liked': (_) => const LikedCatsScreen(),
          },
        ),
      ),
    );
  }
}
