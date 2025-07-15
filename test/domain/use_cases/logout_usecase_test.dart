import 'package:fit_zone/domain/use_cases/logout_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/domain/repo_contract/logout_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_usecase_test.mocks.dart';

@GenerateMocks([LogoutRepo])
void main() {
  late MockLogoutRepo mockLogoutRepo;
  late LogoutUsecase logoutUsecase;

  setUp(() {
    mockLogoutRepo = MockLogoutRepo();
    logoutUsecase = LogoutUsecase(logoutRepoContract: mockLogoutRepo);
  });

  group('LogoutUsecase', () {
    test('should return SuccessApiResult when logout is successful', () async {
      // Arrange
      final result = SuccessApiResult<bool>(true);
      provideDummy<ApiResult<bool>>(result);

      when(mockLogoutRepo.logout()).thenAnswer((_) async => result);

      // Act
      final response = await logoutUsecase.invoke();

      // Assert
      expect(response, isA<SuccessApiResult<bool>>());
      expect((response as SuccessApiResult).data, true);
      verify(mockLogoutRepo.logout()).called(1);
    });

    test('should return ErrorApiResult when logout fails', () async {
      // Arrange
      final result = ErrorApiResult<bool>(Exception('logout failed'));
      provideDummy<ApiResult<bool>>(result);

      when(mockLogoutRepo.logout()).thenAnswer((_) async => result);

      // Act
      final response = await logoutUsecase.invoke();

      // Assert
      expect(response, isA<ErrorApiResult<bool>>());
      verify(mockLogoutRepo.logout()).called(1);
    });
  });
}
