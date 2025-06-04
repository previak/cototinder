import 'package:bloc_test/bloc_test.dart';
import 'package:cototinder/domain/cubits/filter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FilterCubit', () {
    late FilterCubit cubit;

    setUp(() {
      cubit = FilterCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is null', () {
      expect(cubit.state, null);
    });

    blocTest<FilterCubit, String?>(
      'emits breed when updateFilter is called',
      build: () => cubit,
      act: (cubit) => cubit.updateFilter('Abyssinian'),
      expect: () => ['Abyssinian'],
    );
  });
}
