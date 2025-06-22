// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../data/login_datasource.dart' as _i899;
import '../../data/login_datasource_impl.dart' as _i734;
import '../../data/login_repo_impl.dart' as _i349;
import '../../domain/common/login_repo.dart' as _i772;
import '../../domain/usescases/login_usecase.dart' as _i433;
import '../../ui/Auth/view_model/cubit/auth_cubit.dart' as _i906;
import '../api/api_manager.dart' as _i1047;
import '../cache/shared_pref.dart' as _i299;
import '../logger/logger_module.dart' as _i279;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    gh.factory<_i906.AuthCubit>(() => _i906.AuthCubit());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i299.CacheHelper>(() => _i299.CacheHelper());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.singleton<_i899.LoginDataSource>(
        () => _i734.LoginDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.singleton<_i772.AuthRepository>(
        () => _i349.AuthRepositoryImpl(gh<_i899.LoginDataSource>()));
    gh.factory<_i433.LoginUseCase>(
        () => _i433.LoginUseCase(gh<_i772.AuthRepository>()));
    return this;
  }
}

class _$LoggerModule extends _i279.LoggerModule {}
