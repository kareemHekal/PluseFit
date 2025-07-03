// ignore_for_file: deprecated_member_use

import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class RecommendationForYouSection extends StatelessWidget {
  final VoidCallback onSeeAllTap;
  const RecommendationForYouSection({super.key, required this.onSeeAllTap});

  static const List<Map<String, String>> foodCards = [
    {
      'title': 'Breakfast',
      'image': 'assets/images/icon/Breakfast.png',
    },
    {
      'title': 'Lunch',
      'image': 'assets/images/icon/lunch.png',
    },
    {
      'title': 'Dinner',
      'image': 'assets/images/icon/dinner.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recommendation For You',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorManager.white,
              ),
            ),
            TextButton(
              onPressed: onSeeAllTap,
              child: const Text(
                'See All',
                style: TextStyle(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: foodCards.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final card = foodCards[index];
              return Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(card['image']!),
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
                      card['title']!,
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
        ),
      ],
    );
  }
}
