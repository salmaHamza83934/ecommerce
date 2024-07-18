import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/Colors.dart';
import '../../../data/di.dart';
import '../../cart_screen/cubit/cart_states.dart';
import '../../cart_screen/cubit/cart_view_model.dart';
import '../products_tab/cubit/produts_tab_states.dart';
import '../products_tab/cubit/produts_tab_view_model.dart';

class WishlistTab extends StatelessWidget {
  ProductsTabViewModel viewModel = ProductsTabViewModel(
      addToWishlistUseCase: injectAddToWishlistUseCase(),
      getProductsUseCase: injectGetProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      removeFromWishlistUseCase: injectRemoveFromWishlistUseCase(),
      getWishlistUseCase: injectGetWishlistUseCase());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
      bloc: viewModel..getWishlist(),
      builder: (context, state) {
        return state is GetWishlistLoadingState
            ? Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              )
            : viewModel.favouriteProductIds.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20.h,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Container(
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
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                          ),
                                          child: Image.network(viewModel
                                                  .favoriteProducts[index]
                                                  .imageCover ??
                                              '')),
                                      Padding(
                                        padding: EdgeInsets.all(8.r),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 110.w,
                                                child: Text(
                                                  viewModel
                                                          .favoriteProducts[
                                                              index]
                                                          .title ??
                                                      '',
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          color: theme
                                                              .primaryColor,
                                                          fontSize: 15.sp),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            Spacer(),
                                            Text(
                                              "in stock:  ${viewModel.favoriteProducts[index]!.quantity.toString()}",
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      color:
                                                          AppColors.greyColor),
                                            ),
                                            Spacer(),
                                            Text(
                                              "EGP  ${viewModel.favoriteProducts[index].price}",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.h, horizontal: 8.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                viewModel.removeFromWishlist(
                                                    viewModel
                                                            .favoriteProducts[
                                                                index]
                                                            .id ??
                                                        '');
                                              },
                                              child: Container(
                                                margin: EdgeInsets.all(8.r),
                                                width: 40.w,
                                                height: 40.h,
                                                decoration: const ShapeDecoration(
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
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                viewModel.addToCart(viewModel
                                                        .favoriteProducts[index]
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
                                                    color:
                                                        AppColors.primaryColor),
                                                child: Center(
                                                    child: Text(
                                                  'Add to Cart',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.white),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: viewModel.favoriteProducts.length),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                    'No Items in the Wishlist!',
                    style: theme.textTheme.titleLarge!
                        .copyWith(color: theme.primaryColor),
                  ));
      },
    );
  }
}
