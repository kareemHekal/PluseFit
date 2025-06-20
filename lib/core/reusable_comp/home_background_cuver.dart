import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:flutter/material.dart';

import 'back_icon.dart';

class HomeBackgroundCover extends StatelessWidget {
  final Widget bodyWidget;
  final BackIcon? backIcon;
  final String? title;
  final AppBar? appBar; // for used in home screen

  const HomeBackgroundCover(
      {super.key,
      this.backIcon,
      this.title,
      required this.bodyWidget,
      this.appBar});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.imagesHomeBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: appBar ??
            AppBar(
                forceMaterialTransparency: true,
                leading: backIcon,
                title: Text(title ?? "")),
        body: bodyWidget,
      ),
    );
  }
}
