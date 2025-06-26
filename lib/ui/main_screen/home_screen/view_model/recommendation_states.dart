import 'package:fit_zone/domain/entity/recommendation_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RecommendationStates {}

class RecommendationInitialState extends RecommendationStates {}

class RecommendationLoadingState extends RecommendationStates {}

class RecommendationSuccessState extends RecommendationStates {
  final List<MuscleEntity> muscles;

  RecommendationSuccessState(this.muscles);
}

class RecommendationErrorState extends RecommendationStates {
  final String message;

  RecommendationErrorState(this.message);
}
