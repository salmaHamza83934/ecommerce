import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../products_tab/cubit/produts_tab_view_model.dart';

class WishlistItemWidget extends StatelessWidget {
  const WishlistItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 20.h,
            );
          },
          itemBuilder: (context, index) {
            return Container(
              //padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                        border: Border.all(
                            color: Colors.grey.shade300),
                        borderRadius:
                        BorderRadius.circular(16.r),
                      ),
                      child: Image.network(
                        BlocProvider.of<ProductsTabViewModel>(
                            context)
                            .favoriteProducts[index]
                            .imageCover ??
                            '',
                        loadingBuilder: (context, child,
                            loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child:
                              CircularProgressIndicator(
                                color: AppColors.magentaDye,
                              ),
                            );
                          }
                        },
                        errorBuilder:
                            (context, error, stackTrace) {
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
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 140.w,
                            child: Text(
                              BlocProvider.of<ProductsTabViewModel>(
                                  context)
                                  .favoriteProducts[
                              index]
                                  .title ??
                                  '',
                              style: AppTextStyles
                                  .font18MagentaHaze
                                  .copyWith(
                                  color: AppColors
                                      .delftBlue),
                              overflow:
                              TextOverflow.ellipsis,
                            )),
                        const Spacer(),
                        Text(
                            "in stock:  ${BlocProvider.of<ProductsTabViewModel>(context).favoriteProducts[index].quantity.toString()}",
                            style: AppTextStyles.font14White
                                .copyWith(
                                color: AppColors
                                    .slateGrey)),
                        const Spacer(),
                        Text(
                          "EGP  ${BlocProvider.of<ProductsTabViewModel>(context).favoriteProducts[index].price}",
                          style: AppTextStyles
                              .font18MagentaHaze,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.h, horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<
                                ProductsTabViewModel>(
                                context)
                                .removeFromWishlist(BlocProvider
                                .of<ProductsTabViewModel>(
                                context)
                                .favoriteProducts[
                            index]
                                .id ??
                                '');
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.r),
                            width: 40.w,
                            height: 40.h,
                            decoration:
                            const ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                    color: Colors.black)
                              ],
                              color: Colors.white,
                              shape: OvalBorder(
                                  side: BorderSide(
                                      color:
                                      Colors.white38)),
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: AppColors.magentaDye,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<
                                CartTabViewModel>(
                                context)
                                .addToCart(BlocProvider.of<
                                ProductsTabViewModel>(
                                context)
                                .favoriteProducts[
                            index]
                                .id ??
                                '');
                          },
                          child: Container(
                            width: 110.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(
                                    16.r),
                                color: AppColors.delftBlue),
                            child: Center(
                                child: Text(
                                  'Add to Cart',
                                  style:
                                  AppTextStyles.font14White,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount:
          BlocProvider.of<ProductsTabViewModel>(context)
              .favoriteProducts
              .length),
    );
  }
}
