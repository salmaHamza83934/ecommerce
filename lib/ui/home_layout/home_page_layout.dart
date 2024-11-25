import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/asset_data/assets_img.dart';
import '../../core/cach_helper/cach_helper.dart';
import '../../core/shared_widgets/app_bottom_navigation_bar.dart';
import '../../core/shared_widgets/app_search_field.dart';
import 'cubit/home_screen_states.dart';
import 'cubit/home_screen_view_model.dart';

class HomePageLayout extends StatelessWidget {

  HomePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Image.asset(
                                    AssetImages.userAvatar3,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: 'Welcome, ',
                                    style: AppTextStyles.font16DelftBlue,
                                  ),
                                  TextSpan(
                                    text: '${CacheHelper.getData(key: 'name')}',
                                    style: AppTextStyles.font16DelftBlue
                                        .copyWith(color: AppColors.slateGrey),
                                  ),
                                ])),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            BlocProvider.of<HomeScreenViewModel>(context).selectedIndex == 3
                                ? const SizedBox()
                                : const AppSearchField(),
                            SizedBox(
                              height: 16.h,
                            ),
                            Expanded(
                                child: BlocProvider.of<HomeScreenViewModel>(context).tabs[BlocProvider.of<HomeScreenViewModel>(context).selectedIndex]),
                          ])),
                  buildCustomNavigationBar(
                    selectedIndex: BlocProvider.of<HomeScreenViewModel>(context).selectedIndex,
                    onTapFunction: (index) {
                      BlocProvider.of<HomeScreenViewModel>(context).changeBottomNavigationBar(index);
                    },
                    context: context,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
