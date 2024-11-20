import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';

class ProductCounter extends StatefulWidget {
  final Function(int) onCounterChanged;

  const ProductCounter(this.onCounterChanged, {super.key});

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    void incrementCounter() {
      setState(() {
        counter++;
        widget.onCounterChanged(counter);
      });
    }

    void decrementCounter() {
      if (counter > 1) {
        setState(() {
          counter--;
          widget.onCounterChanged(counter);
        });
      }
    }

    return Container(
      width: 130.w,
      height: 45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.magentaHaze),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: decrementCounter,
            child: Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
              size: 30.r,
            ),
          ),
          const Spacer(),
          Text(
            '$counter',
            style: AppTextStyles.font16DelftBlue.copyWith(color: Colors.white),
          ),
          const Spacer(),
          GestureDetector(
            onTap: incrementCounter,
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 30.r,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
    );
  }
}
