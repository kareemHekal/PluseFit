import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/domain/use_cases/register_usecase.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/complete_register_screen.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/gender_widget.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'complete_register_screen_test.mocks.dart';

@GenerateMocks([RegisterUseCase, CompleteRegisterCubit])
void main() {
  late MockRegisterUseCase mockRegisterUseCase;
  Widget buildWidget() => const MaterialApp(
        home: CompleteRegisterScreen(
          firstName: 'Test',
          lastName: 'User',
          email: 'test@example.com',
          password: '123456',
        ),
      );
  setUpAll(() {
    mockRegisterUseCase = MockRegisterUseCase();
    getIt.registerFactory<CompleteRegisterCubit>(
        () => CompleteRegisterCubit(mockRegisterUseCase));
  });

  group(
      "CompleteRegisterScreen UI Test for widgets whose visibility depends on view_model",
      () {
    testWidgets('check if background is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var authBackground = find.byType(AuthBackgroundCover);
      expect(authBackground, findsNWidgets(1));
    });
    testWidgets('check if Gender Icons is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var text = find.byType(GenderWidget);
      expect(text, findsNWidgets(2));
    });
    testWidgets('check if Texts is present', (tester) async {
      await tester.pumpWidget(buildWidget());
      var text = find.byType(Text);
      expect(text, findsNWidgets(6));
    });
  });
}
