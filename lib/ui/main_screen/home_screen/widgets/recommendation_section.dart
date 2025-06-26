// ignore_for_file: deprecated_member_use

import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/ui/main_screen/home_screen/view_model/recommendation_cubit.dart';
import 'package:fit_zone/ui/main_screen/home_screen/view_model/recommendation_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecommendationCubit>()..getRecommendations(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommendation To Day",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorManager.white),
          ),
          const SizedBox(height: 16),
          BlocBuilder<RecommendationCubit, RecommendationStates>(
            builder: (context, state) {
              if (state is RecommendationSuccessState) {
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final muscle = state.muscles[index];
                      return Container(
                        width: 130,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(muscle.image ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ColorManager.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              muscle.name ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is RecommendationErrorState) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: ColorManager.white),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
