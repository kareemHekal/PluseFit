import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class DesignTabBar extends StatefulWidget {
  const DesignTabBar({super.key});

  @override
  State<DesignTabBar> createState() => _DesignTabBarState();
}

class _DesignTabBarState extends State<DesignTabBar> {
  int selectedIndex = 0;

  static const List<String> tabTitles = [
    'Full Body',
    'Chest',
    'Arm',
    'Shoulder',
    'Back',
    'Legs',
    'Stomach',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabTitles.length, (index) {
          final bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: isSelected
                  ? BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    )
                  : null,
              child: Text(
                tabTitles[index],
                style: const TextStyle(
                  color: ColorManager.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
