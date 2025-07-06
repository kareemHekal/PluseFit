import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/toast_message.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_intent.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class EditUserInfoPage extends StatelessWidget {
  final Widget body;

  const EditUserInfoPage({
    super.key,
    required this.body,
  });

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
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteManager.registerScreen,
              (route) => false,
            );
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
          return AuthBackgroundCover(
            backIcon: BackIcon(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            bodyWidget: body,
          );
        },
      ),
    );
  }
}
