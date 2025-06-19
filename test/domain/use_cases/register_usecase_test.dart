import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:fit_zone/domain/repo_contract/register_repo.dart';
import 'package:fit_zone/domain/use_cases/register_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_usecase_test.mocks.dart';

@GenerateMocks([RegisterRepo])
void main() {
  late MockRegisterRepo mockRegisterContract;
  late RegisterUseCase useCase;

  setUpAll(() {
    mockRegisterContract = MockRegisterRepo();
    useCase = RegisterUseCase(registerContract: mockRegisterContract);
  });

  group('RegisterUseCase', () {
    test('invoke calls RegisterContract.register and returns result', () async {
      // Arrange
      final userModel = RegisterUserModel(
        email: 'test@example.com',
        password: '123456',
      );

      final expectedResponse = RegisterResponse(
          message: 'Registered successfully',
          token: 'xyz123',
          user: UserModel(
            id: '1',
            firstName: 'John',
            lastName: 'Doe',
            email: 'test@example.com',
          ));

      final expectedResult =
          SuccessApiResult<RegisterResponse>(expectedResponse);
      provideDummy<ApiResult<RegisterResponse>>(expectedResult);

      when(mockRegisterContract.register(userModel: userModel))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await useCase.invoke(userModel: userModel);

      // Assert
      verify(mockRegisterContract.register(userModel: userModel)).called(1);
      expect(result, expectedResult);
    });
  });
}
