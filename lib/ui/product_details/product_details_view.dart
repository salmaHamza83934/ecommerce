import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/di.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:ecommerce_app/ui/product_details/widgets/color_line_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_counter.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_description.dart';
import 'package:ecommerce_app/ui/product_details/widgets/product_images_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/size_line_widget.dart';
import 'package:ecommerce_app/ui/product_details/widgets/total_price_and_add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductDetailsView extends StatefulWidget {
   ProductEntity productEntity;
   ProductDetailsView(this.productEntity);

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
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AssetImages.shoppingCart,
                    height: 30.h,
                    width: 30.w,
                  ),
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
                      Row(
                        children: [
                          SizedBox(
                              width: 280.w,
                              child: Text(
                                widget.productEntity.title ?? '',
                                overflow: TextOverflow.ellipsis,
                              )),
                          const Spacer(),
                          Text('EGP ${widget.productEntity.price.toString()}'),
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
                                "${widget.productEntity.sold} Sold",
                                style: AppTextStyles.font14White.copyWith(color: AppColors.delftBlue),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            ' ${widget.productEntity.ratingsAverage} (${widget.productEntity.ratingsQuantity})',
                            style: AppTextStyles.font14White.copyWith(color: AppColors.delftBlue),

                          ),
                          const Spacer(),
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
