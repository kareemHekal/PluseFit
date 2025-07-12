import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/exercise/view/widgets/categpry_widget.dart';
import 'package:fit_zone/ui/exercise/view/widgets/exercise_widget.dart';
 import 'package:fit_zone/ui/exercise/view/widgets/info_widget.dart';
 import 'package:fit_zone/ui/exercise/view_model/cubit/level_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../core/reusable_comp/back_icon.dart';
import '../view_model/cubit/level_cubit.dart';

class ExerciseScreen extends StatefulWidget {
  final String muscleId;
  final String muscleName;
  final String muscleImage;

  const ExerciseScreen({
    super.key,
    this.muscleId = "67c8499726895f87ce0aa9c1",
    this.muscleName = "Adductor Magnus",
    this.muscleImage = "https://iili.io/33p7kMu.png",
  });

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final muscleId = widget.muscleId;
    final muscleName = widget.muscleName;
    final muscleImage = widget.muscleImage;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) =>
      getIt<ExerciseCubit>()..loadLevelsAndExercises(muscleId),
      child: Scaffold(
        body: Stack(
          children: [
            const AuthBackgroundCover(bodyWidget: SizedBox.shrink()),

            BlocBuilder<ExerciseCubit, ExerciseState>(
              buildWhen: (previous, current) =>
              current is LevelLoadingState ||
                  current is LevelSuccessState ||
                  current is LevelErrorState,
              builder: (context, state) {
                if (state is LevelLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is LevelSuccessState) {
                  final levels = state.response?.levels ?? [];

                  if (levels.isEmpty) {
                    return const Center(child: Text("No levels available"));
                  }

                  return DefaultTabController(
                    length: levels.length,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 370,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: height * 0.4,
                                  child: CachedNetworkImage(
                                    imageUrl: muscleImage,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Image.asset(
                                        "assets/images/exr.png",
                                        fit: BoxFit.cover),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: height * 0.4 - 200,
                                left: 16,
                                right: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      muscleName,
                                      style: AppTextStyle.regular24
                                          .copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "List of exercises for this muscle group.",
                                      style: AppTextStyle.medium16
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: height * 0.4 - 100,
                                left: 16,
                                right: 16,
                                child: const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children:  [
                                      InfoChip(text: "30 MIN"),
                                      InfoChip(text: "130 Cal", colored: true),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: height * 0.4 - 40,
                                left: 0,
                                right: 0,
                                child: TabBar(
                                  isScrollable: true,
                                  indicatorColor: ColorManager.secondaryColor,
                                  dividerColor: Colors.transparent,
                                  onTap: (index) {
                                    setState(() {
                                      selectedCategory = index;
                                    });

                                    final selectedLevel = levels[index];
                                    ExerciseCubit.get(context).doIntent(
                                      Exercise(
                                        primeMoverMuscleId: muscleId,
                                        difficultyLevelId:
                                        selectedLevel.id.toString(),
                                      ),
                                    );
                                  },
                                  tabs: levels.map((level) {
                                    final index = levels.indexOf(level);
                                    return CategoryWidget(
                                      category: level.name ?? "",
                                      isSelected: selectedCategory == index,
                                    );
                                  }).toList(),
                                ),
                              ),
                              const Positioned(
                                top: 40,
                                left: 8,
                                child: BackIcon(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: BlocBuilder<ExerciseCubit, ExerciseState>(
                            buildWhen: (previous, current) =>
                            current is ExerciseLoadingState ||
                                current is ExerciseSuccessState ||
                                current is ExerciseErrorState,
                            builder: (context, state) {
                              if (state is ExerciseLoadingState) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is ExerciseSuccessState) {
                                final exercises =
                                    state.response?.exercises ?? [];
                                if(exercises.isEmpty){
                                  return Center(child: Text("No Exercises Availables",style: AppTextStyle.regular24,));
                                }
                                return ListView.separated(
                                  padding: const EdgeInsets.all(16),
                                  itemCount: exercises.length,
                                  itemBuilder: (context, index) {
                                    return ExerciseWidget(
                                         exercises[index] );
                                  },
                                  separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                                );
                              } else if (state is ExerciseErrorState) {
                                return Center(
                                  child: Text(
                                    "Error: ${state.message}",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              }
                              return const SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
