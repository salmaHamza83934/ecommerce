import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../core/theme/app_colors.dart';

class ProductDescription extends StatelessWidget {
  ProductEntity productEntity;

  ProductDescription(this.productEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description'),
        SizedBox(
          height: 5.h,
        ),
        ReadMoreText(
          productEntity.description ?? '',
          style: AppTextStyles.font14White.copyWith(color: AppColors.slateGrey),
          trimLines: 2,
          trimMode: TrimMode.Line,
          lessStyle: AppTextStyles.font16DelftBlue,
          moreStyle: AppTextStyles.font16DelftBlue,
          trimCollapsedText: '  Show More',
          trimExpandedText: '  Show Less',
        ),
      ],
    );
  }
}
