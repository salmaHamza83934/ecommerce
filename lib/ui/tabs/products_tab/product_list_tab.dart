import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/Colors.dart';
import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductsTabViewModel viewModel =
  ProductsTabViewModel(getProductsUseCase: injectGetProductsUseCase());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context, state) {
        return state is AllProductsLoadingState
            ? Center(
          child: CircularProgressIndicator(
            color: Theme
                .of(context)
                .primaryColor,
          ),
        )
            : GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            childAspectRatio: 1/1.26, // Adjust childAspectRatio to control item height

          ),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey)),
              child: Column(children: [
                Container(
                  height: 160.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                          image: NetworkImage(
                              viewModel.products[index].images![0]),
                          fit: BoxFit.cover)),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      //height: 100.h,
                      width: 180.w,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.products[index].title ?? '',
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.textColor, fontWeight:FontWeight.w500,fontSize: 16.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "EGP  ${viewModel.products[index].price.toString()}",
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.textColor, fontWeight:FontWeight.w500,fontSize: 14.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3.h,),
                          Row(
                            children: [
                              Text(
                                "Rating (${viewModel.products[index].ratingsAverage.toString()})",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColors.textColor, fontWeight:FontWeight.w500,fontSize: 14.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 3.h,),
                              Icon(Icons.star,color: Colors.yellow,size: 20,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.add_circle,color: Theme.of(context).primaryColor,size: 35,)
                  ],
                ),
              ]),
            );
          },
          itemCount: viewModel.products.length,
        );
      },
    );
  }
}
