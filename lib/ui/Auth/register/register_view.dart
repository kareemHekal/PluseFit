import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
