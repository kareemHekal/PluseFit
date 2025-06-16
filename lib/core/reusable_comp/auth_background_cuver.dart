import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:flutter/material.dart';

import 'back_icon.dart';

class AuthBackgroundCover extends StatelessWidget {
  final Widget bodyWidget;
  final BackIcon? backIcon;

  const AuthBackgroundCover(
      {super.key, this.backIcon, required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.imagesAuthBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: backIcon,
          title: Image.asset(
            AssetsManager.imagesIconAppIcon,
            fit: BoxFit.contain,
            height: Config.screenHight! * 0.05,
            width: Config.screenWidth! * 0.5,
          ),
        ),
        body: bodyWidget,
      ),
    );
  }
}
