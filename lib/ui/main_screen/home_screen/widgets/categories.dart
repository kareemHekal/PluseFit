// ignore_for_file: deprecated_member_use

import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final void Function(String category)? onTap;

  const CategorySection({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItem('assets/images/icon/gym.png', 'Gym'),
          _buildDivider(),
          _buildItem('assets/images/icon/fitness.png', 'Fitness'),
          _buildDivider(),
          _buildItem('assets/images/icon/yoga.png', 'Yoga'),
          _buildDivider(),
          _buildItem('assets/images/icon/aerobics.png', 'Aerobics'),
          _buildDivider(),
          _buildItem('assets/images/icon/trainer.png', 'Trainer'),
        ],
      ),
    );
  }

  Widget _buildItem(String imagePath, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap?.call(label),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 50),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: ColorManager.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 50,
      width: 1,
      color: ColorManager.white.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
