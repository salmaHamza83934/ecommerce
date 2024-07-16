import 'package:ecommerce_app/core/asset_data/assets_img.dart';
import 'package:ecommerce_app/core/theme/theme.dart';
import 'package:ecommerce_app/ui/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/ui/custom_widgets/custom_text_field.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce_app/ui/home_screen/cubit/home_screen_view_model.dart';
import 'package:ecommerce_app/ui/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app/ui/tabs/products_tab/cubit/produts_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/di.dart';
import '../tabs/products_tab/cubit/produts_tab_view_model.dart';

class CustomSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return Row(
          children: [
            const CustomTextField(),
            SizedBox(
              width: 15.w,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: Image.asset(
                MyAssets.shoppingCart,
                height: 35.h,
                width: 35.w,
              ),
            ),
          ],
        );
  }
}
