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
import '../../data/data_source_contract/auth/profile_datasource.dart' as _i682;
import '../../data/data_source_contract/auth/register_datasource.dart' as _i504;
import '../../data/data_source_contract/auth/workout_datasource.dart' as _i692;
import '../../data/data_source_contract/food_datasource/get_categories_of_meals_datasource.dart'
    as _i1015;
import '../../data/data_source_contract/food_datasource/get_meal_details_datasource.dart'
    as _i375;
import '../../data/data_source_contract/food_datasource/get_meals_by_category_datasource.dart'
    as _i187;
import '../../data/data_source_contract/recommendation_to_day_datasource.dart'
    as _i531;
import '../../data/data_source_contract/workouts_datasource.dart' as _i395;
import '../../data/data_source_impl/auth/forget_password_datasource_impl.dart'
    as _i449;
import '../../data/data_source_impl/auth/login_datasource_impl.dart' as _i1013;
import '../../data/data_source_impl/auth/profile_datasource_impl.dart' as _i215;
import '../../data/data_source_impl/auth/register_datasource_impl.dart'
    as _i112;
import '../../data/data_source_impl/food_datasource_impl/get_categories_of_meals_datasource_impl.dart'
    as _i914;
import '../../data/data_source_impl/food_datasource_impl/get_meal_details_datasource_impl.dart'
    as _i106;
import '../../data/data_source_impl/food_datasource_impl/get_meals_by_category_datasource_impl.dart'
    as _i458;
import '../../data/data_source_impl/recommendation_to_day_datasource_impl.dart'
    as _i769;
import '../../data/data_source_impl/workout_datasource_impl.dart' as _i279;
import '../../data/data_source_impl/workouts_datasource_impl.dart' as _i929;
import '../../data/repo_impl/food_repo_impl/get_categories_of_meals_repo_impl.dart'
    as _i511;
import '../../data/repo_impl/food_repo_impl/get_meal_details_repo_impl.dart'
    as _i992;
import '../../data/repo_impl/food_repo_impl/get_meals_by_category_repo_impl.dart'
    as _i267;
import '../../data/repo_impl/forget_password_repo_impl.dart' as _i1051;
import '../../data/repo_impl/login_repo_impl.dart' as _i886;
import '../../data/repo_impl/profile_repo_impl.dart' as _i549;
import '../../data/repo_impl/recommendation_repo_impl.dart' as _i364;
import '../../data/repo_impl/register_repo_impl.dart' as _i357;
import '../../data/repo_impl/workout_repo_impl.dart' as _i2;
import '../../data/repo_impl/workouts_repo_impl.dart' as _i710;
import '../../domain/repo_contract/food_repo/get_categories_of_meals_repo.dart'
    as _i272;
import '../../domain/repo_contract/food_repo/get_meal_details_repo.dart'
    as _i422;
import '../../domain/repo_contract/food_repo/get_meals_by_category_repo.dart'
    as _i879;
import '../../domain/repo_contract/forget_password_repo.dart' as _i109;
import '../../domain/repo_contract/login_repo.dart' as _i496;
import '../../domain/repo_contract/profile_repo.dart' as _i772;
import '../../domain/repo_contract/recommendation_repo.dart' as _i422;
import '../../domain/repo_contract/register_repo.dart' as _i513;
import '../../domain/repo_contract/workout_repo.dart' as _i377;
import '../../domain/repo_contract/workouts_repo.dart' as _i320;
import '../../domain/use_cases/fitness_usecase.dart' as _i722;
import '../../domain/use_cases/food_usecase/get_categories_of_meals_usecase.dart'
    as _i723;
import '../../domain/use_cases/food_usecase/get_meal_details_usecase.dart'
    as _i500;
import '../../domain/use_cases/food_usecase/get_meals_by_category_usecase.dart'
    as _i61;
import '../../domain/use_cases/forget_password_usecases/forget_password_usecase.dart'
    as _i256;
import '../../domain/use_cases/forget_password_usecases/otp_usecase.dart'
    as _i1026;
import '../../domain/use_cases/forget_password_usecases/reset_password_usecase.dart'
    as _i682;
import '../../domain/use_cases/get_muscles_groups_usecase.dart' as _i225;
import '../../domain/use_cases/get_profile_usecase.dart' as _i495;
import '../../domain/use_cases/get_recommendation_to_day_usecase.dart' as _i201;
import '../../domain/use_cases/get_workouts_by_muscle_group_id_usecase.dart'
    as _i612;
import '../../domain/use_cases/login_usecase.dart' as _i645;
import '../../domain/use_cases/register_usecase.dart' as _i328;
import '../../ui/Auth/complete_register/view_model/complete_register_cubit.dart'
    as _i765;
import '../../ui/Auth/login/viewmodel/login_cubit.dart' as _i210;
import '../../ui/Auth/view_model/cubit/auth_cubit.dart' as _i906;
import '../../ui/food/view_model/categories_cubit.dart' as _i535;
import '../../ui/food/view_model/meal_details_cubit.dart' as _i881;
import '../../ui/food/view_model/meals_cubit.dart' as _i410;
import '../../ui/main_screen/home_screen/view_model/recommendation_cubit.dart'
    as _i842;
import '../../ui/main_screen/home_screen/view_model/upcoming_workouts_cubit.dart'
    as _i280;
import '../../ui/main_screen/profile_screen/profile_cubit.dart' as _i315;
import '../../ui/main_screen/workouts_tab/view_model/workouts_cubit.dart'
    as _i171;
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
    gh.factory<_i375.GetMealDetailsDatasource>(
        () => _i106.GetMealDetailsDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.singleton<_i682.ProfileDataSource>(
        () => _i215.ProfileDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i1030.ForgetPasswordDatasource>(
        () => _i449.ForgetPasswordDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i109.ForgetPasswordRepo>(() =>
        _i1051.ForgetPasswordRepoImpl(gh<_i1030.ForgetPasswordDatasource>()));
    gh.factory<_i395.WorkoutsDataSource>(
        () => _i929.WorkoutsDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i1015.GetCategoriesOfMealsDatasource>(() =>
        _i914.GetCategoriesOfMealsDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i422.GetMealDetailsRepo>(() =>
        _i992.GetMealDetailsRepoImpl(gh<_i375.GetMealDetailsDatasource>()));
    gh.factory<_i187.GetMealsByCategoryDatasource>(
        () => _i458.GetMealsByCategoryDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.singleton<_i1048.LoginDataSource>(
        () => _i1013.LoginDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i531.RecommendationToDayDataSource>(
        () => _i769.RecommendationToDayDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i692.WorkoutDatasource>(
        () => _i279.WorkoutDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i272.GetCategoriesOfMealsRepo>(() =>
        _i511.GetCategoriesOfMealsRepoImpl(
            gh<_i1015.GetCategoriesOfMealsDatasource>()));
    gh.factory<_i504.RegisterDataSource>(
        () => _i112.RegisterDatasourceImpl(gh<_i1047.ApiManager>()));
    gh.singleton<_i772.ProfileRepo>(
        () => _i549.ProfileRepoImpl(gh<_i682.ProfileDataSource>()));
    gh.factory<_i320.WorkoutsRepo>(
        () => _i710.WorkoutsRepoImpl(gh<_i395.WorkoutsDataSource>()));
    gh.factory<_i256.ForgetPasswordUseCase>(
        () => _i256.ForgetPasswordUseCase(gh<_i109.ForgetPasswordRepo>()));
    gh.factory<_i1026.OtpUsecase>(
        () => _i1026.OtpUsecase(gh<_i109.ForgetPasswordRepo>()));
    gh.factory<_i682.ResetPasswordUsecase>(
        () => _i682.ResetPasswordUsecase(gh<_i109.ForgetPasswordRepo>()));
    gh.factory<_i879.GetMealsByCategoryRepo>(() =>
        _i267.GetMealsByCategoryRepoImpl(
            gh<_i187.GetMealsByCategoryDatasource>()));
    gh.factory<_i422.RecommendationRepo>(() => _i364.RecommendationRepoImpl(
        gh<_i531.RecommendationToDayDataSource>()));
    gh.factory<_i61.GetMealsByCategoryUsecase>(() =>
        _i61.GetMealsByCategoryUsecase(gh<_i879.GetMealsByCategoryRepo>()));
    gh.singleton<_i496.LoginRepo>(
        () => _i886.LoginRepoImpl(gh<_i1048.LoginDataSource>()));
    gh.factory<_i500.GetMealDetailsUsecase>(
        () => _i500.GetMealDetailsUsecase(gh<_i422.GetMealDetailsRepo>()));
    gh.factory<_i513.RegisterRepo>(
        () => _i357.RegisterRepoImpl(gh<_i504.RegisterDataSource>()));
    gh.factory<_i723.GetCategoriesOfMealsUsecase>(() =>
        _i723.GetCategoriesOfMealsUsecase(
            gh<_i272.GetCategoriesOfMealsRepo>()));
    gh.factory<_i377.WorkoutRepo>(
        () => _i2.WorkoutRepoImpl(gh<_i692.WorkoutDatasource>()));
    gh.factory<_i328.RegisterUseCase>(() =>
        _i328.RegisterUseCase(registerContract: gh<_i513.RegisterRepo>()));
    gh.factory<_i495.GetProfileUseCase>(
        () => _i495.GetProfileUseCase(gh<_i772.ProfileRepo>()));
    gh.factory<_i645.LoginUseCase>(
        () => _i645.LoginUseCase(gh<_i496.LoginRepo>()));
    gh.factory<_i881.MealDetailsCubit>(() => _i881.MealDetailsCubit(
          gh<_i500.GetMealDetailsUsecase>(),
          gh<_i61.GetMealsByCategoryUsecase>(),
        ));
    gh.factory<_i722.FitnessUsecase>(
        () => _i722.FitnessUsecase(gh<_i377.WorkoutRepo>()));
    gh.factory<_i410.MealsCubit>(
        () => _i410.MealsCubit(gh<_i61.GetMealsByCategoryUsecase>()));
    gh.factory<_i906.AuthCubit>(() => _i906.AuthCubit(
          gh<_i256.ForgetPasswordUseCase>(),
          gh<_i1026.OtpUsecase>(),
          gh<_i682.ResetPasswordUsecase>(),
        ));
    gh.factory<_i535.CategoriesCubit>(
        () => _i535.CategoriesCubit(gh<_i723.GetCategoriesOfMealsUsecase>()));
    gh.factory<_i225.GetMusclesGroupsUseCase>(
        () => _i225.GetMusclesGroupsUseCase(gh<_i320.WorkoutsRepo>()));
    gh.factory<_i612.GetWorkoutsByMuscleGroupIdUseCase>(() =>
        _i612.GetWorkoutsByMuscleGroupIdUseCase(gh<_i320.WorkoutsRepo>()));
    gh.factory<_i280.UpcomingWorkoutsCubit>(() => _i280.UpcomingWorkoutsCubit(
          gh<_i225.GetMusclesGroupsUseCase>(),
          gh<_i612.GetWorkoutsByMuscleGroupIdUseCase>(),
        ));
    gh.factory<_i201.GetRecommendationToDayUseCase>(() =>
        _i201.GetRecommendationToDayUseCase(gh<_i422.RecommendationRepo>()));
    gh.factory<_i315.ProfileCubit>(
        () => _i315.ProfileCubit(gh<_i495.GetProfileUseCase>()));
    gh.factory<_i765.CompleteRegisterCubit>(
        () => _i765.CompleteRegisterCubit(gh<_i328.RegisterUseCase>()));
    gh.factory<_i171.WorkoutsCubit>(
        () => _i171.WorkoutsCubit(gh<_i722.FitnessUsecase>()));
    gh.factory<_i842.RecommendationCubit>(() =>
        _i842.RecommendationCubit(gh<_i201.GetRecommendationToDayUseCase>()));
    return this;
  }
}

class _$LoggerModule extends _i279.LoggerModule {}
