import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  String hintText;
  bool isObscure;
  String? Function(String?) validator;
  TextEditingController controller;
  Widget? suffixIcon;
  TextInputType keyboardType;
  String fieldText;

  AppTextFormField({super.key,
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(fieldText,
                style: AppTextStyles.font16DelftBlue,)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TextFormField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: const OutlineInputBorder(),
              hintText: hintText,
              hintStyle: AppTextStyles.font16DelftBlue.copyWith(
                  color: AppColors.slateGrey),
              suffixIcon: suffixIcon,
            ),
            style: AppTextStyles.font16DelftBlue.copyWith(
                color: AppColors.delftBlue),
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
