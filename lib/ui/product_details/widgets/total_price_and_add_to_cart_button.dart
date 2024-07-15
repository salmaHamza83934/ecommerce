import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/Colors.dart';

class TotalPriceAndAddToCartButton extends StatelessWidget {
  ProductEntity productEntity;
  int counterValue;


  TotalPriceAndAddToCartButton({required this.productEntity, required this.counterValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              'Total price',
              style: TextStyle(color: AppColors.greyColor),
            ),
            Text("EGP  ${productEntity.price!*counterValue}"),
          ],
        ),
        SizedBox(
          width: 30.w,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16.r)),
          width: 250.w,
          height: 50.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 25.w,
              ),
              Text('Add to cart',
                  style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: Colors.white))
            ],
          ),
        ),
      ],
    );
  }
}
