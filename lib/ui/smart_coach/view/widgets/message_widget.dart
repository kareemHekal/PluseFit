import 'dart:ffi';

import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:fit_zone/data/model/smart_coach/message_model.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;

  const MessageWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            message.isCoach ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (message.isCoach)
            const CircleAvatar(
              radius: 22,
              backgroundImage:
                  AssetImage(AssetsManager.imagesSmartCoachCoachImg),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Config.screenWidth! * 0.7),
              child: BlurredContainer(
                color: message.isCoach == false
                    ? Theme.of(context).colorScheme.primary
                    : null,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(message.isCoach ? 0 : 16),
                  topRight: Radius.circular(message.isCoach ? 16 : 0),
                  bottomLeft: const Radius.circular(16),
                  bottomRight: const Radius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    message.message,
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          if (!message.isCoach) ...[
            const SizedBox(width: 8),
            const Icon(Icons.person_2_outlined,
                color: ColorManager.primaryColor),
          ],
        ],
      ),
    );
  }
}
