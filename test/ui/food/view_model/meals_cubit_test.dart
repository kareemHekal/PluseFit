import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/meal.dart';
import 'package:fit_zone/domain/use_cases/food_usecase/get_meals_by_category_usecase.dart';
import 'package:fit_zone/ui/food/view_model/meals_cubit.dart';
import 'package:fit_zone/ui/food/view_model/meals_intent.dart';
import 'package:fit_zone/ui/food/view_model/meals_state.dart';

import 'meals_cubit_test.mocks.dart';


@GenerateMocks([GetMealsByCategoryUsecase])
void main() {

  provideDummy<ApiResult<List<Meal>>>(SuccessApiResult([]));

  late MealsCubit cubit;
  late MockGetMealsByCategoryUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetMealsByCategoryUsecase();
    cubit = MealsCubit(mockUsecase);
  });

  tearDown(() => cubit.close());

  const testCategoryId = 'cat123';

  final mockMeals = [
    Meal(
      strMeal: 'Grilled Chicken',
      strMealThumb: 'https://example.com/chicken.png',
      idMeal: '1',
    ),
    Meal(
      strMeal: 'Pasta Salad',
      strMealThumb: 'https://example.com/pasta.png',
      idMeal: '2',
    ),
  ];

  blocTest<MealsCubit, MealsState>(
    'emits [MealsLoadingState, MealsLoadedState] when fetching meals succeeds',
    build: () {
      when(mockUsecase.execute(testCategoryId))
          .thenAnswer((_) async => SuccessApiResult(mockMeals));
      return cubit;
    },
    act: (cubit) => cubit.doIntent(GetMealsByCategoryIntent(testCategoryId)),
    expect: () => [
      isA<MealsLoadingState>(),
      isA<MealsLoadedState>().having((s) => s.meals, 'meals', mockMeals),
    ],
    verify: (_) {
      verify(mockUsecase.execute(testCategoryId)).called(1);
    },
  );

  blocTest<MealsCubit, MealsState>(
    'emits [MealsLoadingState, MealsErrorState] when fetching meals fails',
    build: () {
      when(mockUsecase.execute(testCategoryId)).thenAnswer(
              (_) async => ErrorApiResult(Exception('Failed to fetch meals')));
      return cubit;
    },
    act: (cubit) => cubit.doIntent(GetMealsByCategoryIntent(testCategoryId)),
    expect: () => [
      isA<MealsLoadingState>(),
      isA<MealsErrorState>().having((s) => s.message, 'message', contains('Failed to fetch')),
    ],
    verify: (_) {
      verify(mockUsecase.execute(testCategoryId)).called(1);
    },
  );
}
