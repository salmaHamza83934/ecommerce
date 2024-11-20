import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/asset_data/assets_img.dart';
import '../../../../core/theme/app_colors.dart';
class CategoryItemWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 20.w,),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, Routes.productsByCategoryScreen,
                    arguments:
                    {'category_id': BlocProvider.of<HomeTabViewModel>(context).categoryEntity[index].id});
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset(
                        getCategoryAssetImage( BlocProvider.of<HomeTabViewModel>(context).categoryEntity[index].name!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 160.h,


                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    BlocProvider.of<HomeTabViewModel>(context).categoryEntity[index].name ?? "",
                    style: AppTextStyles.font14White.copyWith(
                      color: AppColors.delftBlue,
                      overflow: TextOverflow.ellipsis,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          );
        },
        itemCount:  BlocProvider.of<HomeTabViewModel>(context).categoryEntity.length,
      ),
    );
  }
  String getCategoryAssetImage(String categoryName) {
    switch (categoryName) {
      case "Electronics":
        return AssetImages.electronicsIcon;
      case "Men's Fashion":
        return AssetImages.menIcon;
      case "Women's Fashion":
        return AssetImages.womenIcon;
      case "Baby & Toys":
        return AssetImages.kidsIcon;
      default:
        return AssetImages.electronicsIcon; // Fallback for unknown categories
    }
  }
}
