import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:flutter/material.dart';

class AuthBackgroundCuver extends StatelessWidget {
  final Widget bodyWidget;
  final bool backButton;
  const AuthBackgroundCuver(
      {super.key, required this.backButton, required this.bodyWidget});

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: backButton
              ? BackIcon(onPressed: () => Navigator.pop(context))
              : null,
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
