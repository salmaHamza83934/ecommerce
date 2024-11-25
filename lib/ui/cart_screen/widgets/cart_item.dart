import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/GetCartRespnseEntity.dart';
import 'cart_counter.dart';

class CartItem extends StatelessWidget {
  GetProductCartEntity cartEntity;
  Function() deleteItem;
  Function updateCount;

  CartItem(
      {super.key, required this.cartEntity,
      required this.deleteItem,
      required this.updateCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 400.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Container(
              width: 110.w,
              height: 120.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Image.network(
                cartEntity.product?.imageCover ?? '',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 120.h,
                        width: 110.w,
                        color: Colors.grey[
                        300], // Provide a color to visualize shimmer effect.
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 50.w,
                    ),
                  );
                },
              )),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 150.w,
                    child: Text(
                      cartEntity.product?.title ?? '',
                      style: AppTextStyles.font16DelftBlue.copyWith(color: AppColors.delftBlue),

                      overflow: TextOverflow.ellipsis,
                    )),
                const Spacer(),
                Text(
                  "in stock:  ${cartEntity.product!.quantity.toString()}",
                  style: AppTextStyles.font14White.copyWith(color: AppColors.slateGrey),

                ),
                const Spacer(),
                Text(
                  "EGP  ${cartEntity.price}",
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: deleteItem,
                  child: Icon(
                    Icons.delete_forever_outlined,
                    color: AppColors.magentaDye,
                    size: 40.r,
                  ),
                ),
                const Spacer(),
                CartCounter(
                  onCounterChanged: (count) {
                    cartEntity.count = count;
                    updateCount();
                  },
                  productCartCount: cartEntity.count!,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
