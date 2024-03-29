import 'package:ecommerce_app/ui/home_screen/home_screen_view.dart';
import 'package:ecommerce_app/ui/login/login_view.dart';
import 'package:ecommerce_app/ui/register/register_view.dart';
import 'package:ecommerce_app/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            LoginView.routeName: (context) => LoginView(),
            RegisterView.routeName: (context) => RegisterView(),
            HomeView.routeName:(context)=>HomeView()
          },
        );
      }
    );
  }

}
