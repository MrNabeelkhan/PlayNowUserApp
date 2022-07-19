import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_now_users/utils/app_colors.dart';

import 'login_signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.to(const LogInSignUpScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.signInBgColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Image.asset('assets/icons_png/SignInIcon.png'),
        ),
      ),
    );
  }
}
