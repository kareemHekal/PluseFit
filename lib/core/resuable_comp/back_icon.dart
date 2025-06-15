import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackIcon({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: onPressed ?? () => Navigator.pop(context),
      icon: SizedBox(
        width: 30,
        height: 30,
        child: Image.asset(
          'assets/images/icon/back_icon.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
