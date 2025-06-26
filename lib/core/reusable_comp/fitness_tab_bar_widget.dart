import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class FitnessTabBar extends StatelessWidget {
  final List<String> tabs;
  final Function(int) onTabChanged;
  final int selectedIndex;
  final String title;
  final TabController controller;

  const FitnessTabBar({
    super.key,
    required this.tabs,
    required this.onTabChanged,
    required this.selectedIndex,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: TabBar(
            onTap: onTabChanged,
            controller: controller,
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: ColorManager.white,
            unselectedLabelColor: ColorManager.tertiaryColor,
            tabs: tabs.map((title) => Tab(text: title)).toList(),
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 1,
            indicator: BoxDecoration(
                border: Border.all(
                    color: ColorManager.primaryColor,
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignInside),
                borderRadius: BorderRadius.circular(30),
                color: ColorManager.primaryColor),
          ),
        ),
      ],
    );
  }
}
