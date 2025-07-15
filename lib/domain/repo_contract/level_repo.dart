import '../../core/api/api_result.dart';
import '../../data/model/get_all_level_response.dart';

abstract interface class LevelRepo {
  Future<ApiResult<GetAllLevelResponse>> getAllLevel();

}