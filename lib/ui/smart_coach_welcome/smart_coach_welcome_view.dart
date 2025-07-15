import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/reusable_comp/smart_coach_background_cuver.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/smart_coach/view/chat_screen.dart';
import 'package:fit_zone/ui/smart_coach/view_model/cubit/smart_coach_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmartCoachWelcomeView extends StatelessWidget {
  const SmartCoachWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return BlocProvider(
      create: (context) => getIt<SmartCoachCubit>(),
      child: SmartCoachBackgroundCover(
          appBarTitle: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${AppStrings.hi} User', style: AppTextStyle.medium16),
              Text(AppStrings.iamYourSmartCoach, style: AppTextStyle.medium18),
            ],
          ),
          bodyWidget: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Image.asset(AssetsManager.imagesRobotChatWelocme)),
                  const SizedBox(height: 24),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChatScreen()));
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
              ),
            ),
          )),
    );
  }
}
