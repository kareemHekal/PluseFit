import 'package:fit_zone/core/reusable_comp/home_background_cuver.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackgroundCover(
      appBar: AppBar(
        title: Text(AppStrings.editProfile),
      ),
      bodyWidget: const Center(
        child: Text('Edit Profile'),
      ),
    );
  }
}
