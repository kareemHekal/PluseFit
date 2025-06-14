import 'dart:ui';

import 'package:fit_zone/core/utils/colors_manager.dart';
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
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.white70.withValues(alpha: 0.1),
            borderRadius: effectiveRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
