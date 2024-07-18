import 'package:ecommerce_app/core/cach_helper/cach_helper.dart';
import 'package:ecommerce_app/ui/login/login_view.dart';
import 'package:ecommerce_app/ui/tabs/profile_tab/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                      CacheHelper.removeData(key: 'token');
                      CacheHelper.removeData(key: 'email');
                      CacheHelper.removeData(key: 'name');
                      CacheHelper.removeData(key: 'phone');
                    },
                    icon: Icon(Icons.logout_outlined,size: 30.r,color: theme.primaryColor,)),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            ProfileItem('Your full name', '${CacheHelper.getData(key: 'name')}'),
            ProfileItem('Your E-mail', '${CacheHelper.getData(key: 'email')}'),
            ProfileItem('Your password', '*****************'),
            ProfileItem(
                'Your mobile number',
                CacheHelper.getData(key: 'phone') == null
                    ? '1111111111111'
                    : '${CacheHelper.getData(key: 'phone')}'),
            ProfileItem('Your Address', 'No Address Found'),
          ],
        ),
      ),
    );
  }
}
