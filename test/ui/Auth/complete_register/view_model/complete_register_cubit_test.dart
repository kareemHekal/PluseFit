import 'package:bloc_test/bloc_test.dart';
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/data/model/register_response/register_response.dart';
import 'package:fit_zone/data/model/register_response/register_user_model.dart';
import 'package:fit_zone/data/model/register_response/user_model.dart';
import 'package:fit_zone/domain/use_cases/register_usecase.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_cubit.dart';
import 'package:fit_zone/ui/Auth/complete_register/view_model/complete_register_intent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

void main() {
  late CompleteRegisterCubit cubit;
  late MockRegisterUseCase mockUseCase;

  setUpAll(() {
    registerFallbackValue(RegisterUserModel());
  });

  setUp(() {
    mockUseCase = MockRegisterUseCase();
    cubit = CompleteRegisterCubit(mockUseCase);
  });

  final dummyUserModel = RegisterUserModel(
    email: 'test@example.com',
    password: '123456',
    firstName: 'Ahmed',
    lastName: 'Ali',
    age: 25,
    height: 170,
    weight: 70,
    activityLevel: 'medium',
    goal: 'fitness',
  );

  final dummyResponse = RegisterResponse(
      message: "Registered",
      token: "xyz",
      user: UserModel(
        email: dummyUserModel.email,
        firstName: dummyUserModel.firstName,
        lastName: dummyUserModel.lastName,
        age: dummyUserModel.age,
        height: dummyUserModel.height,
        weight: dummyUserModel.weight,
        activityLevel: dummyUserModel.activityLevel,
        goal: dummyUserModel.goal,
      ));

  group('CompleteRegisterCubit', () {
    blocTest<CompleteRegisterCubit, RegisterStates>(
      'emits [UserUpdated] when UpdateUserIntent is dispatched',
      build: () => cubit,
      act: (cubit) {
        cubit.doIntent(UpdateUserIntent(
          email: dummyUserModel.email,
          password: dummyUserModel.password,
          firstName: dummyUserModel.firstName,
          lastName: dummyUserModel.lastName,
        ));
      },
      expect: () => [UserUpdated()],
    );

    blocTest<CompleteRegisterCubit, RegisterStates>(
      'emits [RegisterLoadingState, RegisterSuccessState] when _register() succeeds',
      build: () {
        cubit.user = dummyUserModel;
        when(() => mockUseCase.invoke(userModel: any(named: "userModel")))
            .thenAnswer(
                (_) async => SuccessApiResult<RegisterResponse>(dummyResponse));
        cubit.currentIndex = 6;
        return cubit;
      },
      act: (cubit) => cubit.doIntent(UpdateIndex(isBackButton: false)),
      expect: () => [
        RegisterLoadingState(),
        RegisterSuccessState(response: dummyResponse),
      ],
    );

    blocTest<CompleteRegisterCubit, RegisterStates>(
      'emits [RegisterLoadingState, RegisterErrorState] when _register() fails',
      build: () {
        cubit.user = dummyUserModel;
        when(() => mockUseCase.invoke(userModel: any(named: "userModel")))
            .thenAnswer((_) async => ErrorApiResult(Exception("API error")));
        cubit.currentIndex = 6;
        return cubit;
      },
      act: (cubit) => cubit.doIntent(UpdateIndex(isBackButton: false)),
      expect: () => [
        RegisterLoadingState(),
        isA<RegisterErrorState>(),
      ],
    );

    blocTest<CompleteRegisterCubit, RegisterStates>(
      'emits [IndexUpdated] when currentIndex < 6 and forward',
      build: () {
        cubit.currentIndex = 2;
        return cubit;
      },
      act: (cubit) => cubit.doIntent(UpdateIndex(isBackButton: false)),
      expect: () => [IndexUpdated()],
    );

    blocTest<CompleteRegisterCubit, RegisterStates>(
      'emits [ExitScreen] when currentIndex == 1 and back button pressed',
      build: () {
        cubit.currentIndex = 1;
        return cubit;
      },
      act: (cubit) => cubit.doIntent(UpdateIndex(isBackButton: true)),
      expect: () => [ExitScreen()],
    );
  });
}
