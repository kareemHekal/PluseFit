import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/home_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/core/utils/toast_message.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_intent.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'widgets/edit_profile_image.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackgroundCover(
      backIcon: BackIcon(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: AppStrings.editProfile,
      // ignore: prefer_const_constructors
      bodyWidget: BlocProvider(
        create: (_) =>
        getIt<EditProfileCubit>()
          ..doIntent(GetLoggedUserData()),
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is PhotoUploadFailure ||
                state is EditProfileFailure ||
                state is GetUserDataFailure) {
              Navigator.of(context, rootNavigator: true).pop();

              final message = switch (state) {
                EditProfileFailure s => s.message,
                GetUserDataFailure s => s.message,
                PhotoUploadFailure s => s.message,
                _ => "Something went wrong",
              };
              toastMessage(message: message, tybeMessage: TybeMessage.negative);
            }
            if (state is EditProfileSuccess ||
                state is GetUserDataSuccess ||
                state is PhotoUploadSuccess) {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteManager.loginScreen,
                    (route) => false,
              );
              toastMessage(
                  message: AppStrings.yourAccountHasBeenUpdatedSuccessfully,
                  tybeMessage: TybeMessage.positive);
              Navigator.pushNamed(context, RouteManager.loginScreen);
            }
            if (state is EditProfileLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: Center(
                      child: Lottie.asset(
                        AssetsManager.lottieLoading,
                        width: 150,
                        height: 150,
                        reverse: true,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            }
          },
          builder: (context, state) {
            final cubit = EditProfileCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: EditProfileImage(
                        // here take it from the cubit
                        imageUrl: '',
                        onTap: () {},
                      ),
                    ),
                    Center(
                        child: Text(
                            "${cubit.firstNameController.text} ${cubit
                                .lastNameController.text}",
                            style: AppTextStyle.extraBold20,
                            overflow: TextOverflow.clip)),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppStrings.firstName,
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                      ),
                      validator: Validator.firstName,
                      controller: cubit.firstNameController,
                      style: AppTextStyle.regular16.copyWith(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .tertiary),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppStrings.lastName,
                        prefixIcon: const Icon(Icons.person_outline_rounded),
                      ),
                      validator: Validator.lastName,
                      controller: cubit.lastNameController,
                      style: AppTextStyle.regular16.copyWith(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .tertiary),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: Validator.email,
                      controller: cubit.emailController,
                      style: AppTextStyle.regular16.copyWith(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .tertiary),
                    ),
                    // TapToEditWidget(
                    //   onTapToEdit: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => EditUserInfoPage(
                    //             body: WeightBody(
                    //               // here we can get the value from the user
                    //               initialValue: null,
                    //               onPressed: (int value) {},
                    //             ),
                    //           ),
                    //         ));
                    //   },
                    //   labelTap: "weight",
                    //   // here we can get the value from the user
                    //   value: 'Gain Weight',
                    // ),
                    // TapToEditWidget(
                    //   onTapToEdit: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => EditUserInfoPage(
                    //             body: GoalBody(
                    //                 // here we can get the value from the user from the cubit
                    //                 selectedGoal: selectedGoal,
                    //                 onSelectGoal: onSelectGoal,
                    //                 onNext: onNext),
                    //           ),
                    //         ));
                    //   },
                    //   labelTap: "Goal",
                    //   // here we can get the value from the user from the cubit
                    //   value: selectedGoal,
                    // ),
                    // TapToEditWidget(
                    //   onTapToEdit: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => EditUserInfoPage(
                    //             body: PhysicalActivityBody(
                    //                 // here we can get the value from the user from the cubit
                    //                 selectedLevel: selectedLevel,
                    //                 onSelect: onSelect,
                    //                 onNext: onNext),
                    //           ),
                    //         ));
                    //   },
                    //   labelTap: "Activity Level",
                    //   // here we can get the value from the user
                    //   value: 'Gain selectedLevel',
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
