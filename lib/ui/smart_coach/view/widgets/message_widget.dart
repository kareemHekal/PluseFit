import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/assets_manager.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final bool isCoach;
  final String message;

  const MessageWidget({
    super.key,
    required this.isCoach,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isCoach ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isCoach)
            const CircleAvatar(
              radius: 22,
              backgroundImage:
                  AssetImage(AssetsManager.imagesSmartCoachCoachImg),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.7),
              child: BlurredContainer(
                color: isCoach == false ? Theme.of(context).primaryColor : null,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isCoach ? 0 : 16),
                  topRight: Radius.circular(isCoach ? 16 : 0),
                  bottomLeft: const Radius.circular(16),
                  bottomRight: const Radius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    message,
                    softWrap: true,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
          if (!isCoach) ...[
            const SizedBox(width: 8),
            const Icon(Icons.person_2_outlined,
                color: ColorManager.primaryColor),
          ],
        ],
      ),
    );
  }
}
