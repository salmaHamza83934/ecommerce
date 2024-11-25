import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/products_tab/widgets/product_item_shimmer.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/products_tab/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatefulWidget {
  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  int selectedIndex = 0;

  @override
  void initState() {
    BlocProvider.of<HomeTabViewModel>(context).getProductByCategoryId(
        BlocProvider.of<HomeTabViewModel>(context).categoryEntity[0].id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
                BlocProvider.of<HomeTabViewModel>(context)
                    .getProductByCategoryId(
                        BlocProvider.of<HomeTabViewModel>(context)
                            .categoryEntity[index]
                            .id!);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.delftBlue, width: 2),
                    color: selectedIndex == index
                        ? AppColors.delftBlue
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  BlocProvider.of<HomeTabViewModel>(context)
                      .categoryEntity[index]
                      .name
                      .toString(),
                  style: AppTextStyles.font16DelftBlue.copyWith(
                      color: selectedIndex == index
                          ? Colors.white
                          : AppColors.delftBlue),
                ),
              ),
            ),
            itemCount: BlocProvider.of<HomeTabViewModel>(context)
                .categoryEntity
                .length,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        BlocBuilder<HomeTabViewModel, HomeTabStates>(
          builder: (context, state) {
            return state is CategoryProductsLoadingState
                ? Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1 / 1.26,
                      ),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return const ProductItemShimmer();
                      },
                      itemCount: 8,
                    ),
                  )
                : Expanded(
                    child: BlocProvider.of<HomeTabViewModel>(context)
                            .categoryProducts
                            .isNotEmpty
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1 / 1.26,
                            ),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.productDetailsScreen,
                                          arguments: {
                                            'products': BlocProvider.of<
                                                    HomeTabViewModel>(context)
                                                .categoryProducts[index]
                                          },
                                        );
                                      },
                                      child: ProductItemWidget(
                                        product:
                                            BlocProvider.of<HomeTabViewModel>(
                                                    context)
                                                .categoryProducts[index],
                                      ),
                                    );
                            },
                            itemCount:  BlocProvider.of<HomeTabViewModel>(context)
                                    .categoryProducts
                                    .length,
                          )
                        : Center(
                            child: Text(
                            'Sorry no available products\n for this category!',
                            style: AppTextStyles.font20MagentaHaze
                                .copyWith(color: AppColors.delftBlue),
                            textAlign: TextAlign.center,
                          )),
                  );
          },
        )
      ],
    );
  }
}
