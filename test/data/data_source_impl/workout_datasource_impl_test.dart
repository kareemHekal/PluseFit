import 'package:dio/dio.dart';
import 'package:fit_zone/data/data_source_impl/workout_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'workout_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late WorkoutDatasourceImpl dataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    dataSource = WorkoutDatasourceImpl(mockApiManager);
  });

  group("WorkoutDatasourceImpl Tests", () {
    test("getAllGroupWorkout returns SuccessApiResult<List<MusclesGroup>> on success", () async {
      // Arrange
      final responseData = {
        "musclesGroup": [
          {"id": "1", "name": "Chest"},
          {"id": "2", "name": "Back"},
        ]
      };

      when(mockApiManager.getRequest(endpoint: EndPoint.workoutTapEndpoint))
          .thenAnswer((_) async => Response(
        data: responseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: EndPoint.workoutTapEndpoint),
      ));

      // Act
      final result = await dataSource.getAllGroupWorkout(id: "1", name: "Test");

      // Assert
      expect(result, isA<SuccessApiResult<List<MusclesGroup>>>());
      final data = (result as SuccessApiResult<List<MusclesGroup>>).data;
      expect(data?.length, 2);
      expect(data?.first.name, "Chest");
    });

    test("getAllWorkout returns SuccessApiResult<List<Muscles>> on success", () async {
      // Arrange
      final responseData = {
        "muscles": [
          {"id": "1", "name": "Push Up"},
          {"id": "2", "name": "Pull Up"},
        ]
      };

      when(mockApiManager.getRequest(endpoint: EndPoint.workoutCardEndpoint))
          .thenAnswer((_) async => Response(
        data: responseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: EndPoint.workoutCardEndpoint),
      ));

      // Act
      final result = await dataSource.getAllWorkout("card123");

      // Assert
      expect(result, isA<SuccessApiResult<List<Muscles>>>());
      final data = (result as SuccessApiResult<List<Muscles>>).data;
      expect(data?.length, 2);
      expect(data?.first.name, "Push Up");
    });
  });
}
