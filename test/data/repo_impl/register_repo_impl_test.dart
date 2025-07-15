import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:fit_zone/data/repo_impl/register_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:fit_zone/data/data_source_contract/auth/register_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_repo_impl_test.mocks.dart';

@GenerateMocks([RegisterDataSource])
void main() {
  late MockRegisterDataSource mockRegisterDataSource;
  late RegisterRepoImpl registerRepo;

  setUp(() {
    mockRegisterDataSource = MockRegisterDataSource();
    registerRepo = RegisterRepoImpl(mockRegisterDataSource);
  });

  group('RegisterRepoImpl', () {
    test('register calls datasource and returns same result', () async {
      // Arrange
      final userModel = RegisterUserModel(
        email: 'test@example.com',
        password: '123456',
      );

      final registerResponse = RegisterResponse(
        message: "User registered successfully",
        token: "abc123",
        user: UserModel(
          id: "1213",
          firstName: "Test User",
          lastName: "Test User",
          email: "test@example.com",
        ),
      );

      final expectedResult =
          SuccessApiResult<RegisterResponse>(registerResponse);

      provideDummy<ApiResult<RegisterResponse>>(expectedResult);

      when(mockRegisterDataSource.register(userModel: userModel))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await registerRepo.register(userModel: userModel);

      // Assert
      verify(mockRegisterDataSource.register(userModel: userModel)).called(1);
      expect(result, expectedResult);
    });
  });
}
