import 'package:fit_zone/core/reusable_comp/auth_background_cuver.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/ui/edit_profile/view_model/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserInfoPage extends StatelessWidget {
  final Widget body;
  final EditProfileCubit cubit;

  const EditUserInfoPage({
    super.key,
    required this.body,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: AuthBackgroundCover(
        backIcon: BackIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bodyWidget: body,
      ),
    );
  }
}
