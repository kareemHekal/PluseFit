import 'package:fit_zone/domain/repo_contract/level_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/api_result.dart';
import '../../data/model/get_all_level_response.dart';

@injectable
class LevelUsecase{
  LevelRepo levelRepo;
  LevelUsecase(this.levelRepo);

  Future<ApiResult<GetAllLevelResponse>> call(){
    return levelRepo.getAllLevel();
  }

}