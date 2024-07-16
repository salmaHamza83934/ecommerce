import 'package:ecommerce_app/core/theme/theme.dart';
import 'package:ecommerce_app/ui/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/ui/home_screen/home_screen_view.dart';
import 'package:ecommerce_app/ui/login/login_view.dart';
import 'package:ecommerce_app/ui/product_details/product_details_view.dart';
import 'package:ecommerce_app/ui/register/register_view.dart';
import 'package:ecommerce_app/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/blocObserver/myBlocObserver.dart';
import 'core/cach_helper/cach_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp(
          theme: AppTheme.mainTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            LoginView.routeName: (context) => LoginView(),
            RegisterView.routeName: (context) => RegisterView(),
            HomeView.routeName:(context)=>HomeView(),
            ProductDetailsView.routeName:(context)=>ProductDetailsView(),
            CartScreen.routeName:(context)=>CartScreen(),

          },
        );
      }
    );
  }

}
