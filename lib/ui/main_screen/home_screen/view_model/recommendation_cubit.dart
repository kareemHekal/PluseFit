import 'package:fit_zone/domain/use_cases/get_recommendation_to_day_usecase.dart';
import 'package:fit_zone/ui/main_screen/home_screen/view_model/recommendation_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecommendationCubit extends Cubit<RecommendationStates> {
  final GetRecommendationToDayUseCase getRecommendationToDayUseCase;
  RecommendationCubit(this.getRecommendationToDayUseCase)
      : super(RecommendationInitialState());

  void getRecommendations() async {
    emit(RecommendationLoadingState());
    var result = await getRecommendationToDayUseCase.execute();
    result.fold(
      (error) => emit(RecommendationErrorState(
          error.errorModel?.message ?? "Something went wrong")),
      (muscles) => emit(RecommendationSuccessState(muscles)),
    );
  }
}
