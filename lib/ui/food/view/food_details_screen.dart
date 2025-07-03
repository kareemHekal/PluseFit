// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/data/model/food/meal_details.dart';
import 'package:fit_zone/ui/food/view/widgets/food_card.dart';
import 'package:fit_zone/ui/food/view_model/meal_details_cubit.dart';
import 'package:fit_zone/ui/food/view_model/meal_details_intent.dart';
import 'package:fit_zone/ui/food/view_model/meal_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/routes_manager.dart';
import 'package:fit_zone/data/model/food/meal.dart';

class FoodDetailsScreen extends StatelessWidget {
  final String mealId;
  const FoodDetailsScreen({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<MealDetailsCubit>()..doIntent(GetMealDetailsIntent(mealId)),
      child: BlocBuilder<MealDetailsCubit, MealDetailsState>(
        builder: (context, state) {
          if (state is MealDetailsLoading || state is MealDetailsInitial) {
            return const Scaffold(
                backgroundColor: Colors.black,
                body: Center(child: CircularProgressIndicator()));
          } else if (state is MealDetailsError) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                  child: Text(state.message,
                      style: const TextStyle(color: ColorManager.white))),
            );
          } else if (state is MealDetailsLoaded) {
            return FoodDetailsView(
              meal: state.mealDetails,
              recommendations: state.recommendations,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class FoodDetailsView extends StatelessWidget {
  final MealDetails meal;
  final List<Meal> recommendations;
  const FoodDetailsView(
      {super.key, required this.meal, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    AssetsManager.imagesHomeBackground), // or NetworkImage()
                fit: BoxFit.cover, // Cover entire screen
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _IngredientsSection(meal: meal),
                      const SizedBox(height: 30),
                      _RecommendationSection(recommendations: recommendations),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            child: const _BackButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final description = meal.strInstructions.split('. ')[0];
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70)),
          child: Image.network(
            meal.strMealThumb,
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.8),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(meal.strMeal, style: AppTextStyle.bold30),
              const SizedBox(height: 8),
              Text(
                description,
                style: AppTextStyle.regular16
                    .copyWith(color: Colors.white70, height: 1.5),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 24),
              _NutritionInfo(meal: meal),
            ],
          ),
        ),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        AssetsManager.imagesIconBackIcon,
        // width: 80,
        // height: 50,
      ),
    );
  }
}

class _NutritionInfo extends StatelessWidget {
  final MealDetails meal;
  const _NutritionInfo({required this.meal});

  @override
  Widget build(BuildContext context) {
    // NOTE: The API does not provide nutritional values. These are placeholders.
    // You can wire this with real data once the API is updated.
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _InfoCircle(value: '100 K', label: 'Energy'),
        _InfoCircle(value: '15.6 G', label: 'Protein'),
        _InfoCircle(value: '58 G', label: 'Carbs'),
        _InfoCircle(value: '20 G', label: 'Fat'),
      ],
    );
  }
}

class _InfoCircle extends StatelessWidget {
  final String value;
  final String label;

  const _InfoCircle({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              border: Border.all(color: ColorManager.white, width: 1),
              borderRadius: BorderRadius.circular(22)),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Center(
                child: Text(
                  value,
                  style: AppTextStyle.regular14
                      .copyWith(color: ColorManager.white),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style:
                    AppTextStyle.regular14.copyWith(color: ColorManager.orange),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IngredientsSection extends StatelessWidget {
  final MealDetails meal;
  const _IngredientsSection({required this.meal});

  @override
  Widget build(BuildContext context) {
    final ingredients = meal.ingredients;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorManager.backgroundColorr.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ingredients', style: AppTextStyle.bold22),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final item = ingredients[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['ingredient']!,
                      style: AppTextStyle.regular16
                          .copyWith(color: ColorManager.white),
                    ),
                    Text(
                      item['measure']!,
                      style: AppTextStyle.regular16
                          .copyWith(color: ColorManager.orange),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              color: ColorManager.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendationSection extends StatelessWidget {
  final List<Meal> recommendations;
  const _RecommendationSection({required this.recommendations});

  @override
  Widget build(BuildContext context) {
    if (recommendations.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommendation', style: AppTextStyle.bold22),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final meal = recommendations[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                        RouteManager.foodDetailsScreen,
                        arguments: meal.idMeal,
                      );
                    },
                    child: FoodCard(
                      imageUrl: meal.strMealThumb,
                      title: meal.strMeal,
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
