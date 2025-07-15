import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/forget_pass_response.dart';
import 'package:fit_zone/domain/repo_contract/forget_password_repo.dart';
import 'package:fit_zone/domain/use_cases/forget_password_usecases/forget_password_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'forget_password_usecase_test.mocks.dart';

@GenerateMocks([ForgetPasswordRepo])
void main() {
  // 🟢 حل مشكلة MissingDummyValueError:
  provideDummy<ApiResult<ForgetPasswordResponse>>(
    ErrorApiResult(Exception("Dummy error")),
  );

  late ForgetPasswordUseCase forgetPasswordUseCase;
  late MockForgetPasswordRepo mockForgetpasswordRepo;

  setUp(() {
    mockForgetpasswordRepo = MockForgetPasswordRepo();
    forgetPasswordUseCase = ForgetPasswordUseCase(mockForgetpasswordRepo);
  });

  group('ForgetPasswordUseCase Tests', () {
    const String testEmail = 'ehabmohamed52t@gmail.com';

    test('should return SuccessApiResult when email verification is sent successfully', () async {
      // Arrange
      when(mockForgetpasswordRepo.forgetPassword(email: testEmail))
          .thenAnswer((_) async => SuccessApiResult(
        ForgetPasswordResponse(
          message: "success",
          info: "OTP sent to your email",
        ),
      ));

      // Act
      final result = await forgetPasswordUseCase.call(email: testEmail);

      // Assert
      expect(result, isA<SuccessApiResult<ForgetPasswordResponse>>());

      final response = (result as SuccessApiResult<ForgetPasswordResponse>).data;
      expect(response!.message, "success");
      expect(response.info, "OTP sent to your email");

      verify(mockForgetpasswordRepo.forgetPassword(email: testEmail)).called(1);
      verifyNoMoreInteractions(mockForgetpasswordRepo);
    });

    test('should return ErrorApiResult when email verification fails', () async {
      // Arrange تجهيز البيانات المتوقعة من الموك
      final error = Exception('Email verification failed');
      when(mockForgetpasswordRepo.forgetPassword(email: testEmail)) //when btbd2 t7dd al state >lama tkon fe error
          .thenAnswer((_) async => ErrorApiResult(error));

      // Act  استدعاء الدالة اللي عايز تختبرها
      final result = await forgetPasswordUseCase.call(email: testEmail);

      // Assert التحقق من النتيجة لو هي صح أو غلط
      expect(result, isA<ErrorApiResult<ForgetPasswordResponse>>());
      expect((result as ErrorApiResult<ForgetPasswordResponse>).exception.toString(),
          contains('Email verification failed'));

      verify(mockForgetpasswordRepo.forgetPassword(email: testEmail)).called(1); //تتأكد إن الدالة اتنادت فعلاً

      verifyNoMoreInteractions(mockForgetpasswordRepo);
    });
  });
}
