import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/home_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/validator.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

import 'widgets/edit_profile_image.dart';
import 'widgets/tap_to_edit_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
      bodyWidget: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: EditProfileImage(
                  imageUrl: '',
                  onTap: () {},
                ),
              ),
              Center(
                  child: Text("whole Name", style: AppTextStyle.extraBold20)),
              TextFormField(
                key: const ValueKey('firstName'),
                decoration: InputDecoration(
                  labelText: AppStrings.firstName,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                ),
                validator: Validator.firstName,
                controller: _firstNameController,
                style: AppTextStyle.regular16
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              TextFormField(
                key: const ValueKey('lastName'),
                decoration: InputDecoration(
                  labelText: AppStrings.lastName,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                ),
                validator: Validator.lastName,
                controller: _lastNameController,
                style: AppTextStyle.regular16
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                validator: Validator.email,
                controller: _emailController,
                style: AppTextStyle.regular16
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              TapToEditWidget(
                onTapToEdit: () {},
                labelTap: "weight",
                // here we can get the value from the user
                value: 'Gain Weight',
              ),
              TapToEditWidget(
                onTapToEdit: () {},
                labelTap: "Goal",
                // here we can get the value from the user
                value: 'Gain Weight',
              ),
              TapToEditWidget(
                onTapToEdit: () {},
                labelTap: "Activity Level",
                // here we can get the value from the user
                value: 'Gain Weight',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
