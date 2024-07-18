import 'package:ecommerce_app/core/theme/Colors.dart';
import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/cart_screen/widgets/cart_counter.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/cart_screen/widgets/cart_item.dart';
import 'package:ecommerce_app/ui/cart_screen/widgets/price_and_checkout_line.dart';
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Cart'),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Icon(
                  Icons.search,
                  size: 35.r,
                  color: Theme
                      .of(context)
                      .primaryColor,
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
                    return CartItem(cartEntity: viewModel.cartProducts[index],
                        deleteItem: (){
                          viewModel.deleteCartItems(
                              viewModel.cartProducts[index].product!.id!);
                        },
                        updateCount: (){
                          viewModel.updateCountCart(
                              viewModel.cartProducts[index].product?.id ?? '',
                              viewModel.cartProducts[index].count!);
                        });
                  },
                  itemCount: viewModel.cartProducts.length,
                ),
              ),
              PriceAndCheckoutLine(viewModel.cartTotalPrice.toString()),
            ],
          )
              : Center(child: Text('No Items in the Cart!',
            style: theme.textTheme.titleLarge!.copyWith(
                color: theme.primaryColor),)),
        );
      },
    );
  }
}
