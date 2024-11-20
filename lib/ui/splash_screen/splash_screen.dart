import 'dart:async';
import 'package:ecommerce_app/core/routing/routes_names.dart';
import 'package:ecommerce_app/ui/home_screen/home_page_layout.dart';
import 'package:ecommerce_app/ui/login/login_view.dart';
import 'package:flutter/material.dart';

import '../../core/cach_helper/cach_helper.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName='splash_screen';

  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      var token=CacheHelper.getData(key: 'token');
      if(token==null){
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      }
      else{
        Navigator.pushReplacementNamed(context,Routes.homePageLayout);
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/Splash Screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
