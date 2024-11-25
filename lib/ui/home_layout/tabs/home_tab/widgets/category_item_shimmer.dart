import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../cubit/home_tab_view_model.dart';

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: 20.w,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100.w,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 14.h,
                    width: 80.w,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount:
           4
      ),
    );
  }
}
