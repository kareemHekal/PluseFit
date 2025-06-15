import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class AuthBackgroundCuver extends StatelessWidget {
  final Widget bodyWidget;
  final AppBar? appBar;

  const AuthBackgroundCuver({super.key, this.appBar, required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image behind everything including AppBar
        Positioned.fill(
          child: Image.asset(
            AssetsManager.imagesAuthBackground,
            fit: BoxFit.cover,
          ),
        ),

        // Transparent scaffold with optional AppBar and your widget
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: bodyWidget,
        ),
      ],
    );
  }
}
