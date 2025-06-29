import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:fit_zone/ui/smart_coach/view/smart_coach_drawer.dart';
import 'package:flutter/material.dart';

import 'back_icon.dart';

class SmartCoachBackgroundCover extends StatelessWidget {
  final Widget bodyWidget;
  final Widget appBarTitle;
  final BackIcon? backIcon;

  const SmartCoachBackgroundCover(
      {super.key,
      this.backIcon,
      required this.appBarTitle,
      required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.imagesSmartCoachSmartCoachBg),
          fit: BoxFit.cover,
        ),
      ),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          endDrawer: const SmartCoachDrawer(),
          appBar: AppBar(
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              leading: backIcon,
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.menu_open,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
              title: appBarTitle),
          body: bodyWidget,
        ),
      ),
    );
  }
}
