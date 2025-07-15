import 'package:cached_network_image/cached_network_image.dart';
 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/text_style_manager.dart';
import '../../../../data/model/exercise_by_muscle/muscle_exercises.dart';

class ExerciseWidget extends StatelessWidget {
  final Exercises exercises;
  const ExerciseWidget(this.exercises, {super.key});

  String? getYoutubeThumbnail(String? url) {
    if (url == null) return null;
    Uri uri = Uri.parse(url);
    String? videoId;

    if (uri.host.contains("youtu.be")) {
      videoId = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
    } else if (uri.host.contains("youtube.com")) {
      videoId = uri.queryParameters["v"];
    }

    return videoId != null
        ? "https://img.youtube.com/vi/$videoId/0.jpg"
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = getYoutubeThumbnail(exercises.shortYoutubeDemonstrationLink);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.backgroundColorr,
        borderRadius: BorderRadius.circular(20),
      ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: thumbnailUrl ?? "",
                  height: 88,
                  width: 70,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Image.asset("assets/images/exr.png", fit: BoxFit.cover),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
              const SizedBox(width: 12),
              // النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercises.exercise ?? "",
                      style: AppTextStyle.regular18.copyWith(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exercises.difficultyLevel ?? "",
                      style: AppTextStyle.regular12,
                    ),
                    Text(
                      exercises.targetMuscleGroup ?? "",
                      style: AppTextStyle.regular12,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  final url =exercises.inDepthYoutubeExplanationLink??"https://www.mohp.gov.eg"; // موقع وزارة الصحة المصرية
                  final uri = Uri.parse(url);
                  debugPrint("View More tapped");
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    debugPrint("Could not launch $url");
                  }
                },
                icon:const Icon(Icons.play_circle,
                    color: ColorManager.secondaryColor, size: 36),
              ),
              // أيقونة تشغيل الفيديو

            ],
          ),
        )

    );
  }
}
