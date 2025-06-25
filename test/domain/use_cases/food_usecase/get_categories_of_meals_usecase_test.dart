import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/food/category.dart';
import 'package:fit_zone/domain/repo_contract/food_repo/get_categories_of_meals_repo.dart';
import 'package:fit_zone/domain/use_cases/food_usecase/get_categories_of_meals_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_of_meals_usecase_test.mocks.dart';


@GenerateMocks([GetCategoriesOfMealsRepo])
void main() {
  provideDummy<ApiResult<List<Category>>>(SuccessApiResult([]));
  provideDummy<ApiResult<List<Category>>>(ErrorApiResult(Exception("Dummy error")));

  late GetCategoriesOfMealsUsecase usecase;
  late MockGetCategoriesOfMealsRepo mockRepo;

  setUp(() {
    mockRepo = MockGetCategoriesOfMealsRepo();
    usecase = GetCategoriesOfMealsUsecase(mockRepo);
  });

  group('GetCategoriesOfMealsUsecase Tests', () {
    test('should return SuccessApiResult when categories are retrieved successfully', () async {
      final categories = [
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

      when(mockRepo.getCategoriesOfMeals()).thenAnswer(
            (_) async => SuccessApiResult(categories),
      );

      final result = await usecase.execute();

      expect(result, isA<SuccessApiResult<List<Category>>>());
      expect((result as SuccessApiResult).data, isNotEmpty);
      verify(mockRepo.getCategoriesOfMeals()).called(1);
      verifyNoMoreInteractions(mockRepo);
    });

    test('should return ErrorApiResult when error occurs while retrieving categories', () async {
      final error = Exception('Failed to load categories');
      when(mockRepo.getCategoriesOfMeals()).thenAnswer(
            (_) async => ErrorApiResult(error),
      );

      final result = await usecase.execute();

      expect(result, isA<ErrorApiResult<List<Category>>>());
      expect((result as ErrorApiResult).exception.toString(), contains('Failed to load categories'));
      verify(mockRepo.getCategoriesOfMeals()).called(1);
      verifyNoMoreInteractions(mockRepo);
    });
  });
}
