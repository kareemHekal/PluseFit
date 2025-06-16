import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;

  const BlurredContainer({
    super.key,
    required this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius effectiveRadius =
        borderRadius ?? BorderRadius.circular(20);

    return ClipRRect(
      borderRadius: effectiveRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0x1A242424).withValues(alpha: 0.001),
            borderRadius: effectiveRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
