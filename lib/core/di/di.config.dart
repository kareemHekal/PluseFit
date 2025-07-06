// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fit_zone/core/api/api_manager.dart' as _i452;
import 'package:fit_zone/core/di/hive_module.dart' as _i239;
import 'package:fit_zone/core/logger/logger_module.dart' as _i742;
import 'package:fit_zone/data/data_source_contract/auth/forget_password_datasource.dart'
    as _i122;
import 'package:fit_zone/data/data_source_contract/auth/login_datasource.dart'
    as _i936;
import 'package:fit_zone/data/data_source_contract/auth/profile_datasource.dart'
    as _i60;
import 'package:fit_zone/data/data_source_contract/auth/register_datasource.dart'
    as _i135;
import 'package:fit_zone/data/data_source_contract/auth/workout_datasource.dart'
    as _i566;
import 'package:fit_zone/data/data_source_contract/change_password_datasource.dart'
    as _i221;
import 'package:fit_zone/data/data_source_contract/food_datasource/get_categories_of_meals_datasource.dart'
    as _i1069;
import 'package:fit_zone/data/data_source_contract/food_datasource/get_meal_details_datasource.dart'
    as _i1021;
import 'package:fit_zone/data/data_source_contract/food_datasource/get_meals_by_category_datasource.dart'
    as _i83;
import 'package:fit_zone/data/data_source_contract/recommendation_to_day_datasource.dart'
    as _i866;
import 'package:fit_zone/data/data_source_contract/smart_coach_data_source.dart'
    as _i178;
import 'package:fit_zone/data/data_source_contract/workouts_datasource.dart'
    as _i285;
import 'package:fit_zone/data/data_source_impl/auth/forget_password_datasource_impl.dart'
    as _i546;
import 'package:fit_zone/data/data_source_impl/auth/login_datasource_impl.dart'
    as _i346;
import 'package:fit_zone/data/data_source_impl/auth/profile_datasource_impl.dart'
    as _i967;
import 'package:fit_zone/data/data_source_impl/auth/register_datasource_impl.dart'
    as _i922;
import 'package:fit_zone/data/data_source_impl/change_password_datasource_impl.dart'
    as _i969;
import 'package:fit_zone/data/data_source_impl/food_datasource_impl/get_categories_of_meals_datasource_impl.dart'
    as _i912;
import 'package:fit_zone/data/data_source_impl/food_datasource_impl/get_meal_details_datasource_impl.dart'
    as _i1061;
import 'package:fit_zone/data/data_source_impl/food_datasource_impl/get_meals_by_category_datasource_impl.dart'
    as _i382;
import 'package:fit_zone/data/data_source_impl/recommendation_to_day_datasource_impl.dart'
    as _i555;
import 'package:fit_zone/data/data_source_impl/smart_coach_data_source_impl.dart'
    as _i605;
import 'package:fit_zone/data/data_source_impl/workout_datasource_impl.dart'
    as _i780;
import 'package:fit_zone/data/data_source_impl/workouts_datasource_impl.dart'
    as _i687;
import 'package:fit_zone/data/model/smart_coach/conversation_model.dart'
    as _i940;
import 'package:fit_zone/data/repo_impl/change_password_repo_impl.dart'
    as _i938;
import 'package:fit_zone/data/repo_impl/food_repo_impl/get_categories_of_meals_repo_impl.dart'
    as _i859;
import 'package:fit_zone/data/repo_impl/food_repo_impl/get_meal_details_repo_impl.dart'
    as _i948;
import 'package:fit_zone/data/repo_impl/food_repo_impl/get_meals_by_category_repo_impl.dart'
    as _i318;
import 'package:fit_zone/data/repo_impl/forget_password_repo_impl.dart'
    as _i639;
import 'package:fit_zone/data/repo_impl/login_repo_impl.dart' as _i446;
import 'package:fit_zone/data/repo_impl/profile_repo_impl.dart' as _i118;
import 'package:fit_zone/data/repo_impl/recommendation_repo_impl.dart' as _i121;
import 'package:fit_zone/data/repo_impl/register_repo_impl.dart' as _i269;
import 'package:fit_zone/data/repo_impl/smart_coach_repo_contract_impl.dart'
    as _i739;
import 'package:fit_zone/data/repo_impl/workout_repo_impl.dart' as _i549;
import 'package:fit_zone/data/repo_impl/workouts_repo_impl.dart' as _i874;
import 'package:fit_zone/domain/repo_contract/change_password_repo.dart'
    as _i863;
import 'package:fit_zone/domain/repo_contract/food_repo/get_categories_of_meals_repo.dart'
    as _i817;
import 'package:fit_zone/domain/repo_contract/food_repo/get_meal_details_repo.dart'
    as _i142;
import 'package:fit_zone/domain/repo_contract/food_repo/get_meals_by_category_repo.dart'
    as _i970;
import 'package:fit_zone/domain/repo_contract/forget_password_repo.dart'
    as _i98;
import 'package:fit_zone/domain/repo_contract/login_repo.dart' as _i700;
import 'package:fit_zone/domain/repo_contract/profile_repo.dart' as _i504;
import 'package:fit_zone/domain/repo_contract/recommendation_repo.dart'
    as _i168;
import 'package:fit_zone/domain/repo_contract/register_repo.dart' as _i223;
import 'package:fit_zone/domain/repo_contract/smart_coach_repo_contract.dart'
    as _i17;
import 'package:fit_zone/domain/repo_contract/workout_repo.dart' as _i342;
import 'package:fit_zone/domain/repo_contract/workouts_repo.dart' as _i450;
import 'package:fit_zone/domain/use_cases/change_password_usecase.dart' as _i24;
import 'package:fit_zone/domain/use_cases/fitness_usecase.dart' as _i440;
import 'package:fit_zone/domain/use_cases/food_usecase/get_categories_of_meals_usecase.dart'
    as _i450;
import 'package:fit_zone/domain/use_cases/food_usecase/get_meal_details_usecase.dart'
    as _i117;
import 'package:fit_zone/domain/use_cases/food_usecase/get_meals_by_category_usecase.dart'
    as _i22;
import 'package:fit_zone/domain/use_cases/forget_password_usecases/forget_password_usecase.dart'
    as _i964;
import 'package:fit_zone/domain/use_cases/forget_password_usecases/otp_usecase.dart'
    as _i431;
import 'package:fit_zone/domain/use_cases/forget_password_usecases/reset_password_usecase.dart'
    as _i219;
import 'package:fit_zone/domain/use_cases/get_muscles_groups_usecase.dart'
    as _i665;
import 'package:fit_zone/domain/use_cases/get_profile_usecase.dart' as _i595;
import 'package:fit_zone/domain/use_cases/get_recommendation_to_day_usecase.dart'
    as _i244;
import 'package:fit_zone/domain/use_cases/get_workouts_by_muscle_group_id_usecase.dart'
    as _i8;
import 'package:fit_zone/domain/use_cases/login_usecase.dart' as _i904;
import 'package:fit_zone/domain/use_cases/register_usecase.dart' as _i687;
import 'package:fit_zone/domain/use_cases/smart_coach/add_conversation_use_case.dart'
    as _i358;
import 'package:fit_zone/domain/use_cases/smart_coach/get_all_conversations_use_case.dart'
    as _i238;
import 'package:fit_zone/domain/use_cases/smart_coach/send_prompt_usecase.dart'
    as _i41;
import 'package:fit_zone/firebase/datasource/send_a_prompt_datasource.dart'
    as _i425;
import 'package:fit_zone/firebase/datasource_impl/gemini/send_a_prompt_datasource_impl.dart'
    as _i135;
import 'package:fit_zone/firebase/services/gemini_services.dart' as _i65;
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart'
    as _i827;
import 'package:fit_zone/ui/Auth/login/viewmodel/login_cubit.dart' as _i887;
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart' as _i103;
import 'package:fit_zone/ui/change_password/view_model/change_password_cubit.dart'
    as _i188;
import 'package:fit_zone/ui/food/view_model/categories_cubit.dart' as _i1027;
import 'package:fit_zone/ui/food/view_model/meal_details_cubit.dart' as _i1022;
import 'package:fit_zone/ui/food/view_model/meals_cubit.dart' as _i121;
import 'package:fit_zone/ui/main_screen/home_screen/view_model/recommendation_cubit.dart'
    as _i235;
import 'package:fit_zone/ui/main_screen/home_screen/view_model/upcoming_workouts_cubit.dart'
    as _i223;
import 'package:fit_zone/ui/main_screen/profile_screen/profile_cubit.dart'
    as _i963;
import 'package:fit_zone/ui/main_screen/workouts_tab/view_model/workouts_cubit.dart'
    as _i954;
import 'package:fit_zone/ui/smart_coach/view_model/cubit/smart_coach_cubit.dart'
    as _i404;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final hiveModule = _$HiveModule();
    final loggerModule = _$LoggerModule();
    await gh.factoryAsync<_i979.Box<_i940.ConversationModel>>(
      () => hiveModule.conversationBox,
      preResolve: true,
    );
    gh.factory<_i887.LoginCubit>(() => _i887.LoginCubit());
    gh.singleton<_i452.ApiManager>(() => _i452.ApiManager());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.lazySingleton<_i65.GeminiServices>(() => _i65.GeminiServices());
    gh.factory<_i425.SendAPromptDatasource>(
        () => _i135.SendAPromptDatasourceImpl(gh<_i65.GeminiServices>()));
    gh.factory<_i1021.GetMealDetailsDatasource>(
        () => _i1061.GetMealDetailsDatasourceImpl(gh<_i452.ApiManager>()));
    gh.singleton<_i60.ProfileDataSource>(
        () => _i967.ProfileDataSourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i122.ForgetPasswordDatasource>(
        () => _i546.ForgetPasswordDatasourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i98.ForgetPasswordRepo>(() =>
        _i639.ForgetPasswordRepoImpl(gh<_i122.ForgetPasswordDatasource>()));
    gh.factory<_i221.ChangePasswordDatasource>(
        () => _i969.ChangePasswordDatasourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i285.WorkoutsDataSource>(
        () => _i687.WorkoutsDataSourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i1069.GetCategoriesOfMealsDatasource>(
        () => _i912.GetCategoriesOfMealsDatasourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i41.SendPromptUsecase>(
        () => _i41.SendPromptUsecase(gh<_i425.SendAPromptDatasource>()));
    gh.factory<_i142.GetMealDetailsRepo>(() =>
        _i948.GetMealDetailsRepoImpl(gh<_i1021.GetMealDetailsDatasource>()));
    gh.factory<_i83.GetMealsByCategoryDatasource>(
        () => _i382.GetMealsByCategoryDatasourceImpl(gh<_i452.ApiManager>()));
    gh.singleton<_i936.LoginDataSource>(
        () => _i346.LoginDataSourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i866.RecommendationToDayDataSource>(
        () => _i555.RecommendationToDayDataSourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i566.WorkoutDatasource>(
        () => _i780.WorkoutDatasourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i863.ChangePasswordRepo>(() =>
        _i938.ChangePasswordRepoImpl(gh<_i221.ChangePasswordDatasource>()));
    gh.factory<_i817.GetCategoriesOfMealsRepo>(() =>
        _i859.GetCategoriesOfMealsRepoImpl(
            gh<_i1069.GetCategoriesOfMealsDatasource>()));
    gh.factory<_i135.RegisterDataSource>(
        () => _i922.RegisterDatasourceImpl(gh<_i452.ApiManager>()));
    gh.factory<_i178.SmartCoachDataSource>(() => _i605.SmartCoachDataSourceImpl(
        gh<_i979.Box<_i940.ConversationModel>>()));
    gh.singleton<_i504.ProfileRepo>(
        () => _i118.ProfileRepoImpl(gh<_i60.ProfileDataSource>()));
    gh.factory<_i450.WorkoutsRepo>(
        () => _i874.WorkoutsRepoImpl(gh<_i285.WorkoutsDataSource>()));
    gh.factory<_i964.ForgetPasswordUseCase>(
        () => _i964.ForgetPasswordUseCase(gh<_i98.ForgetPasswordRepo>()));
    gh.factory<_i431.OtpUsecase>(
        () => _i431.OtpUsecase(gh<_i98.ForgetPasswordRepo>()));
    gh.factory<_i219.ResetPasswordUsecase>(
        () => _i219.ResetPasswordUsecase(gh<_i98.ForgetPasswordRepo>()));
    gh.factory<_i970.GetMealsByCategoryRepo>(() =>
        _i318.GetMealsByCategoryRepoImpl(
            gh<_i83.GetMealsByCategoryDatasource>()));
    gh.factory<_i168.RecommendationRepo>(() => _i121.RecommendationRepoImpl(
        gh<_i866.RecommendationToDayDataSource>()));
    gh.factory<_i24.ChangePasswordUsecase>(
        () => _i24.ChangePasswordUsecase(gh<_i863.ChangePasswordRepo>()));
    gh.factory<_i22.GetMealsByCategoryUsecase>(() =>
        _i22.GetMealsByCategoryUsecase(gh<_i970.GetMealsByCategoryRepo>()));
    gh.singleton<_i700.LoginRepo>(
        () => _i446.LoginRepoImpl(gh<_i936.LoginDataSource>()));
    gh.factory<_i117.GetMealDetailsUsecase>(
        () => _i117.GetMealDetailsUsecase(gh<_i142.GetMealDetailsRepo>()));
    gh.factory<_i223.RegisterRepo>(
        () => _i269.RegisterRepoImpl(gh<_i135.RegisterDataSource>()));
    gh.factory<_i17.SmartCoachRepoContract>(() =>
        _i739.SmartCoachRepoContractImpl(gh<_i178.SmartCoachDataSource>()));
    gh.factory<_i450.GetCategoriesOfMealsUsecase>(() =>
        _i450.GetCategoriesOfMealsUsecase(
            gh<_i817.GetCategoriesOfMealsRepo>()));
    gh.factory<_i188.ChangePasswordCubit>(
        () => _i188.ChangePasswordCubit(gh<_i24.ChangePasswordUsecase>()));
    gh.factory<_i342.WorkoutRepo>(
        () => _i549.WorkoutRepoImpl(gh<_i566.WorkoutDatasource>()));
    gh.factory<_i687.RegisterUseCase>(() =>
        _i687.RegisterUseCase(registerContract: gh<_i223.RegisterRepo>()));
    gh.factory<_i595.GetProfileUseCase>(
        () => _i595.GetProfileUseCase(gh<_i504.ProfileRepo>()));
    gh.factory<_i904.LoginUseCase>(
        () => _i904.LoginUseCase(gh<_i700.LoginRepo>()));
    gh.factory<_i1022.MealDetailsCubit>(() => _i1022.MealDetailsCubit(
          gh<_i117.GetMealDetailsUsecase>(),
          gh<_i22.GetMealsByCategoryUsecase>(),
        ));
    gh.factory<_i440.FitnessUsecase>(
        () => _i440.FitnessUsecase(gh<_i342.WorkoutRepo>()));
    gh.factory<_i121.MealsCubit>(
        () => _i121.MealsCubit(gh<_i22.GetMealsByCategoryUsecase>()));
    gh.factory<_i103.AuthCubit>(() => _i103.AuthCubit(
          gh<_i964.ForgetPasswordUseCase>(),
          gh<_i431.OtpUsecase>(),
          gh<_i219.ResetPasswordUsecase>(),
        ));
    gh.factory<_i1027.CategoriesCubit>(
        () => _i1027.CategoriesCubit(gh<_i450.GetCategoriesOfMealsUsecase>()));
    gh.factory<_i665.GetMusclesGroupsUseCase>(
        () => _i665.GetMusclesGroupsUseCase(gh<_i450.WorkoutsRepo>()));
    gh.factory<_i8.GetWorkoutsByMuscleGroupIdUseCase>(
        () => _i8.GetWorkoutsByMuscleGroupIdUseCase(gh<_i450.WorkoutsRepo>()));
    gh.factory<_i223.UpcomingWorkoutsCubit>(() => _i223.UpcomingWorkoutsCubit(
          gh<_i665.GetMusclesGroupsUseCase>(),
          gh<_i8.GetWorkoutsByMuscleGroupIdUseCase>(),
        ));
    gh.factory<_i358.AddConversationUseCase>(
        () => _i358.AddConversationUseCase(gh<_i17.SmartCoachRepoContract>()));
    gh.factory<_i238.GetAllConversationsUseCase>(() =>
        _i238.GetAllConversationsUseCase(gh<_i17.SmartCoachRepoContract>()));
    gh.factory<_i244.GetRecommendationToDayUseCase>(() =>
        _i244.GetRecommendationToDayUseCase(gh<_i168.RecommendationRepo>()));
    gh.factory<_i963.ProfileCubit>(
        () => _i963.ProfileCubit(gh<_i595.GetProfileUseCase>()));
    gh.factory<_i827.CompleteRegisterCubit>(
        () => _i827.CompleteRegisterCubit(gh<_i687.RegisterUseCase>()));
    gh.factory<_i954.WorkoutsCubit>(
        () => _i954.WorkoutsCubit(gh<_i440.FitnessUsecase>()));
    gh.factory<_i235.RecommendationCubit>(() =>
        _i235.RecommendationCubit(gh<_i244.GetRecommendationToDayUseCase>()));
    gh.factory<_i404.SmartCoachCubit>(() => _i404.SmartCoachCubit(
          gh<_i238.GetAllConversationsUseCase>(),
          gh<_i358.AddConversationUseCase>(),
          gh<_i41.SendPromptUsecase>(),
        ));
    return this;
  }
}

class _$HiveModule extends _i239.HiveModule {}

class _$LoggerModule extends _i742.LoggerModule {}
