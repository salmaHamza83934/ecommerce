import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class ProductTitleAndPrice extends StatefulWidget {
  ProductEntity productEntity;
Function (int) onCounterChange;
  ProductTitleAndPrice(this.productEntity,this.onCounterChange, {super.key});

  @override
  State<ProductTitleAndPrice> createState() => _ProductTitleAndPriceState();
}

class _ProductTitleAndPriceState extends State<ProductTitleAndPrice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: 280.w,
                child: Text(
                  widget.productEntity.title ?? '',
                  overflow: TextOverflow.ellipsis,
                )),
            const Spacer(),
            Text('EGP ${widget.productEntity.price.toString()}'),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Container(
              width: 100.w,
              height: 40.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Center(
                child: Text(
                  "${widget.productEntity.sold} Sold",
                  style: AppTextStyles.font14White.copyWith(color: AppColors.delftBlue),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Text(
              ' ${widget.productEntity.ratingsAverage} (${widget.productEntity.ratingsQuantity})',
              style: AppTextStyles.font14White.copyWith(color: AppColors.delftBlue),

            ),
            const Spacer(),
            ProductCounter(widget.onCounterChange),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
