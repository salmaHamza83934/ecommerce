import 'dart:async';
import 'package:ecommerce_app/ui/home_screen/home_screen_view.dart';
import 'package:ecommerce_app/ui/login/login_view.dart';
import 'package:flutter/material.dart';

import '../../core/cach_helper/cach_helper.dart';
import '../register/register_view.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName='splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      var token=CacheHelper.getData(key: 'token');
      if(token==null){
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
      else{
        Navigator.pushReplacementNamed(context, HomeView.routeName);
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
