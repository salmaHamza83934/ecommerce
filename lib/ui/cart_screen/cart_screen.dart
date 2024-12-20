import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/cart_screen/widgets/cart_item.dart';
import 'package:ecommerce_app/ui/cart_screen/widgets/price_and_checkout_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CartScreen extends StatelessWidget {


  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartTabViewModel, CartStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Cart'),
          ),
          body: state is GetCartLoadingState
              ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.magentaHaze,
            ),
          )
              : BlocProvider.of<CartTabViewModel>(context).cartProducts.isNotEmpty
              ? Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemBuilder: (context, index) {
                    return CartItem(cartEntity: BlocProvider.of<CartTabViewModel>(context).cartProducts[index],
                        deleteItem: (){
                          BlocProvider.of<CartTabViewModel>(context).deleteCartItems(
                              BlocProvider.of<CartTabViewModel>(context).cartProducts[index].product!.id!);
                        },
                        updateCount: (){
                          BlocProvider.of<CartTabViewModel>(context).updateCountCart(
                              BlocProvider.of<CartTabViewModel>(context).cartProducts[index].product?.id ?? '',
                              BlocProvider.of<CartTabViewModel>(context).cartProducts[index].count!);
                        });
                  },
                  itemCount: BlocProvider.of<CartTabViewModel>(context).cartProducts.length,
                ),
              ),
              PriceAndCheckoutLine(BlocProvider.of<CartTabViewModel>(context).cartTotalPrice.toString()),
            ],
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.cartShopping,
                  size: 150.r,
                  color: AppColors.delftBlue,
                ),
                SizedBox(height: 40.h,),
                Text('No Items in the Cart!',
                  style: AppTextStyles.font24White
                      .copyWith(color: AppColors.delftBlue),textAlign: TextAlign.center,),
              ],
            ))
        );
      },
    );
  }
}
