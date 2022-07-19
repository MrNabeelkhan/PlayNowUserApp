import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/credentials/login_signup_screen.dart';
import 'package:play_now_users/ui_screens/credentials/splash_screen.dart';
import 'package:play_now_users/ui_screens/home_screens/my_home_screen.dart';
import 'package:play_now_users/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play Now User',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        primarySwatch: buildMaterialColor(MyAppColors.signInTextColor),
      ),
      home: const SplashScreen(),
    );
  }
  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
