import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routing/routes_names.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../home_layout/tabs/products_tab/cubit/produts_tab_states.dart';
import '../home_layout/tabs/products_tab/cubit/produts_tab_view_model.dart';
import '../home_layout/tabs/products_tab/widgets/product_item_shimmer.dart';
import '../home_layout/tabs/products_tab/widgets/product_item_widget.dart';

class SearchResultWidget extends StatelessWidget {
  TextEditingController controller;


  SearchResultWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
        builder: (context, state) {
          final filteredProducts =
              BlocProvider.of<ProductsTabViewModel>(context)
                  .filteredProducts;
          if (state is AllProductsSuccessState ||
              state is AllProductsLoadingState) {
            if (controller.text.isEmpty || filteredProducts.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 80.r,
                    color: AppColors.delftBlue,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'No Results Found!',
                    style: AppTextStyles.font24White
                        .copyWith(color: AppColors.delftBlue),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1 / 1.26,
              ),
              itemBuilder: (context, index) {
                return state is AllProductsLoadingState
                    ? const ProductItemShimmer()
                    : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.productDetailsScreen,
                      arguments: {
                        'products': filteredProducts[index]
                      },
                    );
                  },
                  child: ProductItemWidget(
                    product: filteredProducts[index],
                  ),
                );
              },
              itemCount: state is AllProductsLoadingState
                  ? 8
                  : filteredProducts.length,
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 80.r,
                  color: AppColors.delftBlue,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'No Results Found!',
                  style: AppTextStyles.font24White
                      .copyWith(color: AppColors.delftBlue),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
        },
      ),
    );  }
}
