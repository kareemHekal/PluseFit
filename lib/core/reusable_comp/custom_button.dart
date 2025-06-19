import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:fit_zone/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
   final Color backgroundColor;
  final String title;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
     this.backgroundColor = ColorManager.primaryColor, // لون افتراضي
  });

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: height*0.05,
       child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(title,style: AppTextStyle.bold14.copyWith(color: Colors.white),),
      ),
    );
  }
}
