import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class AuthBackgroundCuver extends StatelessWidget {
  final Widget widget;
  const AuthBackgroundCuver({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.imagesAuthBackground),
          fit: BoxFit.cover,
        ),
        color: Colors.transparent,
      ),
      child: Scaffold(backgroundColor: Colors.transparent, body: widget),
    );
  }
}
