import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:fit_zone/ui/smart_coach/view/smart_coach_drawer.dart';
import 'package:flutter/material.dart';

import 'back_icon.dart';

class SmartCoachBackgroundCover extends StatelessWidget {
  final Widget bodyWidget;
  final Widget AppBarTitle;
  final BackIcon? backIcon;

  const SmartCoachBackgroundCover({super.key,
    this.backIcon,
    required this.AppBarTitle,
    required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.imageSmartCoachBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        drawer: const SmartCoachDrawer(),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            leading: backIcon,
            actions: [
              IconButton(
                  onPressed: () {
                    // here it make you to go to side menu (drawer)
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_open, color: Theme
                      .of(context)
                      .primaryColor,)),
            ],
            title: AppBarTitle),
        body: bodyWidget,
      ),
    );
  }
}
