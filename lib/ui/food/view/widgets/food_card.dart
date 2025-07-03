import 'package:flutter/material.dart';

import '../../../../core/utils/text_style_manager.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const FoodCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.6),
          ),
          Positioned(
            bottom: 12,
            left: 5,
            right: 5,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.bold20,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}
