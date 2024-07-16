import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCounter extends StatefulWidget {
  int productCartCount;
  final Function(int) onCounterChanged;

  CartCounter({required this.onCounterChanged,this.productCartCount=1});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
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
          color: theme.primaryColor),
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
          Spacer(),
          Text(
            '${widget.productCartCount}',
            style: theme.textTheme.bodyMedium!
                .copyWith(color: Colors.white),
          ),
          Spacer(),
          GestureDetector(onTap: incrementCounter,
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
