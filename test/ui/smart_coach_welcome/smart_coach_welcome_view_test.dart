import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/reusable_comp/smart_coach_background_cuver.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/ui/smart_coach_welcome/smart_coach_welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget() => const MaterialApp(
        home: SmartCoachWelcomeView(),
      );

  group("SmartCoachWelcomeView Widget Tests", () {
    testWidgets("should display SmartCoachBackgroundCover", (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byType(SmartCoachBackgroundCover), findsOneWidget);
    });

    testWidgets("should display 4 Text widgets", (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byType(Text), findsNWidgets(4));
      expect(find.textContaining(AppStrings.hi), findsOneWidget);
      expect(find.text(AppStrings.iamYourSmartCoach), findsOneWidget);
      expect(find.text(AppStrings.howCanAssistYouToday), findsOneWidget);
      expect(find.text(AppStrings.getStarted), findsOneWidget);
    });

    testWidgets("should display robot image", (tester) async {
      await tester.pumpWidget(buildWidget());
      final imageFinder = find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              AssetsManager.imagesRobotChatWelocme);
      expect(imageFinder, findsOneWidget);
    });

    testWidgets("should display BlurredContainer", (tester) async {
      await tester.pumpWidget(buildWidget());
      expect(find.byType(BlurredContainer), findsOneWidget);
    });

    testWidgets("should display ElevatedButton with Get Started text",
        (tester) async {
      await tester.pumpWidget(buildWidget());
      final button = find.widgetWithText(ElevatedButton, AppStrings.getStarted);
      expect(button, findsOneWidget);
    });

    testWidgets("should navigate when Get Started button is tapped",
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: RouteManager.welcomeSmartCoachScreen,
          routes: {
            RouteManager.welcomeSmartCoachScreen: (context) =>
                const SmartCoachWelcomeView(),
            RouteManager.smartCoach: (context) =>
                const Scaffold(body: Text('Smart Coach Page')),
          },
        ),
      );

      await tester
          .tap(find.widgetWithText(ElevatedButton, AppStrings.getStarted));
      await tester.pumpAndSettle();
      expect(find.text('Smart Coach Page'), findsOneWidget);
    });
  });
}
