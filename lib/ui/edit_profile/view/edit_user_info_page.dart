import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:flutter/material.dart';

class EditUserInfoPage extends StatelessWidget {
  final Widget body;

  const EditUserInfoPage({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundCover(
      backIcon: BackIcon(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bodyWidget: body,
    );
  }
}
