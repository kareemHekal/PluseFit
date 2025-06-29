// ignore_for_file: prefer_const_constructors

import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Ahmed ,",
              style: TextStyle(fontSize: 24, color: ColorManager.white),
            ),
            Text(
              "Let's Start Your Day",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(AssetsManager.imagesIconUseravatar),
        )
      ],
    );
  }
}
