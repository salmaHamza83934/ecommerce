import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/wishlist_tab/widgets/wishlist_listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../products_tab/cubit/produts_tab_states.dart';
import '../products_tab/cubit/produts_tab_view_model.dart';

class WishlistTab extends StatelessWidget {
  const WishlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsTabViewModel, ProductsTabStates>(
      builder: (context, state) {
        return state is GetWishlistLoadingState
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.magentaHaze,
                ),
              )
            : BlocProvider.of<ProductsTabViewModel>(context)
                    .favouriteProductIds
                    .isNotEmpty
                ? const Column(
                    children: [
                      WishlistListViewWidget(),
                    ],
                  )
                : Center(
                  child: Column(
                      children: [
                        SizedBox(height: 220.h,),
                        Icon(
                          FontAwesomeIcons.solidHeart,
                          size: 150.r,
                          color: AppColors.delftBlue,
                        ),
                        SizedBox(height: 40.h,),
                        Text('No Items in the Wishlist!',
                            style: AppTextStyles.font24White
                                .copyWith(color: AppColors.delftBlue),textAlign: TextAlign.center,),
                      ],
                    ),
                );
      },
    );
  }
}
