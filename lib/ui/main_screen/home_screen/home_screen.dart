import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/ui/main_screen/home_screen/widgets/categories.dart';
import 'package:fit_zone/ui/main_screen/home_screen/widgets/recommendation_for_you_section.dart';
import 'package:fit_zone/ui/main_screen/home_screen/widgets/recommendation_section.dart';
import 'package:fit_zone/ui/main_screen/home_screen/widgets/upcoming_workouts_section.dart';
import 'package:fit_zone/ui/main_screen/home_screen/widgets/popular_training_section.dart';
import 'package:flutter/material.dart';
import 'package:fit_zone/core/cache/shared_pref.dart';
import 'dart:convert';
import '../../../../core/utils/routes_manager.dart';

import '../../../core/utils/routes_manager.dart';

class HomeScreen extends StatelessWidget {
  final void Function(String category) onCategoryTap;
  final VoidCallback onSeeAllTap;
  const HomeScreen(
      {super.key, required this.onCategoryTap, required this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: Future.value(CacheHelper.getData<String>('user')),
              builder: (context, snapshot) {
                String firstName = 'User';
                if (snapshot.hasData && snapshot.data != null) {
                  try {
                    final userJson = json.decode(snapshot.data as String);
                    firstName = userJson['firstName'] ?? 'User';
                  } catch (_) {}
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi $firstName ,',
                          style: const TextStyle(
                            color: ColorManager.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Let's Start Your Day",
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          AssetImage('assets/images/icon/useravatar.png'),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            CategorySection(
              onTap: (category) {
                if (category == "Trainer") {
                  onCategoryTap(category);
                } else {
                  _showUpcomingFeatureDialog(context);
                }
              },
            ),
            const SizedBox(height: 24),
            const RecommendationSection(),
            const SizedBox(height: 24),
            UpcomingWorkoutsSection(
              onSeeAllTap: () {
                Navigator.pushReplacementNamed(
                    context, RouteManager.workOutScreen);
              },
            ),
            RecommendationForYouSection(
              onSeeAllTap: () {
                Navigator.pushReplacementNamed(
                    context, RouteManager.foodScreen);
                },
            ),
            const SizedBox(height: 24),
            // Add the Popular Training section here
            const PopularTrainingSection(),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

  void _showUpcomingFeatureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorManager.backgroundColorr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Upcoming Feature\nStill processing on it',
              style: TextStyle(color: ColorManager.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
