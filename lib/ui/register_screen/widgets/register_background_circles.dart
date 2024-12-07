import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class RegisterBackgroundCircles extends StatelessWidget {
  const RegisterBackgroundCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
         // Background circles
         Positioned(
           top: -20,
           right: -50,
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
           left: -20,
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
           top: 70,
           right: -80,
           child: Container(
             height: 150,
             width: 150,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: AppColors.delftBlue.withOpacity(0.5),
             ),
           ),
         ),
         Positioned(
           bottom: 0,
           right: -60,
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
