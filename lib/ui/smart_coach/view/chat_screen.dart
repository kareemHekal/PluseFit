import 'package:fit_zone/core/di/di.dart';
import 'package:fit_zone/core/reusable_comp/back_icon.dart';
import 'package:fit_zone/core/reusable_comp/smart_coach_background_cuver.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:fit_zone/data/model/smart_coach/message_model.dart';
import 'package:fit_zone/ui/smart_coach/view_model/cubit/smart_coach_cubit.dart';
import 'package:fit_zone/ui/smart_coach/view_model/cubit/smart_coach_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'messages_list_view.dart';

class ChatScreen extends StatefulWidget {
  final ConversationModel? conversationModel;

  const ChatScreen({this.conversationModel, super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<SmartCoachCubit>();
        if (widget.conversationModel != null) {
          cubit.doIntent(
            LoadOldConversationIntent(conversation: widget.conversationModel!),
          );
        }
        return cubit;
      },
      child: Builder(
        builder: (context) {
          final cubit = SmartCoachCubit.get(context);

          return SmartCoachBackgroundCover(
            backIcon: BackIcon(
              onPressed: () {
                cubit.doIntent(AddConversation());
                Navigator.pop(context);
                // or navigate to the welcome screen
              },
            ),
            appBarTitle: Text(
              AppStrings.smartCoach,
              style: AppTextStyle.bold24,
            ),
            bodyWidget: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// here the list of messages
                  const Expanded(child: ChatMessagesList()),

                  /// here the part of the text field and the send button
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: AppStrings.typeYourMessage,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: _messageController.text.trim().isEmpty
                            ? null
                            : () {
                                cubit.doIntent(
                                  addMessageIntent(
                                    message: MessageModel(
                                      message: _messageController.text.trim(),
                                      isCoach: false,
                                    ),
                                  ),
                                );
                                _messageController.clear();
                              },
                        icon: const Icon(Icons.send),
                        color: _messageController.text.trim().isEmpty
                            ? Colors.white
                            : Colors.orange,
                        disabledColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
