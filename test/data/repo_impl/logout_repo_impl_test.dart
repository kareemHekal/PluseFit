import 'package:flutter_test/flutter_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/auth/logout_datasource.dart';
import 'package:fit_zone/data/repo_impl/logout_repo_impl.dart';
import 'package:fit_zone/domain/repo_contract/logout_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_repo_impl_test.mocks.dart';

@GenerateMocks([LogoutDatasource])
void main() {
  late MockLogoutDatasource mockLogoutDatasource;
  late LogoutRepo logoutRepo;

  setUp(() {
    mockLogoutDatasource = MockLogoutDatasource();
    logoutRepo = LogoutRepoImpl(logoutDatasource: mockLogoutDatasource);
  });

  group('LogoutRepoImpl', () {
    test('logout returns SuccessApiResult(true) when datasource succeeds', () async {
      // Arrange
      final result = SuccessApiResult<bool>(true);
      provideDummy<ApiResult<bool>>(result);

      when(mockLogoutDatasource.logout()).thenAnswer((_) async => result);

      // Act
      final response = await logoutRepo.logout();

      // Assert
      expect(response, isA<SuccessApiResult<bool>>());
      expect((response as SuccessApiResult).data, true);
      verify(mockLogoutDatasource.logout()).called(1);
    });

    test('logout returns ErrorApiResult when datasource fails', () async {
      // Arrange
      final error = ErrorApiResult<bool>(Exception("Logout failed"));
      provideDummy<ApiResult<bool>>(error);

      when(mockLogoutDatasource.logout()).thenAnswer((_) async => error);

      // Act
      final response = await logoutRepo.logout();

      // Assert
      expect(response, isA<ErrorApiResult<bool>>());
      verify(mockLogoutDatasource.logout()).called(1);
    });
  });
}
