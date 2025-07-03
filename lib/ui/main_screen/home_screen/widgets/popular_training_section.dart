// ignore_for_file: deprecated_member_use

import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class PopularTrainingSection extends StatelessWidget {
  const PopularTrainingSection({super.key});

  static const List<Map<String, String>> trainings = [
    {
      'image': 'assets/images/icon/popular1.jpg',
      'title': 'Exercises That Strengthen Your Chest',
      'tasks': '24 Tasks',
      'level': 'Beginner',
    },
    {
      'image': 'assets/images/icon/popular2.jpg',
      'title': 'Exercises That Strengthen Your Back',
      'tasks': '36 Tasks',
      'level': 'Intermediate',
    },
    {
      'image': 'assets/images/icon/popular3.jpg',
      'title': 'Exercises That Strengthen Your Body',
      'tasks': '48 Tasks',
      'level': 'Advanced',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Training',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: trainings.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final training = trainings[index];
              return Container(
                width: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(training['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              training['title']!,
                              style: const TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: ColorManager.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    training['tasks']!,
                                    style: const TextStyle(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: ColorManager.primaryColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    training['level']!,
                                    style: const TextStyle(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
