import 'dart:ui';

import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/smart_coach/view_model/cubit/smart_coach_cubit.dart';
import 'package:fit_zone/ui/smart_coach/view_model/cubit/smart_coach_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'conversation_widget.dart';

class SmartCoachDrawer extends StatefulWidget {
  const SmartCoachDrawer({super.key});

  @override
  State<SmartCoachDrawer> createState() => _SmartCoachDrawerState();
}

class _SmartCoachDrawerState extends State<SmartCoachDrawer> {
  @override
  void initState() {
    super.initState();
    final cubit = SmartCoachCubit.get(context);
    if (cubit.state is! ConversationsLoaded) {
      cubit.doIntent(GetAllConversations());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: BlocBuilder<SmartCoachCubit, SmartCoachState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Text(
                          AppStrings.previousConversations,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: ColorManager.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      color: ColorManager.primaryColor,
                      thickness: 2,
                      indent: 16,
                      endIndent: 16,
                    ),
                    const SizedBox(height: 8),
                    if (state is ConversationsLoaded)
                      Expanded(
                        child: state.conversations.isEmpty
                            ? Center(
                                child: Text(
                                  AppStrings.noSavedConversations,
                                  style: AppTextStyle.regular16
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8),
                                child: ListView.separated(
                                  itemCount: state.conversations.length,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  itemBuilder: (context, index) {
                                    return ConversationWidget(
                                      conversationModel:
                                          state.conversations[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Divider(
                                        color: Colors.white, thickness: 0.5),
                                  ),
                                )),
                      )
                    else
                      const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
