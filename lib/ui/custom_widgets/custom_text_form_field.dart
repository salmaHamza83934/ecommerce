import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool isObsecure;
  var validator;
  var controller;
  var suffixIcon;
  var keyboardtype;
  String fieldText;
  CustomTextFormField({required this.hintText,this.isObsecure=false,required this.validator,
    required this.controller,this.suffixIcon,required this.fieldText,this.keyboardtype=TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          child: Align(alignment: Alignment.topLeft,child: Text(fieldText,style: TextStyle(color: Colors.white,))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          child: TextFormField(
            keyboardType: keyboardtype,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                hintText:hintText,
                hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: suffixIcon,
            ),
            style: TextStyle(color: Colors.black),
            obscureText: isObsecure,
            controller: controller,
            validator: validator,
          ),
        ),
        SizedBox(height: 16,),
      ],
    );
  }
}
