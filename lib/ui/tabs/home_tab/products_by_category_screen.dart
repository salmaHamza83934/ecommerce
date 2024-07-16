import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/Colors.dart';
import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce_app/ui/product_details/product_details_view.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/home_tab_view_model.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  static const String routeName='category_products';
  HomeTabViewModel viewModel = HomeTabViewModel(
      getBrandsUseCase: injectGetBrandsUseCase(),
      getCategoriesUseCase: injectGetCategoriesUseCase(),
      getBrandProductUseCase: injectGetBrandProductUseCase(),
      getCategoryProductUseCase: injectGetCategoryProductUseCase());

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider<HomeTabViewModel>(
      create: (context) => viewModel,
      child: BlocBuilder<HomeTabViewModel, HomeTabStates>(
        bloc: viewModel..getProductByCategoryId(args),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Products'),
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
            body: state is CategoryProductsLoadingState
                ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ):viewModel.categoryProducts.isNotEmpty?
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                  child: GridView.builder(
                                physics: const BouncingScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1 /
                      1.26, // Adjust childAspectRatio to control item height
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
                                    viewModel.categoryProducts[index].images![0]),
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
                                  viewModel.categoryProducts[index].title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "EGP  ${viewModel.categoryProducts[index].price.toString()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rating (${viewModel.categoryProducts[index].ratingsAverage.toString()})",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                          color: AppColors.textColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      width: 3.h,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                // viewModel.addToCart(
                                //     viewModel.products[index].id!);
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Theme.of(context).primaryColor,
                                size: 35,
                              ))
                        ],
                      ),
                    ]),
                  );
                                },
                                itemCount: viewModel.categoryProducts.length,
                              ),
                ):Center(child: Text(
              'Sorry no available products\n for this category!',style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,
            ),)
          );
        },
      ),
    );
  }
}
