import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fit_zone/ui/splash_onboarding/on_boarding_screen.dart';
import 'package:fit_zone/ui/Auth/register/register_view.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('OnBoardingScreen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        child: Builder(
          builder: (context) => MaterialApp(
            locale: const Locale('en'),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: const OnBoardingScreen(),
            routes: {
              RouteManager.registerScreen: (context) => const RegisterView(),
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(AppStrings.onBoardingOne.tr()), findsOneWidget);

    await tester.tap(find.text(AppStrings.next.tr()));
    await tester.pumpAndSettle();
    expect(find.text(AppStrings.onBoardingTwo.tr()), findsOneWidget);

    await tester.tap(find.text(AppStrings.next.tr()));
    await tester.pumpAndSettle();
    expect(find.text(AppStrings.onBoardingThree.tr()), findsOneWidget);

    await tester.tap(find.text(AppStrings.back.tr()));
    await tester.pumpAndSettle();
    expect(find.text(AppStrings.onBoardingTwo.tr()), findsOneWidget);

    await tester.tap(find.text(AppStrings.skip.tr()));
    await tester.pumpAndSettle();
    expect(find.byType(RegisterView), findsOneWidget);
  });
}
