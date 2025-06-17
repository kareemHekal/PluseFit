import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/complete_register_screen.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void Function()? registerPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompleteRegisterScreen(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
                password: _passwordController.text),
          ));
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundCover(
      bodyWidget: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Config.spaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppStrings.heyThere,
                  style: AppTextStyle.regular18
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppStrings.createAnAccount,
                  style: AppTextStyle.extraBold20
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              Config.spaceSmall,
              Center(
                  child: BlurredContainer(
                      borderRadius: BorderRadius.circular(32),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.all(16),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              spacing: 16,
                              children: [
                                Center(
                                  child: Text(AppStrings.register,
                                      style: AppTextStyle.extraBold24.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: AppStrings.firstName,
                                    prefixIcon: const Icon(
                                        Icons.person_outline_rounded),
                                  ),
                                  validator: Validator.firstName,
                                  controller: _firstNameController,
                                  style: AppTextStyle.regular16.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: AppStrings.lastName,
                                    prefixIcon: const Icon(
                                        Icons.person_outline_rounded),
                                  ),
                                  validator: Validator.lastName,
                                  controller: _lastNameController,
                                  style: AppTextStyle.regular16.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                  validator: Validator.email,
                                  controller: _emailController,
                                  style: AppTextStyle.regular16.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: AppStrings.password,
                                    prefixIcon:
                                        const Icon(Icons.lock_outline_rounded),
                                    suffixIcon: IconButton(
                                      icon: _obscureText
                                          ? const Icon(
                                              Icons.visibility_off_outlined)
                                          : const Icon(
                                              Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: Validator.password,
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  style: AppTextStyle.regular16.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                ),
                                Config.spaceSmall,
                                ElevatedButton(
                                    onPressed: () {
                                      registerPressed();
                                    },
                                    child: Text(AppStrings.register)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(AppStrings.alreadyHaveAnAccount,
                                        style: AppTextStyle.regular14.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary)),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              RouteManager.loginScreen);
                                        },
                                        child: Text(
                                          AppStrings.login,
                                          style: AppTextStyle.extraBold14
                                              .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
