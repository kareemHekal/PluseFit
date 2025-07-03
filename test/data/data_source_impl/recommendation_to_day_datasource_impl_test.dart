import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fit_zone/data/data_source_impl/recommendation_to_day_datasource_impl.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/data/model/recommendation_response.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:dio/dio.dart';

import 'auth/register_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late RecommendationToDayDataSourceImpl dataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    dataSource = RecommendationToDayDataSourceImpl(mockApiManager);
  });

  group('getRecommendationToDay', () {
    test('returns SuccessApiResult when API call is successful', () async {
      final mockResponse = {
        'message': 'Success',
        'totalMuscles': 1,
        'muscles': [
          {'_id': '1', 'name': 'Chest', 'image': 'url'}
        ]
      };
      when(mockApiManager.getRequest(endpoint: EndPoint.recommendationToDay))
          .thenAnswer((_) async => Response(
                data: mockResponse,
                statusCode: 200,
                requestOptions:
                    RequestOptions(path: EndPoint.recommendationToDay),
              ));

      final result = await dataSource.getRecommendationToDay();
      expect(result, isA<SuccessApiResult<RecommendationResponse>>());
      final data = (result as SuccessApiResult<RecommendationResponse>).data;
      expect(data?.message, 'Success');
      expect(data?.muscles?.first.name, 'Chest');
    });

    test('returns ErrorApiResult when API call throws DioException', () async {
      when(mockApiManager.getRequest(endpoint: EndPoint.recommendationToDay))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: EndPoint.recommendationToDay),
        response: Response(
          data: {'message': 'error'},
          statusCode: 500,
          requestOptions: RequestOptions(path: EndPoint.recommendationToDay),
        ),
        type: DioExceptionType.badResponse,
      ));

      final result = await dataSource.getRecommendationToDay();
      expect(result, isA<ErrorApiResult>());
    });
  });
}
