// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/dialogs.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/routes_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/toast_message.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_cubit.dart';
import 'package:fit_zone/ui/Auth/view_model/cubit/auth_intent.dart';
import 'package:fit_zone/ui/main_screen/profile_screen/view_model/profile_cubit.dart';
import 'package:fit_zone/ui/main_screen/profile_screen/view_model/profile_intent.dart';
import 'package:fit_zone/ui/main_screen/profile_screen/view_model/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt())..doIntent(LoadProfileIntent()),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            final profile = state.profile;
            return Stack(
              children: [
                // Main content
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                AppStrings.profile,
                                style: const TextStyle(
                                  color: ColorManager.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      CircleAvatar(
                        radius: 54,
                        backgroundImage:
                            profile.photo != null && profile.photo!.isNotEmpty
                                ? NetworkImage(profile.photo!)
                                : const AssetImage(
                                        'assets/images/icon/useravatar.png')
                                    as ImageProvider,
                        backgroundColor: ColorManager.grey,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${profile.firstName ?? ''} ${profile.lastName ?? ''}',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white),
                      ),
                      const SizedBox(height: 24),
                      _ProfileMenu(
                          orange: ColorManager.primaryColor,
                          email: profile.email),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is ProfileError) {
            return Center(
                child: Text(state.message,
                    style: const TextStyle(color: ColorManager.red)));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _ProfileMenu extends StatefulWidget {
  final Color orange;
  final String? email;

  const _ProfileMenu({required this.orange, this.email});

  @override
  State<_ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<_ProfileMenu> {
  bool isEnglish = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isEnglish = context.locale.languageCode == 'en';
  }

  void _toggleLanguage() async {
    setState(() {
      isEnglish = !isEnglish;
    });
    await context.setLocale(Locale(isEnglish ? 'en' : 'ar'));
  }

  @override
  Widget build(BuildContext context) {
    final orange = widget.orange;
    final menuItems = [
      _MenuItem(
        icon: Icons.edit,
        label: AppStrings.editProfile,
        onTap: () {
          Navigator.pushReplacementNamed(
              context, RouteManager.editProfileScreen);
        },
        orange: orange,
      ),
      _MenuItem(
        assetIcon: 'assets/images/profile_icons/changepassword.png',
        label: AppStrings.changePassword,
        onTap: () {
          Navigator.pushReplacementNamed(
              context, RouteManager.changePasswordScreen);
        },
        orange: orange,
      ),
      _MenuItem(
        assetIcon: 'assets/images/profile_icons/changelanguage.png',
        label:
            '${AppStrings.selectLanguage} (${isEnglish ? 'English' : 'العربية'})',
        onTap: _toggleLanguage,
        orange: orange,
        trailing: Switch(
          value: isEnglish,
          onChanged: (val) => _toggleLanguage(),
          activeColor: orange,
        ),
      ),
      _MenuItem(
        assetIcon: 'assets/images/profile_icons/security.png',
        label: AppStrings.security,
        onTap: () {},
        orange: orange,
      ),
      _MenuItem(
        assetIcon: 'assets/images/profile_icons/privacypolicy.png',
        label: AppStrings.privacyPolicy,
        onTap: () {},
        orange: orange,
      ),
      _MenuItem(
        assetIcon: 'assets/images/profile_icons/Help.png',
        label: AppStrings.help,
        onTap: () {},
        orange: orange,
      ),
      BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LogoutLoadingState) {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
            );
          }

          if (state is LogoutSuccessState) {
            toastMessage(
              message: "Logout Successfully, Back to login",
              tybeMessage: TybeMessage.positive,
            );

            Future.delayed(const Duration(seconds: 2), () {
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteManager.loginScreen,
                  (route) => false,
                );
              }
            });
          }

          if (state is LogoutFailureState) {
            Navigator.pop(context);
            toastMessage(
              message: "Error : ${state.message}",
              tybeMessage: TybeMessage.negative,
            );
          }
        },
        child: _MenuItem(
          assetIcon: 'assets/images/profile_icons/logout.png',
          label: AppStrings.logout,
          onTap: () {
            Dialogs.confirmLogout(
              context,
              () => Navigator.pop(context),
              () => context.read<AuthCubit>().doIntent(LogoutIntent()),
            );
          },
          orange: orange,
          isLogout: true,
        ),
      ),
    ];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ColorManager.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: menuItems.map((item) => item).toList(),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData? icon;
  final String? assetIcon;
  final String label;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color orange;
  final bool isLogout;

  const _MenuItem({
    this.icon,
    this.assetIcon,
    required this.label,
    required this.onTap,
    this.trailing,
    required this.orange,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(icon, color: orange, size: 26)
          : assetIcon != null
              ? Image.asset(assetIcon!, width: 26, height: 26)
              : null,
      title: Text(
        label,
        style: TextStyle(
          color: isLogout ? orange : Colors.white,
          fontSize: 16,
          fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing:
          trailing ?? Icon(Icons.arrow_forward_ios, color: orange, size: 18),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      shape:
          const Border(bottom: BorderSide(color: Colors.white12, width: 0.5)),
    );
  }
}
