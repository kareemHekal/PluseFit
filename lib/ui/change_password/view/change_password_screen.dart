import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/reusable_comp/auth_background_cuver.dart';
import '../../../core/reusable_comp/back_icon.dart';
import '../../../core/reusable_comp/validator.dart';
import '../../../core/utils/string_manager.dart';
import '../../../core/utils/toast_message.dart';
import '../view_model/change_password_cubit.dart';
import '../view_model/change_password_intent.dart';
import '../view_model/change_password_state.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          toastMessage(
            message: state.message,
            tybeMessage: TybeMessage.positive,
          );
          // Navigator.pop(context);
        } else if (state is ChangePasswordFailure) {
          toastMessage(
            message: state.message,
            tybeMessage: TybeMessage.negative,
          );
        }
      },
      child: AuthBackgroundCover(
        backIcon: BackIcon(
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            RouteManager.mainScreen,
            arguments: {'tabIndex': 3},
          ),
        ),
        bodyWidget: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: currentPasswordController,
                  decoration: InputDecoration(
                    labelText: AppStrings.currentPassword,
                    hintText: AppStrings.enterYourPassword,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  validator: Validator.password,
                  // labelText: AppStrings.currentPassword,
                  // hintText: AppStrings.enterYourPassword,
                  // obscureText: true,
                  // validator: (value) =>
                  //     value?.isEmpty == true ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    labelText: AppStrings.newPassword,
                    hintText: AppStrings.enterYourNewPassword,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  validator: Validator.password,
                  // labelText: AppStrings.newPassword,
                  // hintText: AppStrings.enterYourNewPassword,
                  // obscureText: true,
                  // validator: (value) =>
                  //     value?.isEmpty == true ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: AppStrings.confirmPassword,
                    hintText: AppStrings.confirmPassword,
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  validator: (value) => Validator.confirmPassword(
                      value, newPasswordController.text),
                  // labelText: AppStrings.confirmPassword,
                  // hintText: AppStrings.confirmPassword,
                  // obscureText: true,
                  // validator: (value) {
                  //   if (value?.isEmpty == true) return 'Required';
                  //   if (value != newPasswordController.text) {
                  //     return AppStrings.passwordsDoNotMatch;
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is ChangePasswordLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ChangePasswordCubit>().onIntent(
                                        ChangePasswordRequestIntent(
                                          currentPassword:
                                              currentPasswordController.text,
                                          newPassword:
                                              newPasswordController.text,
                                        ),
                                      );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: state is ChangePasswordLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                AppStrings.change,
                                style: const TextStyle(color: Colors.white),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
