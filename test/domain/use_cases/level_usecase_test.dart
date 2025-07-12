import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:fit_zone/domain/repo_contract/level_repo.dart';
import 'package:fit_zone/domain/use_cases/level_usecase.dart';
import 'package:fit_zone/data/model/get_all_level_response.dart';
import 'package:fit_zone/core/api/api_result.dart';

import 'level_usecase_test.mocks.dart';


@GenerateMocks([LevelRepo])
void main() {
  late MockLevelRepo mockLevelRepo;
  late LevelUsecase useCase;

  // dummy value to avoid MissingDummyValueError
  provideDummy<ApiResult<GetAllLevelResponse>>(
    SuccessApiResult(
      GetAllLevelResponse(
        message: "dummy",
        levels: [],
      ),
    ),
  );

  setUp(() {
    mockLevelRepo = MockLevelRepo();
    useCase = LevelUsecase(mockLevelRepo);
  });

  group('LevelUsecase', () {
    test('should return all levels from repo', () async {
      // Arrange
      final response = GetAllLevelResponse(
        message: "success",
        levels: [

        ],
      );

      final expectedResult = SuccessApiResult<GetAllLevelResponse>(response);

      when(mockLevelRepo.getAllLevel()).thenAnswer((_) async => expectedResult);

      // Act
      final result = await useCase.call();

      // Assert
      expect(result, expectedResult);
      verify(mockLevelRepo.getAllLevel()).called(1);
    });
  });
}
