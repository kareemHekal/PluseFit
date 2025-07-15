// ignore_for_file: deprecated_member_use

import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/ui/main_screen/home_screen/view_model/upcoming_workouts_cubit.dart';
import 'package:fit_zone/ui/main_screen/home_screen/view_model/upcoming_workouts_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'design_tab_bar.dart';

class UpcomingWorkoutsSection extends StatelessWidget {
  final VoidCallback onSeeAllTap;
  const UpcomingWorkoutsSection({super.key, required this.onSeeAllTap});

  static const List<String> tabNames = [
    "Full Body",
    "Chest",
    "Arm",
    "Shoulder",
    "Back",
    "Legs",
    "Stomach"
  ];
  static const List<String> tabVariantImages = [
    "assets/images/icon/variant1.png",
    "assets/images/icon/variant2.png",
    "assets/images/icon/variant3.png",
    "assets/images/icon/variant4.png",
    "assets/images/icon/variant5.png",
    "assets/images/icon/variant6.png",
    "assets/images/icon/variant7.png",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpcomingWorkoutsCubit>()..getWorkouts(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Design-only tab bar

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Upcoming Workouts",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.white),
              ),
              TextButton(
                onPressed: onSeeAllTap,
                child: const Text(
                  "See All",
                  style: TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const DesignTabBar(),
          const SizedBox(height: 16),
          BlocBuilder<UpcomingWorkoutsCubit, UpcomingWorkoutsStates>(
            builder: (context, state) {
              if (state is UpcomingWorkoutsSuccess) {
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        state.workouts.length > 6 ? 6 : state.workouts.length,
                    itemBuilder: (context, index) {
                      final workout = state.workouts[index];
                      return Container(
                        width: 130,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(workout.image ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              workout.name ?? "",
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
              if (state is UpcomingWorkoutsError) {
                return Center(
                    child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ));
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }
}
