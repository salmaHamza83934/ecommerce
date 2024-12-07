import 'package:ecommerce_app/core/cach_helper/cach_helper.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/profile_tab/widgets/logout_button.dart';
import 'package:ecommerce_app/ui/home_layout/tabs/profile_tab/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome, ${CacheHelper.getData(key: 'name')}'),
                    Text(
                      '${CacheHelper.getData(key: 'email')}',
                      style: AppTextStyles.font14White
                          .copyWith(color: AppColors.frenchGrey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            ProfileItem(
                'Your full name', '${CacheHelper.getData(key: 'name')}'),
            ProfileItem('Your E-mail', '${CacheHelper.getData(key: 'email')}'),
            ProfileItem(
                'Your mobile number',
                CacheHelper.getData(key: 'phone') == null
                    ? '1111111111111'
                    : '${CacheHelper.getData(key: 'phone')}'),
           const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
