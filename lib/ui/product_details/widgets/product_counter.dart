import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatefulWidget {
  final Function(int) onCounterChanged;

  ProductCounter(this.onCounterChanged);

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int counter=1;
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
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
              size: 30.r,
            ),
          ),
          Spacer(),
          Text(
            '$counter',
            style: theme.textTheme.bodyMedium!
                .copyWith(color: Colors.white),
          ),
          Spacer(),
          GestureDetector(onTap: incrementCounter,
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
