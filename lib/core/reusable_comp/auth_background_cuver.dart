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
      child: Stack(
        children: [
          // Optional back icon at top left
          if (backIcon != null)
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              child: backIcon!,
            ),
          // Main content
          Align(
            alignment: Alignment.topCenter,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 40,
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo centered at the top
                      Image.asset(
                        AssetsManager.imagesIconAppIcon,
                        fit: BoxFit.contain,
                        height: Config.screenHight! * 0.09,
                      ),
                      const SizedBox(height: 32),
                      bodyWidget,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
