import 'package:cached_network_image/cached_network_image.dart';
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FitnessCard extends StatelessWidget {
  final String? title;
  final String? imgCover;
  final VoidCallback onTap;

  const FitnessCard({
    super.key,
    this.title,
    this.imgCover,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: imgCover ?? "",
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Skeletonizer(
                    enabled: true,
                    child: Container(
                      color: const Color.fromARGB(128, 0, 0, 0),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error_outline_rounded,
                    color: ColorManager.red,
                    size: 50,
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: ColorManager.black.withValues(alpha: 0.5),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
