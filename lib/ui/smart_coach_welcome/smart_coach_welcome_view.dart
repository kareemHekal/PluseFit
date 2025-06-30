import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/reusable_comp/smart_coach_background_cuver.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class SmartCoachWelcomeView extends StatelessWidget {
  const SmartCoachWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SmartCoachBackgroundCover(
        appBarTitle: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${AppStrings.hi} User', style: AppTextStyle.medium16),
            Text(AppStrings.iamYourSmartCoach, style: AppTextStyle.medium18),
          ],
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Image.asset(AssetsManager.imagesRobotChatWelocme)),
            const Spacer(),
            BlurredContainer(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.howCanAssistYouToday,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.extraBold24),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteManager.smartCoach);
                      },
                      child: Text(
                        AppStrings.getStarted,
                        style: AppTextStyle.extraBold14,
                      ))
                ],
              ),
            )),
            SizedBox(height: Config.screenHight! * 0.05),
          ],
        ));
  }
}
