import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/ui/Auth/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildWidget() => const MaterialApp(home: RegisterView());
  setUpAll(() async {
    // getIt.registerFactory(() => AuthCubit());
  });
  group("test register view show items", () {
    testWidgets('check if background is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var authBackground = find.byType(AuthBackgroundCover);
      expect(authBackground, findsNWidgets(1));
    });
    testWidgets('check if Texts is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var text = find.byType(Text);
      expect(text, findsNWidgets(10));
    });

    testWidgets('check if TextField is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var textFeilds = find.byType(TextFormField);
      expect(textFeilds, findsNWidgets(4));
    });

    testWidgets('check if Buttons is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var elevatedButton = find.byType(ElevatedButton);
      var textButton = find.byType(TextButton);
      expect(elevatedButton, findsNWidgets(1));
      expect(textButton, findsNWidgets(1));
    });
    testWidgets('check if blulred container is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var blurredContainer = find.byType(BlurredContainer);
      expect(blurredContainer, findsNWidgets(1));
    });
  });

  group(
    "form filed validation on user input",
    () {
      testWidgets("error message appear when email is not valid",
          (tester) async {
        await tester.pumpWidget(buildWidget());
        await tester.enterText(find.byKey(const ValueKey('email')), "jon");
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();
        var errorMessage = find.text(AppStrings.enterValidEmailAddress);
        expect(errorMessage, findsOneWidget);
      });

      testWidgets("don't error message appear when email is valid",
          (tester) async {
        await tester.pumpWidget(buildWidget());
        await tester.enterText(
            find.byKey(const ValueKey('email')), "jondsada12@gmail.com");
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();
        var errorMessage = find.text(AppStrings.enterValidEmailAddress);
        expect(errorMessage, findsNothing);
      });

      testWidgets(
          "error message appear when First name or last name is not valid",
          (tester) async {
        await tester.pumpWidget(buildWidget());
        await tester.enterText(find.byKey(const ValueKey('lastName')),
            "adadadadadadadadadaadasdadaadad");
        await tester.enterText(find.byKey(const ValueKey('firstName')),
            "adadadadadadadadadaadasdadaadad");
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();
        var lastNameErrorMessage =
            find.text(AppStrings.lastNameCannotBeMoreThan20Characters);
        var firstNameErrorMessage =
            find.text(AppStrings.firstNameCannotBeMoreThan20Characters);

        expect(lastNameErrorMessage, findsOneWidget);

        expect(firstNameErrorMessage, findsOneWidget);
      });
      testWidgets(
          "don't  error message appear when First name or last name is valid",
          (tester) async {
        await tester.pumpWidget(buildWidget());
        await tester.enterText(find.byKey(const ValueKey('lastName')), "emad");
        await tester.enterText(
            find.byKey(const ValueKey('firstName')), "ahmed");
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();
        var lastNameErrorMessage =
            find.text(AppStrings.lastNameCannotBeMoreThan20Characters);
        var firstNameErrorMessage =
            find.text(AppStrings.firstNameCannotBeMoreThan20Characters);

        expect(lastNameErrorMessage, findsNothing);

        expect(firstNameErrorMessage, findsNothing);
      });

      testWidgets(" error message appear when password is valid",
          (tester) async {
        await tester.pumpWidget(buildWidget());
        await tester.enterText(find.byKey(const ValueKey('password')), "adad");
        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();
        var errorMessage1 =
            find.text(AppStrings.passwordMustBeAtLeast6Characters);
        // var errorMessage2 = (AppStrings.passwordMustContainAtLeastOneNumber);
        // var errorMessage3 =
        //     find.text(AppStrings.passwordMustContainAtLeastOneSpecialCharacter);
        // var errorMessage4 =
        //     find.text(AppStrings.passwordMustContainAtLeastOneUppercaseLetter);
        expect(errorMessage1, findsOneWidget);
      });
    },
  );
}
