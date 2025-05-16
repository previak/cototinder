import 'package:cototinder/domain/cubits/filter_cubit.dart';
import 'package:cototinder/presentation/screens/liked_cats_screen/widgets/cat_list_tile.dart';
import 'package:cototinder/presentation/screens/liked_cats_screen/widgets/filter_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cototinder/data/models/cat_breed.dart';
import 'package:cototinder/domain/cubits/liked_cats_cubit.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Cats'),
        actions: const [FilterDropdown()],
      ),
      body: BlocListener<LikedCatsCubit, List<CatBreed>>(
        listener: (context, cats) {
          final filter = context.read<FilterCubit>().state;
          if (filter != null && !cats.any((cat) => cat.breedName == filter)) {
            context.read<FilterCubit>().updateFilter(null);
          }
        },
        child: BlocBuilder<LikedCatsCubit, List<CatBreed>>(
          builder: (context, cats) {
            return BlocBuilder<FilterCubit, String?>(
              builder: (context, filter) {
                final filteredCats = filter == null
                    ? cats
                    : cats.where((cat) => cat.breedName == filter).toList();

                if (filteredCats.isEmpty) {
                  return const Center(child: Text('No cats matching filter'));
                }

                return ListView.builder(
                  itemCount: filteredCats.length,
                  itemBuilder: (context, index) => CatListTile(
                    cat: filteredCats[index],
                    onDelete: () => _handleDelete(context, filteredCats[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _handleDelete(BuildContext context, CatBreed cat) {
    context.read<LikedCatsCubit>().removeLikedCat(cat.id);
  }
}
