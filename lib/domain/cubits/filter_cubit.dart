import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<String?> {
  FilterCubit() : super(null);

  void updateFilter(String? breed) => emit(breed);
}
