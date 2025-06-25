// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/toast_message.dart';
import 'package:fit_zone/ui/Auth/login/viewmodel/login_cubit.dart';
import 'package:fit_zone/ui/Auth/login/viewmodel/login_intent.dart';
import 'package:fit_zone/ui/Auth/login/viewmodel/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/cache/shared_pref.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundCover(
      bodyWidget: Center(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginError) {
              toastMessage(
                  message: state.message, tybeMessage: TybeMessage.negative);
            } else if (state is LoginSuccess) {
              await CacheHelper.setData(
                  'user', json.encode(state.user.toJson()));
              Navigator.of(context)
                  .pushReplacementNamed(RouteManager.mainScreen);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: BlurredContainer(
                  borderRadius: BorderRadius.circular(32),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 32),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Hey There',
                            style: AppTextStyle.medium16,
                          ),
                          Text(
                            'WELCOME BACK',
                            style: AppTextStyle.bold18,
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Login',
                            style: AppTextStyle.bold20,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: _emailController,
                            validator: Validator.email,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            validator: Validator.password,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(_obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget Password ?',
                                style: AppTextStyle.medium12.copyWith(
                                  color: ColorManager.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Or', style: AppTextStyle.medium12),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _SocialIconButton(
                                icon: Icons.facebook,
                                onTap: () {},
                              ),
                              const SizedBox(width: 16),
                              _SocialIconButton(
                                icon: Icons.g_mobiledata,
                                onTap: () {},
                              ),
                              const SizedBox(width: 16),
                              _SocialIconButton(
                                icon: Icons.apple,
                                onTap: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  BlocProvider.of<LoginCubit>(context).doIntent(
                                    LoginIntent(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: Text('Login', style: AppTextStyle.bold16),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dont Have An Account Yet ? ",
                                style: AppTextStyle.medium12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, RouteManager.registerScreen);
                                },
                                child: Text(
                                  'Register',
                                  style: AppTextStyle.bold12.copyWith(
                                    color: ColorManager.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
        ),
        child: Icon(icon, color: ColorManager.primaryColor, size: 28),
      ),
    );
  }
}
