import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../core/theme/Colors.dart';

class ProductDescription extends StatelessWidget {
  ProductEntity productEntity;
  ProductDescription(this.productEntity);

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description'),
        SizedBox(
          height: 5.h,
        ),
        ReadMoreText(
          productEntity.description ?? '',
          style: theme.textTheme.bodySmall!
              .copyWith(color: AppColors.greyColor),
          trimLines: 2,
          trimMode: TrimMode.Line,
          lessStyle: theme.textTheme.bodySmall!.copyWith(
              color: theme.primaryColor, fontWeight: FontWeight.w600),
          moreStyle: theme.textTheme.bodySmall!.copyWith(
              color: theme.primaryColor, fontWeight: FontWeight.w600),
          trimCollapsedText: '  Show More',
          trimExpandedText: '  Show Less',
        ),
      ],
    );
  }
}
