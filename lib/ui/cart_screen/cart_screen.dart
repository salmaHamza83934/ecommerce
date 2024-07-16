import 'package:ecommerce_app/core/theme/Colors.dart';
import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/cart_screen/cart_counter.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/asset_data/assets_img.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart';
  CartTabViewModel viewModel = CartTabViewModel(
      addToCartUseCase: injectAddToCartUseCase(),
      getCartUseCase: injectGetCartUseCase(),
      deleteCartUseCase: injectDeleteCartItemUseCase(),
      updateCountCartUseCase: injectUpdateCountCartUseCase());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<CartTabViewModel, CartStates>(
      bloc: viewModel..getCartItems(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Icon(
                  Icons.search,
                  size: 35.r,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          body: state is GetCartLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                    color: theme.primaryColor,
                  ),
                )
              : viewModel.cartProducts.isNotEmpty
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
                                          child: Image.network(viewModel
                                                  .cartProducts[index]
                                                  .product
                                                  ?.imageCover ??
                                              '')),
                                      Padding(
                                        padding: EdgeInsets.all(8.r),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                width: 150.w,
                                                child: Text(
                                                  viewModel.cartProducts[index]
                                                          .product?.title ??
                                                      '',
                                                  style: theme
                                                      .textTheme.bodyMedium!
                                                      .copyWith(
                                                          color: theme
                                                              .primaryColor),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                            Spacer(),
                                            Text(
                                              "in stock:  ${viewModel.cartProducts[index].product!.quantity.toString()}",
                                              style: theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      color:
                                                          AppColors.greyColor),
                                            ),
                                            Spacer(),
                                            Text(
                                              "EGP  ${viewModel.cartProducts[index].price}",
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
                                                viewModel.deleteCartItems(
                                                    viewModel
                                                        .cartProducts[index]
                                                        .product!
                                                        .id!);
                                              },
                                              child: Icon(
                                                Icons.delete_forever_outlined,
                                                color: AppColors.primaryColor,
                                                size: 40.r,
                                              ),
                                            ),
                                            Spacer(),
                                            CartCounter(
                                              onCounterChanged: (count) {
                                                viewModel.cartProducts[index]
                                                    .count = count;
                                                viewModel.updateCountCart(
                                                    viewModel
                                                            .cartProducts[index]
                                                            .product
                                                            ?.id ??
                                                        '',
                                                    viewModel
                                                        .cartProducts[index]
                                                        .count!);
                                              },
                                              productCartCount: viewModel
                                                  .cartProducts[index].count!,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: viewModel.cartProducts.length,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Total price',
                                    style:
                                        TextStyle(color: AppColors.greyColor),
                                  ),
                                  Text("EGP  ${viewModel.cartTotalPrice}"),
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
                                    Text('Check Out',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.white)),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Center(child: Text('No Items in the Cart!',style: theme.textTheme.titleLarge!.copyWith(color: theme.primaryColor),)),
        );
      },
    );
  }
}
