import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class LoginBackgroundCircles extends StatelessWidget {
  const LoginBackgroundCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -20,
          left: -50,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.magentaHaze.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          top: 50,
          right: -20,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.aliceBlue.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -70,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.frenchGrey.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
