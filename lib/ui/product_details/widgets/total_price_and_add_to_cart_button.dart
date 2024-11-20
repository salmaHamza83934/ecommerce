import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class TotalPriceAndAddToCartButton extends StatelessWidget {
  Function() addToCart;
  ProductEntity productEntity;
  int counterValue;


  TotalPriceAndAddToCartButton(
      {super.key, required this.addToCart, required this.productEntity, required this.counterValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const Text(
              'Total price',
              style: TextStyle(color: AppColors.slateGrey),
            ),
            Text("EGP  ${productEntity.price! * counterValue}"),
          ],
        ),
        SizedBox(
          width: 30.w,
        ),
        GestureDetector(
          onTap: addToCart,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.magentaHaze,
                borderRadius: BorderRadius.circular(16.r)),
            width: 250.w,
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Icon(
              Icons.add_shopping_cart_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 25.w,
            ),
            Text('Add to cart',
              style: AppTextStyles.font16DelftBlue.copyWith(
                  color: Colors.white),

            )],
            ),
          ),
        ),
      ],
    );
  }
}
