import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/product_details/widgets/color_line_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_description.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_images_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_title_and_price.dart';
import 'package:ecommerce_app/ui/product_details/widgets/size_line_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/total_price_and_add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dialog_utils.dart';


class ProductDetailsView extends StatefulWidget {
   ProductEntity productEntity;
   ProductDetailsView(this.productEntity, {super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  int counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartTabViewModel, CartStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Product Details'),
            actions: [
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.cartScreen);
                  },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
                  child: const Icon(FontAwesomeIcons.cartShopping)
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ProductImagesWidget(widget.productEntity),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleAndPrice(widget.productEntity, (value) {
                        setState(() {
                          counterValue =
                              value; // Update the counter value in the main screen
                        });
                      }),
                      ProductDescription(widget.productEntity),
                      SizedBox(
                        height: 16.h,
                      ),
                      const SizeLineWidget(),
                      SizedBox(
                        height: 16.h,
                      ),
                      const ColorLineWidget(),
                      SizedBox(
                        height: 50.h,
                      ),
                      TotalPriceAndAddToCartButton(addToCart: (){
                        BlocProvider.of<CartTabViewModel>(context).addToCart(widget.productEntity.id??'');
                        if(state is AddToCartSuccessState){
                          DialogUtils.showMessage(context, title: 'Cart Announcement','Product added to cart!',posActionName: 'Ok');
                        }
                        Future.delayed((const Duration(seconds: 1)),(){
                          if(counterValue>1){
                            BlocProvider.of<CartTabViewModel>(context).updateCountCart(widget.productEntity.id??'', counterValue);
                          }
                        });
                      },
                          productEntity: widget.productEntity, counterValue: counterValue),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
