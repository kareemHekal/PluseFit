import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/auth/register_datasource.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:fit_zone/data/data_source_impl/auth/register_datasource_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_datasource_impl_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late RegisterDatasourceImpl dataSource;

  setUp(() {
    mockApiManager = MockApiManager();
    dataSource = RegisterDatasourceImpl(mockApiManager);
  });

  group("RegisterDatasourceImpl tests", () {
    test("register returns SuccessApiResult<RegisterResponse> on success",
        () async {
      // Arrange
      final userModel = RegisterUserModel(
        email: "test@example.com",
        password: "123456",
      );

      final responseData = {
        "message": "User registered successfully",
        "token": "abc123",
        "user": {
          "id": 1,
          "name": "Test User",
          "email": "test@example.com",
          "phone": "01000000000"
        }
      };

      when(mockApiManager.postRequest(
        endpoint: EndPoint.registerEndpoint,
        body: userModel.toJson(),
      )).thenAnswer((_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: EndPoint.registerEndpoint),
          ));

      // Act
      final result = await dataSource.register(userModel: userModel);

      // Assert
      expect(result, isA<SuccessApiResult<RegisterResponse>>());
      final data = (result as SuccessApiResult<RegisterResponse>).data;
      expect(data?.message, "User registered successfully");
      expect(data?.user?.email, "test@example.com");
    });
  });
}
