import 'package:cototinder/domain/cubits/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cototinder/data/models/cat_breed.dart';
import 'package:cototinder/domain/cubits/liked_cats_cubit.dart';

class FilterDropdown extends StatelessWidget {
  const FilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedCatsCubit, List<CatBreed>>(
      builder: (context, cats) {
        final breeds = _getAvailableBreeds(cats);
        return BlocBuilder<FilterCubit, String?>(
          builder: (context, currentFilter) {
            return DropdownButton<String?>(
              value: currentFilter,
              items: breeds.map((breed) {
                return DropdownMenuItem<String?>(
                  value: breed,
                  child: Text(breed ?? 'All Breeds'),
                );
              }).toList(),
              onChanged: (value) =>
                  context.read<FilterCubit>().updateFilter(value),
            );
          },
        );
      },
    );
  }

  List<String?> _getAvailableBreeds(List<CatBreed> cats) {
    final breeds = cats.map((e) => e.breedName).toSet().toList()
      ..sort((a, b) => a.compareTo(b));
    return [null, ...breeds];
  }
}
