import 'package:flutter/material.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/text_style_manager.dart';

class InfoChip extends StatelessWidget {
  final String text;
  final bool colored;

  const InfoChip({super.key, required this.text, this.colored = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: AppTextStyle.regular12.copyWith(
            color: colored ? ColorManager.primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
