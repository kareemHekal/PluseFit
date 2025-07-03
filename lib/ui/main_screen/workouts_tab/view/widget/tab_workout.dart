import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/reusable_comp/fitness_tab_bar_widget.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/data/model/workout_response/muscles_group.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view_model/workouts_cubit.dart';
import 'package:flutter/material.dart';

class TabWorkout extends StatefulWidget {
  final String id;
  final WorkoutsCubit workoutsCubit;
  final Function(String?) onCategorySelected;

  const TabWorkout({
    super.key,
    required this.id,
    required this.workoutsCubit,
    required this.onCategorySelected,
  });

  @override
  State<TabWorkout> createState() => _TabWorkoutState();
}

class _TabWorkoutState extends State<TabWorkout> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<MusclesGroup> categories = [];
  int _selectedIndex = 0;
  List<String> tabNames = [AppStrings.fullBody];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() async {
    var response = await widget.workoutsCubit.fetchTabCategories(
      id: widget.id,
      name: "",
    );

    if (response is SuccessApiResult<List<MusclesGroup>>) {
      if (response.data!.isEmpty) return;

      setState(() {
        categories = response.data!;
        tabNames.addAll(categories.map((e) => e.name ?? "Unnamed"));

        _tabController = TabController(
          length: tabNames.length,
          vsync: this,
        );

        if (widget.id.isNotEmpty) {
          int matchedIndex = categories.indexWhere((e) => e.id == widget.id);
          if (matchedIndex != -1) {
            _selectedIndex = matchedIndex + 1;
            _tabController!.animateTo(_selectedIndex);
            widget.onCategorySelected(categories[matchedIndex].id);
            _fetchCategoryData(categories[matchedIndex].id);
          }
        }

        isLoading = false;
      });
    }
  }

  void _fetchCategoryData(String? selectedCategoryId) async {
    await widget.workoutsCubit.fetchTabCategories(
      id: widget.id,
      name: selectedCategoryId ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || _tabController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return FitnessTabBar(
      title: AppStrings.workouts,
      tabs: tabNames,
      selectedIndex: _selectedIndex,
      controller: _tabController!,
      onTabChanged: (index) {
        setState(() {
          _selectedIndex = index;
          _tabController!.animateTo(index);
        });

        final selectedCategory = index == 0 ? null : categories[index - 1].id;
        _fetchCategoryData(selectedCategory);
        widget.onCategorySelected(selectedCategory);
      },
    );
  }
}
