import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  String hintText;
  bool isObscure;
  var validator;
  TextEditingController controller;
  Widget? suffixIcon;
  TextInputType keyboardType;
  String fieldText;

  AppTextFormField(
      {super.key,
      required this.hintText,
      this.isObscure = false,
      required this.validator,
      required this.controller,
      this.suffixIcon,
      required this.fieldText,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(fieldText,
                  style: const TextStyle(
                    color: Colors.white,
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TextFormField(
            keyboardType: keyboardType,
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
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: suffixIcon,
            ),
            style: const TextStyle(color: Colors.black),
            obscureText: isObscure,
            controller: controller,
            validator: validator,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
