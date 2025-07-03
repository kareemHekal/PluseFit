import 'package:fit_zone/core/reusable_comp/fitness_card_resuble/fitness_card.dart';
import 'package:fit_zone/data/model/workout_response/muscles.dart';
import 'package:flutter/material.dart';

class FitnessCardBuilder extends StatelessWidget {
  final List<Muscles> muscles;
  final VoidCallback onTap;

  const FitnessCardBuilder({
    super.key,
    required this.muscles,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: muscles.length,
        itemBuilder: (context, index) => InkWell(
          onTap: onTap,
          child: FitnessCard(
            imgCover: muscles[index].image,
            title: muscles[index].name,
            onTap: () {
              // navigate here
            },
          ),
        ),
      ),
    );
  }
}
