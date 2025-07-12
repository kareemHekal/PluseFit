import 'package:fit_zone/data/model/muscle_model/muscles.dart';
import '../../core/api/api_result.dart';
abstract class MuscleDatasource{
  Future<ApiResult<List<Muscles>>> getAllLevel();
}