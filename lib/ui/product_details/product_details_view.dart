import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/Colors.dart';
import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/product_details/widgets/color_line_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_counter.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_description.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_images_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/size_line_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/total_price_and_add_to_cart_button.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatefulWidget {
  static const String routeName = 'product_details';

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  CartTabViewModel viewModel = CartTabViewModel(
    addToCartUseCase: injectAddToCartUseCase(),
      getCartUseCase: injectGetCartUseCase(),
      deleteCartUseCase: injectDeleteCartItemUseCase(),
      updateCountCartUseCase: injectUpdateCountCartUseCase());

  int counterValue = 1;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as ProductEntity;
    var theme = Theme.of(context);
    return BlocConsumer<CartTabViewModel, CartStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Product Details'),
            actions: [
              Icon(
                Icons.search,
                size: 35.r,
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    MyAssets.shoppingCart,
                    height: 30.h,
                    width: 30.w,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ProductImagesWidget(args),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: 280.w,
                              child: Text(
                                args.title ?? '',
                                overflow: TextOverflow.ellipsis,
                              )),
                          Spacer(),
                          Text('EGP ${args.price.toString()}'),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Text(
                                "${args.sold} Sold",
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            ' ${args.ratingsAverage} (${args.ratingsQuantity})',
                            style: theme.textTheme.bodySmall!.copyWith(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                          Spacer(),
                          ProductCounter((value) {
                            setState(() {
                              counterValue =
                                  value; // Update the counter value in the main screen
                            });
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ProductDescription(args),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizeLineWidget(),
                      SizedBox(
                        height: 16.h,
                      ),
                      ColorLineWidget(),
                      SizedBox(
                        height: 50.h,
                      ),
                      TotalPriceAndAddToCartButton(addToCart: (){
                        viewModel.addToCart(args.id??'');
                        Future.delayed((const Duration(seconds: 1)),(){
                          if(counterValue>1){
                            viewModel.updateCountCart(args.id??'', counterValue);
                          }
                        });
                      },
                          productEntity: args, counterValue: counterValue),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {

      },
    );
  }
}
