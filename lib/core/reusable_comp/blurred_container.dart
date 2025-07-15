import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? color;

  const BlurredContainer({
    super.key,
    required this.child,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius effectiveRadius =
        borderRadius ?? BorderRadius.circular(20);

    final Color backgroundColor = color != null
        ? color!.withValues(alpha: 0.4)
        : const Color(0x1A242424).withValues(alpha: 0.001);

    return ClipRRect(
      borderRadius: effectiveRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
