import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_text_styles.dart';

class CartCounter extends StatefulWidget {
  int productCartCount;
  final Function(int) onCounterChanged;

  CartCounter(
      {super.key, required this.onCounterChanged, this.productCartCount = 1});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    void incrementCounter() {
      setState(() {
        widget.productCartCount++;
        widget.onCounterChanged(widget.productCartCount);
      });
    }

    void decrementCounter() {
      if (widget.productCartCount > 1) {
        setState(() {
          widget.productCartCount--;
          widget.onCounterChanged(widget.productCartCount);
        });
      }
    }

    return Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.delftBlue),
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
              size: 25.r,
            ),
          ),
          const Spacer(),
          Text(
            '${widget.productCartCount}',
            style:
                AppTextStyles.font14White,
          ),
          const Spacer(),
          GestureDetector(
            onTap: incrementCounter,
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 25.r,
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
