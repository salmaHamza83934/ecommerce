import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/core/theme/app_colors.dart';
import 'package:ecommerce_app/core/theme/app_text_styles.dart';
import 'package:ecommerce_app/ui/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_states.dart';
import 'package:ecommerce_app/ui/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../search_view.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => showSearch(context: context, delegate: SearchView()),
            child: Container(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: Colors.grey)
              ),
              child: Row(
                children: [
                  Icon(Icons.search,color: Colors.grey,size: 30.r,),
                  SizedBox(width: 10.w,),
                  Text('What are you searching for?',style: AppTextStyles.font14White.copyWith(color: AppColors.slateGrey)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        BlocBuilder<CartTabViewModel, CartStates>(
  builder: (context, state) {
    return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, Routes.cartScreen);
            },
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    FontAwesomeIcons.cartShopping,
                    size: 30,
                  ),
                ),
                CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.magentaDye,
                    child: Center(
                        child: Text(BlocProvider.of<CartTabViewModel>(context).cartProducts.length.toString(),
                            style: AppTextStyles.font14White))),
              ],
            ));
  },
),
      ],
    );
  }
}
