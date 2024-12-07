import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../products_tab/widgets/product_item_widget.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tab_view_model.dart';

class ProductsByCategoryScreen extends StatelessWidget {

  String categoryId;

  ProductsByCategoryScreen(this.categoryId, {super.key});

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
                  onTap: (){
                    Navigator.pushNamed(context, Routes.cartScreen);
                  },
                  child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child: const Icon(FontAwesomeIcons.cartShopping)
                  ),
                ),              ],
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
