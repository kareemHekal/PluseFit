import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fit_zone/data/repo_impl/recommendation_repo_impl.dart';
import 'package:fit_zone/data/data_source_contract/recommendation_to_day_datasource.dart';
import 'package:fit_zone/data/model/recommendation_response.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/domain/entity/recommendation_entity.dart';
import 'package:fit_zone/domain/common/exceptions/server_error.dart';
import 'package:fit_zone/domain/entity/error_model.dart';

import 'recommendation_repo_impl_test.mocks.dart';

@GenerateMocks([RecommendationToDayDataSource])
void main() {
  late MockRecommendationToDayDataSource mockDataSource;
  late RecommendationRepoImpl repo;

  setUp(() {
    mockDataSource = MockRecommendationToDayDataSource();
    repo = RecommendationRepoImpl(mockDataSource);
  });

  group('getRecommendationToDay', () {
    test('returns Right(List<MuscleEntity>) on success', () async {
      final response = RecommendationResponse(
        message: 'Success',
        totalMuscles: 1,
        muscles: [
          MuscleModel(sId: '1', name: 'Chest', image: 'url1'),
        ],
      );
      when(mockDataSource.getRecommendationToDay())
          .thenAnswer((_) async => SuccessApiResult(response));

      final result = await repo.getRecommendationToDay();
      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Should be Right'),
        (muscles) {
          expect(muscles, isA<List<MuscleEntity>>());
          expect(muscles.length, 1);
          expect(muscles.first.name, 'Chest');
        },
      );
    });

    test('returns Left(ServerError) on error', () async {
      final serverError = ServerError(errorModel: ErrorModel(message: 'error'));
      when(mockDataSource.getRecommendationToDay())
          .thenAnswer((_) async => ErrorApiResult(serverError));

      final result = await repo.getRecommendationToDay();
      expect(result.isLeft(), true);
      result.fold(
        (error) {
          expect(error, isA<ServerError>());
          expect(error.errorModel?.message, 'error');
        },
        (_) => fail('Should be Left'),
      );
    });
  });
}
