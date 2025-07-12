import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
 class CategoryWidget extends StatefulWidget {
   final String category;
   final  bool isSelected;
    const CategoryWidget({super.key, required this.category, this. isSelected=false});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container (
      width: 100,
      height: 30,
      decoration: BoxDecoration(
          color: widget.isSelected?Theme.of(context).colorScheme.primary:ColorManager.backgroundColor,
          borderRadius: BorderRadius.circular(30),

      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(widget.category,style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color:ColorManager.white,
        ),),
      ),
    );
  }
}