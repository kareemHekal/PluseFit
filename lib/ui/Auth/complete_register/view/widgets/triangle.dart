import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  final double size;

  const Triangle({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TrianglePainter(Theme.of(context).colorScheme.primary),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  const _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final baseExtension = size.width * 0.1; // زيادة في الطول من الجانبين

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(-baseExtension, size.height) // بداية القاعدة يساراً
      ..lineTo(size.width + baseExtension, size.height) // نهاية القاعدة يميناً
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}
