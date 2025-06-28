import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/smart_coach_background_cuver.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'widgets/message_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartCoachBackgroundCover(
      backIcon: const BackIcon(),
      AppBarTitle: Text(
        AppStrings.smartCoach,
        style: AppTextStyle.bold24,
      ),
      bodyWidget: Center(
        child: ListView(
          children: const [
            MessageWidget(
                isCoach: true, message: 'Hello How Can I Assist You Today ?'),
            MessageWidget(isCoach: false,
                message: 'Lorem Ipsum Dolor Sit Amet Consectetur.'),
            MessageWidget(
                isCoach: true, message: 'What would you like to improve?'),
            MessageWidget(isCoach: false,
                message: 'I want to improve my stamina and flexibility.'),
          ],
        ),
      ),
    );
  }
}

