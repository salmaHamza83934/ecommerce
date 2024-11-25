import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../products_tab/widgets/product_item_widget.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tab_view_model.dart';

class ProductsByCategoryScreen extends StatelessWidget {

  String categoryId;

  ProductsByCategoryScreen(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Products'),
              actions: [
                InkWell(
                  onTap: () {
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
            body: state is CategoryProductsLoadingState
                ? Center(
              child: CircularProgressIndicator(
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            )
                : BlocProvider
                .of<HomeTabViewModel>(context)
                .categoryProducts
                .isNotEmpty
                ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.w, vertical: 8.h),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1 /
                      1.26, // Adjust childAspectRatio to control item height
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ProductItemWidget(
                    product: BlocProvider
                        .of<HomeTabViewModel>(context)
                        .categoryProducts[index],
                  );
                },
                itemCount: BlocProvider
                    .of<HomeTabViewModel>(context)
                    .categoryProducts
                    .length,
              ),
            )
                : Center(
              child: Text(
                'Sorry no available products\n for this category!',
                style: AppTextStyles.font20MagentaHaze.copyWith(
                    color: AppColors.delftBlue),
                textAlign: TextAlign.center,
              ),
            ));
      },
    );
  }
}
