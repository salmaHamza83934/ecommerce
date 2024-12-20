import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/asset_data/assets_img.dart';
import '../../../../../core/theme/app_colors.dart';
import '../cubit/home_tab_view_model.dart';

class CategorySectionWidget extends StatelessWidget {
  const CategorySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: 20.w,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.productsByCategoryScreen,
                    arguments: {
                      'category_id': BlocProvider.of<HomeTabViewModel>(context)
                          .categoryEntity[index]
                          .id
                    });
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset(
                        getCategoryAssetImage(
                            BlocProvider.of<HomeTabViewModel>(context)
                                .categoryEntity[index]
                                .name!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 160.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    BlocProvider.of<HomeTabViewModel>(context)
                                .categoryEntity[index]
                                .name.toString(),
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
        itemCount:
            BlocProvider.of<HomeTabViewModel>(context).categoryEntity.length,
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
      case "Kids & Toys":
        return AssetImages.kidsIcon;
      default:
        return AssetImages.electronicsIcon; // Fallback for unknown categories
    }
  }
}
