import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../home_screens/my_home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.to(const MyHomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: MyAppColors.signInBgColor));

    return Scaffold(
      // backgroundColor: MyAppColors.signInBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: MyAppColors.signInBgColor.withOpacity(0.6),
              strokeWidth: 3.5,
            ),
            const SizedBox(height: 20),
            Text(
              'Authenticating, please wait ...',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                color: MyAppColors.signInBgColor.withOpacity(0.6)
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
