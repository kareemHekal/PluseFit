import 'package:fit_zone/domain/use_cases/food_usecase/get_meals_by_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/meal.dart';
import 'package:fit_zone/domain/repo_contract/food_repo/get_meals_by_category_repo.dart';
import 'get_meals_by_category_usecase_test.mocks.dart';


@GenerateMocks([GetMealsByCategoryRepo])
void main() {
  provideDummy<ApiResult<List<Meal>>>(SuccessApiResult([]));
  provideDummy<ApiResult<List<Meal>>>(ErrorApiResult(Exception("Dummy error")));

  late GetMealsByCategoryUsecase usecase;
  late MockGetMealsByCategoryRepo mockRepo;

  setUp(() {
    mockRepo = MockGetMealsByCategoryRepo();
    usecase = GetMealsByCategoryUsecase(mockRepo);
  });

  group('GetMealsByCategoryUsecase Tests', () {
    const testCategoryId = 'cat123';

    test('should return SuccessApiResult when meals are retrieved successfully', () async {
      final meals = [
        Meal(
          strMeal: 'Grilled Chicken',
          strMealThumb: 'https://example.com/grilled.png',
          idMeal: '1',
        ),
        Meal(
          strMeal: 'Vegan Salad',
          strMealThumb: 'https://example.com/salad.png',
          idMeal: '2',
        ),
      ];

      when(mockRepo.getMealsByCategory(testCategoryId))
          .thenAnswer((_) async => SuccessApiResult(meals));

      final result = await usecase.execute(testCategoryId);

      expect(result, isA<SuccessApiResult<List<Meal>>>());
      expect((result as SuccessApiResult).data, isNotEmpty);
      verify(mockRepo.getMealsByCategory(testCategoryId)).called(1);
      verifyNoMoreInteractions(mockRepo);
    });

    test('should return ErrorApiResult when error occurs while retrieving meals', () async {
      final error = Exception('Failed to load meals');
      when(mockRepo.getMealsByCategory(testCategoryId))
          .thenAnswer((_) async => ErrorApiResult(error));

      final result = await usecase.execute(testCategoryId);

      expect(result, isA<ErrorApiResult<List<Meal>>>());
      expect((result as ErrorApiResult).exception.toString(), contains('Failed to load meals'));
      verify(mockRepo.getMealsByCategory(testCategoryId)).called(1);
      verifyNoMoreInteractions(mockRepo);
    });
  });
}
