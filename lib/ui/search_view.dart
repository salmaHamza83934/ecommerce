import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/routing/routes_names.dart';
import '../core/theme/app_text_styles.dart';
import 'home_layout/tabs/products_tab/cubit/produts_tab_states.dart';
import 'home_layout/tabs/products_tab/cubit/produts_tab_view_model.dart';
import 'home_layout/tabs/products_tab/widgets/product_item_shimmer.dart';
import 'home_layout/tabs/products_tab/widgets/product_item_widget.dart';

class SearchView extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: AppColors.delftBlue,
                      size: 40.r,
                    )),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.clear();
                            },
                            icon: const Icon(Icons.close)),
                        hintText: 'Search here',
                        hintStyle: AppTextStyles.font18MagentaHaze
                            .copyWith(color: Colors.grey.shade500),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: AppColors.delftBlue, width: 2)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: AppColors.delftBlue, width: 2))),
                    controller: controller,
                    onFieldSubmitted: (value) {
                      BlocProvider.of<ProductsTabViewModel>(context)
                          .getAllProducts(query: value);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
                builder: (context, state) {
                  final filteredProducts =
                      BlocProvider.of<ProductsTabViewModel>(context)
                          .filteredProducts;

                  if (state is AllProductsSuccessState ||
                      state is AllProductsLoadingState) {
                    // Show 'No Results Found' when the query is empty and no filtered products
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
            )
          ],
        ),
      ),
    );
  }
}
