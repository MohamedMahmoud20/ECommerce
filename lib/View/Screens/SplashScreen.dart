// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Authentication/Signin_Screen.dart';
class Splash_Signin extends StatefulWidget {
  @override
  State<Splash_Signin> createState() => _Splash_SigninState();
}

class _Splash_SigninState extends State<Splash_Signin> with TickerProviderStateMixin {
  late final controller =
  AnimationController(vsync: this, duration: const Duration(seconds: 1))
    ..repeat(reverse: true);

  late final Animation<double> animation =
  CurvedAnimation(parent: controller, curve: Curves.easeInCirc);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 500,
        splash: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Lottie.asset(
                    'assets/Json/16982-shopping-loader.json',
                  )),
              FadeTransition(
                opacity: animation,
                child: Text(
                  "E_Commerce",
                  style: TextStyle(fontSize: 23),
                ),
              )
            ],
          ),
        ),
        nextScreen: Signin());
  }
}
