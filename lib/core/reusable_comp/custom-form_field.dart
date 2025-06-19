
import 'package:fit_zone/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

import '../utils/text_style_manager.dart';


class CustomFormField extends StatelessWidget {
  String title;
  String hintText;
  TextInputType keyboard;
  TextEditingController controller;
  String? Function(String?)? validator;
  int maxLength;
  bool obsecureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
   CustomFormField({super.key,required this.title,required this.hintText,required this.keyboard,required this.controller,required this.validator,required this.maxLength,  this.obsecureText=false,this.prefixIcon,this.suffixIcon});


  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
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
         prefixStyle: TextStyle(
           fontSize: 10,
         ),
         label:  Text(title,style: AppTextStyle.regular12.copyWith(color: ColorManager.white70)),

          //hintText:hintText ,

           border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
          disabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.white70,width: 1,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
