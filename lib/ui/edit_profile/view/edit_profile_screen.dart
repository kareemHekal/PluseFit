import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/home_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/core/utils/toast_message.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/goal.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/physical_activity_body.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/body/weight_body.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_intent.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'edit_user_info_page.dart';
import 'widgets/edit_profile_image.dart';
import 'widgets/tap_to_edit_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditProfileCubit>()..doIntent(GetLoggedUserData()),
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
          if (state is EditProfileSuccess || state is PhotoUploadSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            toastMessage(
                message: AppStrings.yourAccountHasBeenUpdatedSuccessfully,
                tybeMessage: TybeMessage.positive);
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
          var cubit = EditProfileCubit.get(context);

          return HomeBackgroundCover(
              backIcon: BackIcon(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteManager.mainScreen);
                },
              ),
              title: AppStrings.editProfile,
              bodyWidget: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: EditProfileImage(
                                imageUrl: cubit.editProfileModel?.photo ?? '',
                                onTap: () {
                                  cubit.doIntent(PickImage());
                                },
                              ),
                            ),
                            Center(
                                child: Text(
                                    "${cubit.editProfileModel?.firstName ?? ''} ${cubit.editProfileModel?.lastName ?? ''}",
                                    style: AppTextStyle.extraBold20,
                                    overflow: TextOverflow.clip)),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: AppStrings.firstName,
                                prefixIcon:
                                    const Icon(Icons.person_outline_rounded),
                              ),
                              validator: Validator.firstName,
                              controller: cubit.firstNameController,
                              style: AppTextStyle.regular16.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: AppStrings.lastName,
                                prefixIcon:
                                    const Icon(Icons.person_outline_rounded),
                              ),
                              validator: Validator.lastName,
                              controller: cubit.lastNameController,
                              style: AppTextStyle.regular16.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: AppStrings.email,
                                prefixIcon: const Icon(Icons.email_outlined),
                              ),
                              validator: Validator.email,
                              controller: cubit.emailController,
                              style: AppTextStyle.regular16.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                            ),
                            TapToEditWidget(
                              onTapToEdit: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditUserInfoPage(
                                        cubit: cubit,
                                        body: WeightBody(
                                            initialValue: cubit
                                                    .editProfileModel?.weight ??
                                                0,
                                            onPressed: (int value) {
                                              cubit.editProfileModel?.weight =
                                                  value;
                                              cubit.doIntent(
                                                  UpdateProfileIntent());
                                              Navigator.pop(context);
                                            }),
                                      ),
                                    ));
                              },
                              labelTap: AppStrings.weight,
                              // here we can get the value from the user from the cubit
                              // here we can get the value from the user
                              value:
                                  cubit.editProfileModel?.weight.toString() ??
                                      "",
                            ),
                            TapToEditWidget(
                              onTapToEdit: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditUserInfoPage(
                                        cubit: cubit,
                                        body: GoalBody(
                                          // here we can get the value from the user from the cubit
                                          selectedGoal:
                                              cubit.editProfileModel?.goal,
                                          onSelectGoal: (value) {
                                            cubit.editProfileModel?.goal =
                                                value;
                                            cubit.doIntent(
                                                UpdateProfileIntent());
                                            Navigator.pop(context);
                                          },
                                          onNext: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ));
                              },
                              labelTap: AppStrings.goal,
                              // here we can get the value from the user from the cubit
                              value: cubit.editProfileModel?.goal ?? "",
                            ),
                            TapToEditWidget(
                              onTapToEdit: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditUserInfoPage(
                                        cubit: cubit,
                                        body: PhysicalActivityBody(
                                          // here we can get the value from the user from the cubit
                                          selectedLevel: cubit
                                              .editProfileModel?.activityLevel,
                                          onSelect: (value) {
                                            cubit.editProfileModel
                                                ?.activityLevel = value;
                                            cubit.doIntent(
                                                UpdateProfileIntent());
                                            Navigator.pop(context);
                                          },
                                          onNext: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ));
                              },
                              labelTap: AppStrings.activityLevel,
                              // here we can get the value from the user
                              value:
                                  cubit.editProfileModel?.activityLevel ?? "",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.doIntent(UpdateProfileIntent());
                          },
                        child: Text(AppStrings.save,
                            style: AppTextStyle.regular16),
                      ),
                      ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
