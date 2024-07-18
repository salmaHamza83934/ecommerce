import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/Colors.dart';

class ProductItem extends StatelessWidget {
  ProductEntity productEntity;


  ProductItem(this.productEntity);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey)),
      child: Column(children: [
        Container(
          height: 160.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                  image: NetworkImage(
                      productEntity.images![0]),
                  fit: BoxFit.cover)),
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              //height: 100.h,
              width: 180.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "EGP  ${productEntity.price.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Rating (${productEntity.ratingsAverage.toString()})",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 3.h,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  // viewModel.addToCart(
                  //     viewModel.products[index].id!);
                },
                child: Icon(
                  Icons.add_circle,
                  color: Theme.of(context).primaryColor,
                  size: 35,
                ))
          ],
        ),
      ]),
    );
  }
}
