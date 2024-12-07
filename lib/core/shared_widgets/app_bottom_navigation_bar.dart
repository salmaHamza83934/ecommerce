import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildCustomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        margin:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.magentaHaze,
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          boxShadow:const [ BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            offset: Offset(3, 6),
          )]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              context: context,
              icon: Icons.home_rounded,iconSize: 35.r,
              isSelected: selectedIndex == 0,
              onTap: () => onTapFunction(0),
            ),
            _buildNavItem(
              context: context,
              icon: FontAwesomeIcons.list,
              isSelected: selectedIndex == 1,
              onTap: () => onTapFunction(1),
            ),
            _buildNavItem(
              context: context,
              icon: FontAwesomeIcons.heart,
              isSelected: selectedIndex == 2,
              onTap: () => onTapFunction(2),
            ),
            _buildNavItem(
              context: context,
              icon: FontAwesomeIcons.user,
              isSelected: selectedIndex == 3,
              onTap: () => onTapFunction(3),
            ),
          ],
        ),
      ),
    ],
  );


}
Widget _buildNavItem({
  required BuildContext context,
  required IconData icon,
  required bool isSelected,
  required VoidCallback onTap,
  double? iconSize,
}) {
  return GestureDetector(
    onTap: onTap,
    child: CircleAvatar(
      foregroundColor: isSelected ? AppColors.magentaHaze : Colors.white,
      backgroundColor: isSelected ? Colors.white : Colors.transparent,
      radius: 22.r,
      child: Center(child: Icon(icon,size: iconSize??25.r,)),
  ));
}
