
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../utils/text_style_manager.dart';


class CustomFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLength;
  final  bool obsecureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
   const CustomFormField({super.key,required this.title,required this.hintText,required this.keyboard,required this.controller,required this.validator,required this.maxLength,  this.obsecureText=false,this.prefixIcon,this.suffixIcon});


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height*0.07,
      child: TextFormField(

        cursorColor: Colors.white,
        keyboardType:keyboard ,
        validator: validator,
        controller: controller,
        maxLength:maxLength ,
        obscureText: obsecureText,
         decoration: InputDecoration(
          prefixIcon: prefixIcon,
         suffixIcon: suffixIcon,
         prefixStyle: const TextStyle(
           fontSize: 10,
         ),
         label:  Text(title,style: AppTextStyle.regular12.copyWith(color: ColorManager.white70)),

          //hintText:hintText ,

           border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
