import 'package:fit_zone/core/reusable_comp/blurred_container.dart';
import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/triangle.dart';
import 'package:fit_zone/ui/Auth/complete_register/view/widgets/wheel_slider.dart';
import 'package:flutter/material.dart';

class WeightBody extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onPressed;

  const WeightBody({
    super.key,
    required this.initialValue,
    required this.onPressed,
  });

  @override
  State<WeightBody> createState() => _WeightBodyState();
}

class _WeightBodyState extends State<WeightBody> {
  late int scrollValue;

  @override
  void initState() {
    super.initState();

    scrollValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.whatIsYourWeight,
                  style: AppTextStyle.extraBold20,
                ),
                Text(
                  AppStrings.thisHelpsUsCreateYourPersonalizedPlan,
                  style: AppTextStyle.regular18,
                ),
              ],
            ),
          ),
          BlurredContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    AppStrings.kg,
                    style: AppTextStyle.semiBold16.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  CustomWheelSlider(
                    initialValue: scrollValue,
                    totalCount: 250,
                    onChanged: (val) {
                      setState(() {
                        scrollValue = val;
                      });
                    },
                  ),
                  const Triangle(size: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onPressed(scrollValue);
                      },
                      child: Text(AppStrings.save),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
