import 'package:ecommerce_app/data/di.dart';
import 'package:ecommerce_app/ui/custom_widgets/custom_bottom_navigation_bar.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/asset_data/assets_img.dart';
import '../custom_widgets/custom_search.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home_screen';
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
              bottomNavigationBar: buildCustomNavigationBar(
                context: context,
                selectedIndex: viewModel.selectedIndex,
                onTapFunction: (index) {
                  viewModel.changeBottomNavigationBar(index);
                },
              ),
              body: SafeArea(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Image.asset(
                              MyAssets.logo,
                              height: 22.h,
                              width: 66.w,
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            viewModel.selectedIndex==3?const SizedBox():CustomSearch(),
                            SizedBox(
                              height: 16.h,
                            ),
                            Expanded(child: viewModel.tabs[viewModel.selectedIndex]),
                          ]))));
        },
        listener: (context, state) {});
  }
}
