import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/category.dart';
import 'package:fit_zone/domain/use_cases/food_usecase/get_categories_of_meals_usecase.dart';
import 'package:fit_zone/ui/food/view_model/categories_cubit.dart';
import 'package:fit_zone/ui/food/view_model/categories_intent.dart';
import 'package:fit_zone/ui/food/view_model/categories_state.dart';

import 'categories_cubit_test.mocks.dart';


@GenerateMocks([GetCategoriesOfMealsUsecase])
void main() {

  provideDummy<ApiResult<List<Category>>>(SuccessApiResult([]));

  late CategoriesCubit cubit;
  late MockGetCategoriesOfMealsUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetCategoriesOfMealsUsecase();
    cubit = CategoriesCubit(mockUsecase);
  });

  tearDown(() {
    cubit.close();
  });

  final mockCategories = [
    Category(
      idCategory: '1',
      strCategory: 'Beef',
      strCategoryThumb: 'https://example.com/beef.png',
      strCategoryDescription: 'Beef meals description',
    ),
    Category(
      idCategory: '2',
      strCategory: 'Chicken',
      strCategoryThumb: 'https://example.com/chicken.png',
      strCategoryDescription: 'Chicken meals description',
    ),
  ];

  blocTest<CategoriesCubit, CategoriesState>(
    'emits [CategoriesLoadingState, CategoriesLoadedState] when success',
    build: () {
      when(mockUsecase.execute()).thenAnswer(
            (_) async => SuccessApiResult(mockCategories),
      );
      return cubit;
    },
    act: (cubit) => cubit.doIntent(GetCategoriesOfMealsIntent()),
    expect: () => [
      isA<CategoriesLoadingState>(),
      isA<CategoriesLoadedState>().having((s) => s.categories, 'categories', mockCategories),
    ],
    verify: (_) => verify(mockUsecase.execute()).called(1),
  );

  blocTest<CategoriesCubit, CategoriesState>(
    'emits [CategoriesLoadingState, CategoriesErrorState] when failure occurs',
    build: () {
      when(mockUsecase.execute()).thenAnswer(
            (_) async => ErrorApiResult(Exception('Failed to fetch categories')),
      );
      return cubit;
    },
    act: (cubit) => cubit.doIntent(GetCategoriesOfMealsIntent()),
    expect: () => [
      isA<CategoriesLoadingState>(),
      isA<CategoriesErrorState>().having(
            (s) => s.message,
        'message',
        contains('Failed to fetch categories'),
      ),
    ],
    verify: (_) => verify(mockUsecase.execute()).called(1),
  );
}
