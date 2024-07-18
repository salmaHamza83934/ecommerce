import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/Colors.dart';
import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/custom_widgets/custom_search.dart';
import 'package:ecommerce_app/ui/custom_widgets/custom_text_field.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/products_by_brand_screen.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/products_by_category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel(
      getBrandsUseCase: injectGetBrandsUseCase(),
      getCategoriesUseCase: injectGetCategoriesUseCase(),
      getBrandProductUseCase: injectGetBrandProductUseCase(),
      getCategoryProductUseCase: injectGetCategoryProductUseCase());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: [
                    Image.asset('assets/images/Property 1=Default.png'),
                    Image.asset('assets/images/Property 1=Variant2.png'),
                    Image.asset('assets/images/Property 1=Variant3.png'),
                  ],
                  options: CarouselOptions(
                    height: 200.h,
                    autoPlay: true,
                    viewportFraction: 1,
                    initialPage: 0,
                  )),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Text(
                    'Categories',
                    style: theme.textTheme.bodyLarge,
                  ),
                  Spacer(),
                  Text(
                    'view all',
                    style: theme.textTheme.bodySmall!.copyWith(
                        color: theme.primaryColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              state is AllCategoriesLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.primaryColor,),
                    )
                  : SizedBox(
                      height: 280.h,
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(onTap: (){
                            Navigator.pushNamed(context, ProductsByCategoryScreen.routeName,arguments: viewModel.categoryEntity[index].id);
                          },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: CircleAvatar(
                                    radius: 50.r,
                                    backgroundColor: Colors.transparent,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.r),
                                      child: Image.network(
                                        viewModel.categoryEntity[index].image??'',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 160.h,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                color: AppColors.primaryColor,
                                              ),
                                            );
                                          }
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Center(
                                            child: Icon(
                                              Icons.error,
                                              color: Colors.red,
                                              size: 50.w,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    viewModel.categoryEntity[index].name ?? "",
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: viewModel.categoryEntity.length,
                      ),
                    ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Text(
                    'Brands',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              state is AllBrandsLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.primaryColor,),
                    )
                  : SizedBox(
                      height: 200.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, ProductsByBrandScreen.routeName,arguments: viewModel.brandsEntity[index].id);
                          },
                            child: Column(
                              children: [
                                Container(
                                  height: 130.h,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //     image: NetworkImage(viewModel
                                      //             .brandsEntity[index].image ??
                                      //         ''),
                                      //     fit: BoxFit.contain),
                                      borderRadius: BorderRadius.circular(16.r),
                                      border: Border.all(width: 1)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: Image.network(
                                      viewModel.brandsEntity[index].image??'',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 160.h,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder: (context, error, stackTrace) {
                                        return Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: 50.w,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  viewModel.brandsEntity[index].name ?? "",
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: viewModel.brandsEntity.length,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
