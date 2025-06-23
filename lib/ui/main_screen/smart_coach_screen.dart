import 'package:flutter/material.dart';

class SmartCoachScreen extends StatelessWidget {
  const SmartCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Smart Coach',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
