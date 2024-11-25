import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../domain/entities/ProductsResponseEntity.dart';
import '../cubit/produts_tab_states.dart';
import '../cubit/produts_tab_view_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity product;

  const ProductItemWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(children: [
            Container(
              height: 160.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  product.images![0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 160.h,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Show the loaded image.
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 160.h,
                          width: double.infinity,
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
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 180.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? '',
                        style: AppTextStyles.font16DelftBlue,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "EGP ${product.price.toString()}",
                        style: AppTextStyles.font14White
                            .copyWith(color: AppColors.magentaDye),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Text(
                            "Rating (${product.ratingsAverage.toString()})",
                            style: AppTextStyles.font14White
                                .copyWith(color: AppColors.slateGrey),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 3.h),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BlocBuilder<CartTabViewModel, CartStates>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<CartTabViewModel>(context)
                            .addToCart(product.id ?? '');
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const ShapeDecoration(
                          color: AppColors.delftBlue,
                          shape: OvalBorder(),
                        ),
                        child: Icon(
                          FontAwesomeIcons.cartPlus,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ]),
          BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
            builder: (context, state) {
              final isFavourite = BlocProvider.of<ProductsTabViewModel>(context)
                  .favouriteProductIds
                  .contains(product.id ?? '');
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<ProductsTabViewModel>(context)
                      .addToWishlist(product.id ?? '');
                },
                child: Container(
                  margin: EdgeInsets.all(8.r),
                  width: 40.w,
                  height: 40.h,
                  decoration: const ShapeDecoration(
                    shadows: [BoxShadow(color: Colors.black)],
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.magentaDye,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
