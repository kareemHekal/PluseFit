import 'package:fit_zone/data/model/get_all_level_response.dart';
import '../../core/api/api_result.dart';


abstract interface class LevelDatasource {

  Future<ApiResult<GetAllLevelResponse>> getAllLevel();

}