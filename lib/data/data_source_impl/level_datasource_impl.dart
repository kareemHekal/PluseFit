import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/model/get_all_level_response.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_excuter.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/api_result.dart';
import '../data_source_contract/level_datasource.dart';

@Injectable(as:LevelDatasource)
class LevelDatasourceImpl implements LevelDatasource{
  ApiManager apiManager;
  LevelDatasourceImpl(this.apiManager);

  @override
  Future<ApiResult<GetAllLevelResponse>> getAllLevel()async {
    final apiResult = await executeApi(() async {
      final response = await apiManager.getRequest(
        endpoint: EndPoint.getAllLevel,
      );
      return response.data;
    });
    if (apiResult is SuccessApiResult) {
      final json = apiResult.data; // ✅ ده الـ Map اللي المفروض تبعته
      final result = GetAllLevelResponse.fromJson(json); // ✅ كده تمام
      return SuccessApiResult(result);
    }
    else if (apiResult is ErrorApiResult) {
      return ErrorApiResult(apiResult.exception);
    } else {
      return ErrorApiResult(Exception('Unknown error'));
    }
  }

}