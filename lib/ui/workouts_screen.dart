import 'package:flutter/material.dart';

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Workouts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
