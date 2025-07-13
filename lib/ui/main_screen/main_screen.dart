// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/ui/main_screen/home_screen/home_screen.dart';
import 'package:fit_zone/ui/main_screen/profile_screen/view/profile_screen.dart';
import 'package:fit_zone/ui/main_screen/workouts_tab/view/workouts_screen.dart';
import 'package:fit_zone/ui/smart_coach_welcome/smart_coach_welcome_view.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  final int? navigationTabIndex;
  const MainNavigationScreen({super.key, this.navigationTabIndex});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.navigationTabIndex ?? 0;
  }

  List<Widget> get _screens => [
        HomeScreen(
          onCategoryTap: (category) {
            if (category == "Trainer") {
              setState(() {
                _currentIndex = 1;
              });
            }
          },
          onSeeAllTap: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
        const SmartCoachWelcomeView(),
        const WorkoutsScreen(),
        ProfileScreen(key: UniqueKey()),
      ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AssetsManager.imagesAuthBackground,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: const SizedBox(height: 100),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: CustomBottomNavBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.navBarBackgroundColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CustomNavBarItem(
            iconPath: AssetsManager.imagesIconHome,
            label: AppStrings.explore,
            selected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _CustomNavBarItem(
              iconPath: AssetsManager.imagesIconChatAi,
              label: AppStrings.smartCoach,
              selected: currentIndex == 1,
              onTap: () => onTap(1)),
          _CustomNavBarItem(
            iconPath: AssetsManager.imagesIconGym,
            label: AppStrings.workouts,
            selected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          _CustomNavBarItem(
            iconPath: AssetsManager.imagesIconProfile,
            label: AppStrings.profile,
            selected: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBarItem extends StatelessWidget {
  final String iconPath;
  final String? label;
  final bool selected;
  final VoidCallback onTap;

  const _CustomNavBarItem({
    required this.iconPath,
    this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: 28,
            color: selected ? ColorManager.primaryColor : Colors.white,
          ),
          if (selected && label != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                label!,
                style: const TextStyle(
                  color: ColorManager.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
