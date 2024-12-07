import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/cach_helper/cach_helper.dart';
import '../../core/routing/routes_names.dart';
import 'onboarding_item.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> model = [
    OnboardingModel(1, AssetImages.onboardingImage1, 'Welcome Aboard!',
        'Discover the best products,\n just a tap away.'),
    OnboardingModel(
        2,
        AssetImages.onboardingImage2,
        'Shop with Ease',
        'Browse, select, and order your\n favorites anytime, anywhere.'),
    OnboardingModel(
        3,
        AssetImages.onboardingImage3,
        'Amazing Deals Await',
        'Enjoy exclusive discounts and \npersonalized recommendations.'),
  ];
  var boardController = PageController();
  bool isLast = false;
  bool isMid = false;
  double value = 0.333;

  int count = 0;

  void submit() {
    CacheHelper.saveData(key: 'onboarding', value: true).then((value) {
      if (value) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginScreen, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
                vertical: 30.h, horizontal: 20.w),
            child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                  onPressed: submit,
                  child: Text('Skip', style: AppTextStyles.font16DelftBlue)),
            ),
          ),
          SizedBox(
            height: 600.h,
            child: PageView.builder(
              controller: boardController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  count = index;
                  value = (index + 1) / model.length; // Updates progress
                  isMid = index == 1; // Tracks the second page
                  isLast = index == model.length - 1; // Tracks the last page
                });
              },
              itemBuilder: (context, index) =>
                  onBoardingItem(model[index], context),
              itemCount: model.length,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: model.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 20,
                    dotColor: AppColors.frenchGrey,
                    activeDotColor: AppColors.magentaHaze,
                  ),
                ),
                const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if(value==1){
                        submit();
                      }
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      height: 55.h,
                      width: 55.w,
                      decoration: const ShapeDecoration(
                        color: AppColors.magentaHaze,
                        shape: OvalBorder(),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 20.r,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
