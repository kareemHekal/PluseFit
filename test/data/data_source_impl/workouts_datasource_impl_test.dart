import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fit_zone/data/data_source_impl/workouts_datasource_impl.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/data/model/muscles_group_response.dart';
import 'package:fit_zone/data/model/workouts_by_muscle_group_response.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:dio/dio.dart';

import 'auth/register_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late WorkoutsDataSourceImpl dataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    dataSource = WorkoutsDataSourceImpl(mockApiManager);
  });

  group('getMusclesGroups', () {
    test('returns SuccessApiResult when API call is successful', () async {
      final mockResponse = {
        'message': 'Success',
        'musclesGroup': [
          {'_id': '1', 'name': 'Chest'}
        ]
      };
      when(mockApiManager.getRequest(endpoint: EndPoint.musclesGroup))
          .thenAnswer((_) async => Response(
                data: mockResponse,
                statusCode: 200,
                requestOptions: RequestOptions(path: EndPoint.musclesGroup),
              ));

      final result = await dataSource.getMusclesGroups();
      expect(result, isA<SuccessApiResult<MusclesGroupResponse>>());
      final data = (result as SuccessApiResult<MusclesGroupResponse>).data;
      expect(data?.message, 'Success');
      expect(data?.musclesGroup?.first.name, 'Chest');
    });

    test('returns ErrorApiResult when API call throws DioException', () async {
      when(mockApiManager.getRequest(endpoint: EndPoint.musclesGroup))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: EndPoint.musclesGroup),
        response: Response(
          data: {'message': 'error'},
          statusCode: 500,
          requestOptions: RequestOptions(path: EndPoint.musclesGroup),
        ),
        type: DioExceptionType.badResponse,
      ));

      final result = await dataSource.getMusclesGroups();
      expect(result, isA<ErrorApiResult>());
    });
  });

  group('getWorkoutsByMuscleGroupId', () {
    test('returns SuccessApiResult when API call is successful', () async {
      final mockResponse = {
        'message': 'Success',
        'totalMuscles': 1,
        'muscles': [
          {'_id': '1', 'name': 'Push Up', 'image': 'url'}
        ]
      };
      when(mockApiManager.getRequest(
        endpoint: EndPoint.workoutsByMuscleGroup,
        queryParameters: {'muscleGroupId': '1'},
      )).thenAnswer((_) async => Response(
            data: mockResponse,
            statusCode: 200,
            requestOptions:
                RequestOptions(path: EndPoint.workoutsByMuscleGroup),
          ));

      final result = await dataSource.getWorkoutsByMuscleGroupId('1');
      expect(result, isA<SuccessApiResult<WorkoutsByMuscleGroupResponse>>());
      final data =
          (result as SuccessApiResult<WorkoutsByMuscleGroupResponse>).data;
      expect(data?.message, 'Success');
      expect(data?.muscles?.first.name, 'Push Up');
    });

    test('returns ErrorApiResult when API call throws DioException', () async {
      when(mockApiManager.getRequest(
        endpoint: EndPoint.workoutsByMuscleGroup,
        queryParameters: {'muscleGroupId': '1'},
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: EndPoint.workoutsByMuscleGroup),
        response: Response(
          data: {'message': 'error'},
          statusCode: 500,
          requestOptions: RequestOptions(path: EndPoint.workoutsByMuscleGroup),
        ),
        type: DioExceptionType.badResponse,
      ));

      final result = await dataSource.getWorkoutsByMuscleGroupId('1');
      expect(result, isA<ErrorApiResult>());
    });
  });
}
