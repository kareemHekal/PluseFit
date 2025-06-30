import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/data/model/smart_coach/conversation_model.dart';
import 'package:fit_zone/ui/smart_coach/view/chat_screen.dart';
import 'package:flutter/material.dart';

class ConversationWidget extends StatelessWidget {
  final ConversationModel conversationModel;

  const ConversationWidget({required this.conversationModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatScreen(conversationModel: conversationModel),
          ),
          (route) => false,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Spacer(),
          Expanded(
            child: Text(
              conversationModel.title,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.bold20,
            ),
          ),
        ],
      ),
    );
  }
}
