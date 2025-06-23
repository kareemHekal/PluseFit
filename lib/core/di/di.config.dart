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

import '../../data/data_source_contract/auth/forget_password_datasource.dart'
    as _i1030;
import '../../data/data_source_contract/auth/login_datasource.dart' as _i1048;
import '../../data/data_source_contract/auth/register_datasource.dart' as _i504;
import '../../data/data_source_impl/auth/forget_password_datasource_impl.dart'
    as _i449;
import '../../data/data_source_impl/auth/login_datasource_impl.dart' as _i1013;
import '../../data/data_source_impl/auth/register_datasource_impl.dart'
    as _i112;
import '../../data/repo_impl/forget_password_repo_impl.dart' as _i1051;
import '../../data/repo_impl/login_repo_impl.dart' as _i886;
import '../../data/repo_impl/register_repo_impl.dart' as _i357;
import '../../domain/repo_contract/forget_password_repo.dart' as _i109;
import '../../domain/repo_contract/login_repo.dart' as _i496;
import '../../domain/repo_contract/register_repo.dart' as _i513;
import '../../domain/use_cases/forget_password_usecases/forget_password_usecase.dart'
    as _i256;
import '../../domain/use_cases/forget_password_usecases/otp_usecase.dart'
    as _i1026;
import '../../domain/use_cases/forget_password_usecases/reset_password_usecase.dart'
    as _i682;
import '../../domain/use_cases/login_usecase.dart' as _i645;
import '../../domain/use_cases/register_usecase.dart' as _i328;
import '../../ui/Auth/complete_register/view_model/complete_register_cubit.dart'
    as _i765;
import '../../ui/Auth/login/viewmodel/login_cubit.dart' as _i210;
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
    gh.factory<_i210.LoginCubit>(() => _i210.LoginCubit());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.singleton<_i299.CacheHelper>(() => _i299.CacheHelper());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.factory<_i1030.ForgetPasswordDatasource>(
        () => _i449.ForgetPasswordDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i109.ForgetPasswordRepo>(() =>
        _i1051.ForgetPasswordRepoImpl(gh<_i1030.ForgetPasswordDatasource>()));
    gh.singleton<_i1048.LoginDataSource>(
        () => _i1013.LoginDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i504.RegisterDataSource>(
        () => _i112.RegisterDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i256.ForgetPasswordUseCase>(
        () => _i256.ForgetPasswordUseCase(gh<_i109.ForgetPasswordRepo>()));
    gh.factory<_i1026.OtpUsecase>(
        () => _i1026.OtpUsecase(gh<_i109.ForgetPasswordRepo>()));
    gh.factory<_i682.ResetPasswordUsecase>(
        () => _i682.ResetPasswordUsecase(gh<_i109.ForgetPasswordRepo>()));
    gh.singleton<_i496.LoginRepo>(
        () => _i886.LoginRepoImpl(gh<_i1048.LoginDataSource>()));
    gh.factory<_i513.RegisterRepo>(
        () => _i357.RegisterRepoImpl(gh<_i504.RegisterDataSource>()));
    gh.factory<_i328.RegisterUseCase>(() =>
        _i328.RegisterUseCase(registerContract: gh<_i513.RegisterRepo>()));
    gh.factory<_i645.LoginUseCase>(
        () => _i645.LoginUseCase(gh<_i496.LoginRepo>()));
    gh.factory<_i906.AuthCubit>(() => _i906.AuthCubit(
          gh<_i256.ForgetPasswordUseCase>(),
          gh<_i1026.OtpUsecase>(),
          gh<_i682.ResetPasswordUsecase>(),
        ));
    gh.factory<_i765.CompleteRegisterCubit>(
        () => _i765.CompleteRegisterCubit(gh<_i328.RegisterUseCase>()));
    return this;
  }
}

class _$LoggerModule extends _i279.LoggerModule {}
