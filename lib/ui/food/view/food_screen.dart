
import 'package:fit_zone/core/reusable_comp/home_background_cuver.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/ui/food/view/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/config.dart';
import '../../../core/utils/text_style_manager.dart';
import '../view_model/categories_cubit.dart';
import '../view_model/meals_cubit.dart';
import '../view_model/categories_state.dart';
import '../view_model/meals_state.dart';
import '../view_model/categories_intent.dart';
import '../view_model/meals_intent.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().doIntent(GetCategoriesOfMealsIntent());
  }

  void _loadMealsByCategory(String categoryId) {
    context.read<MealsCubit>().doIntent(GetMealsByCategoryIntent(categoryId));
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return HomeBackgroundCover(
      title: AppStrings.foodRecommendation,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AssetsManager.backIcon,
          ),
        ),
        title: Text(AppStrings.foodRecommendation, style: AppTextStyle.medium26),
      ),
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategoriesErrorState) {
                return Center(child: Text(state.message, style: const TextStyle(color: Colors.white)));
              } else if (state is CategoriesLoadedState) {
                final categories = state.categories;

                if (categories.isEmpty) {
                  return const Center(child: Text("No categories found", style: TextStyle(color: Colors.white)));
                }

                if (selectedTab == 0) {
                  _loadMealsByCategory(categories[0].strCategory);
                }

                return SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedTab;
                      final category = categories[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => selectedTab = index);
                            _loadMealsByCategory(category.strCategory);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? ColorManager.primaryColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              category.strCategory,
                              style: AppTextStyle.bold16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),

          const SizedBox(height: 12),

          // Meals Grid
          Expanded(
            child: BlocBuilder<MealsCubit, MealsState>(
              builder: (context, state) {
                if (state is MealsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MealsErrorState) {
                  return Center(
                    child: Text(state.message, style: const TextStyle(color: Colors.white)),
                  );
                } else if (state is MealsLoadedState) {
                  final meals = state.meals;

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return FoodCard(
                        title: meal.strMeal,
                        imageUrl: meal.strMealThumb,
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}


