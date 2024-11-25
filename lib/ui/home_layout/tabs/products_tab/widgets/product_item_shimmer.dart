import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class ProductItemShimmer extends StatelessWidget {
  const ProductItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              // Image shimmer
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 160.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // Product info shimmer
                  Container(
                    width: 180.w,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 16.h,
                            width: 100.w,
                            color: Colors.grey,
                            margin: EdgeInsets.only(bottom: 8.h),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 14.h,
                            width: 80.w,
                            color: Colors.grey,
                            margin: EdgeInsets.only(bottom: 12.h),
                          ),
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 14.h,
                                width: 100.w,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 14.h,
                                width: 14.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Cart button shimmer
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Favorite button shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: EdgeInsets.all(8.r),
              width: 40.w,
              height: 40.h,
              decoration: const ShapeDecoration(
                color: Colors.grey,
                shape: OvalBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
