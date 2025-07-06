import 'package:fit_zone/core/api/api_excuter.dart';
import 'package:fit_zone/core/api/api_manager.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/core/cache/shared_pref.dart';
import 'package:fit_zone/core/constant.dart';
import 'package:fit_zone/data/data_source_contract/auth/logout_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutDatasource)
class LogoutDatasourceImpl implements LogoutDatasource {
  final ApiManager apiManager;
  final CacheHelper cacheHelper;

  LogoutDatasourceImpl({required this.apiManager, required this.cacheHelper});

  @override
  Future<ApiResult<bool>> logout() async {
    try {
      String? token = CacheHelper.getData<String>('token');

      return await executeApi<bool>(() async {
        var apiResponse = await apiManager.getRequest(
          endpoint: EndPoint.logoutEndpoint,
          headers: {"Authorization": "Bearer $token"},
        );
        if (apiResponse.data != null &&
            apiResponse.data["message"] == "success") {
          bool removeToken = await cacheHelper.logout();
          if (removeToken) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      });
    } catch (err) {
      return ErrorApiResult(
          Exception("Server connection error: ${err.toString()}"));
    }
  }
}
