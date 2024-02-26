import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      items: [
        BottomNavigationBarItem(icon: CircleAvatar(
          foregroundColor: selectedIndex ==0 ?AppTheme.primaryColor : Colors.white,
          backgroundColor: selectedIndex ==0?Colors.white:Colors.transparent,
          radius: 20.r,
          child: ImageIcon(
            size: 40.sp,
            const AssetImage(
              MyAssets.notSelectedHomeIcon,
            ),
          ),
        ),label: 'HOME'),

        BottomNavigationBarItem(icon: CircleAvatar(
          foregroundColor: selectedIndex ==1 ?AppTheme.primaryColor : Colors.white,
          backgroundColor: selectedIndex ==1?Colors.white:Colors.transparent,
          radius: 20.r,
          child: ImageIcon(
            size: 40.sp,
            const AssetImage(
              MyAssets.notSelectedCategoryIcon,
            ),
          ),
        ),label: 'CATEGORY'),

        BottomNavigationBarItem(icon: CircleAvatar(
          foregroundColor: selectedIndex ==2 ?AppTheme.primaryColor : Colors.white,
          backgroundColor: selectedIndex ==2?Colors.white:Colors.transparent,
          radius: 20.r,
          child: ImageIcon(
            size: 40.sp,
            const AssetImage(
              MyAssets.notSelectedWishlistIcon,
            ),
          ),
        ),label: 'WISHLIST'),

        BottomNavigationBarItem(icon: CircleAvatar(
          foregroundColor: selectedIndex ==3 ?AppTheme.primaryColor : Colors.white,
          backgroundColor: selectedIndex ==3 ?Colors.white:Colors.transparent,
          radius: 20.r,
          child: ImageIcon(
            size: 40.sp,
            const AssetImage(
              MyAssets.notSelectedProfileIcon,
            ),
          ),
        ),label: 'Profile'),
      ],
    ),
  );
}
