import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/otp_response.dart';
import 'package:fit_zone/data/model/reset_password_response.dart';
import 'package:fit_zone/domain/repo_contract/forget_password_repo.dart';
import 'package:fit_zone/domain/use_cases/forget_password_usecases/reset_password_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_usecase_test.mocks.dart';
@GenerateMocks([ForgetPasswordRepo])
void main() {
  // 🟢 حل كل المشاكل المتعلقة بـ MissingDummyValueError
  provideDummy<ApiResult<OtpResponse>>(
    ErrorApiResult(Exception("Dummy error")),
  );

  provideDummy<ApiResult<ResetPasswordResponse>>(
    ErrorApiResult(Exception("Dummy error")),
  );

  late ResetPasswordUsecase resetPasswordUsecase;
  late MockForgetPasswordRepo mockForgetpasswordRepo;

  setUp(() {
    mockForgetpasswordRepo = MockForgetPasswordRepo();
    resetPasswordUsecase = ResetPasswordUsecase(mockForgetpasswordRepo);
  });

  group('ResetPassword Tests', () {
    const String testEmail = 'ehabmohamed52t@gmail.com';
    const String testPassword = 'Ehab@1234';

    test('should return SuccessApiResult when change password is successfully', () async {
      // Arrange
      when(mockForgetpasswordRepo.resetPassword(email: testEmail, newPassword: testPassword))
          .thenAnswer((_) async => SuccessApiResult(
        ResetPasswordResponse(
          message: "success",
          token:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NTQ0NWIyZGI2NTIwMDUxNDQxNjVmYSIsImlhdCI6MTc1MDQ0NDAxN30.Yspo_eyGQwl_gDJKKmJhnUHa7GcLiHBVgLK9BFoktyM",
        ),
      ));

      // Act
      final result = await resetPasswordUsecase.call(newPassword: testPassword, email: testEmail);

      // Assert
      expect(result, isA<SuccessApiResult<ResetPasswordResponse>>());

      final response = (result as SuccessApiResult<ResetPasswordResponse>).data;
      expect(response!.message, "success");

      verify(mockForgetpasswordRepo.resetPassword(email: testEmail, newPassword: testPassword))
          .called(1);
      verifyNoMoreInteractions(mockForgetpasswordRepo);
    });

    test('should return ErrorApiResult when password doesn\'t change', () async {
      // Arrange
      final error = Exception('Email verification failed');
      when(mockForgetpasswordRepo.resetPassword(newPassword: testPassword, email: testEmail))
          .thenAnswer((_) async => ErrorApiResult(error));

      // Act
      final result = await resetPasswordUsecase.call(email: testEmail, newPassword: testPassword);

      // Assert
      expect(result, isA<ErrorApiResult<ResetPasswordResponse>>());
      expect((result as ErrorApiResult<ResetPasswordResponse>)
          .exception
          .toString(), contains('Email verification failed'));

      verify(mockForgetpasswordRepo.resetPassword(newPassword: testPassword, email: testEmail))
          .called(1);
      verifyNoMoreInteractions(mockForgetpasswordRepo);
    });
  });
}
