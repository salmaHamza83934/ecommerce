import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/widgets/category_item_widget.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/widgets/new_arrival_products_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<String> images = [
    "assets/images/460007-PFQOXL-82.jpg",
    "assets/images/460007-PFQOXL-821.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180.h,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Categories',
                style: AppTextStyles.font20MagentaHaze.copyWith(color: AppColors.delftBlue),
              ),
              SizedBox(
                height: 16.h,
              ),
              state is AllCategoriesLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.magentaDye,
                      ),
                    )
                  : CategoryItemWidget(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'New Arrival',
                style: AppTextStyles.font20MagentaHaze.copyWith(color: AppColors.delftBlue),
              ),
              SizedBox(
                height: 10.h,
              ),
              state is NewArrivalProductsSuccessState?const NewArrivalProductsSection():
                   const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.magentaDye,
                      ),
                    )
                   ,
              SizedBox(
                height: 100.h,
              ),
            ],
          ),
        );
      },
    );
  }
}
