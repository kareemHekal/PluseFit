
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/data_source_contract/level_datasource.dart';
import 'package:fit_zone/data/model/get_all_level_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/level_repo.dart';

@Injectable(as: LevelRepo)
class LevelRepoImpl implements LevelRepo{
  LevelDatasource levelDatasource;
  LevelRepoImpl(this.levelDatasource);
  @override
  Future<ApiResult<GetAllLevelResponse>> getAllLevel()async {
   return await levelDatasource.getAllLevel();
  }

}