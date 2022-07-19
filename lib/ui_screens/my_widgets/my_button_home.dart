import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_now_users/utils/app_colors.dart';

class SignUpLogInButton extends StatelessWidget {
  const SignUpLogInButton(
      {Key? key,
      required this.onPressed,
      required this.titleText,
      // required this.iconPath,
      required this.buttonColor})
      : super(key: key);

  final Function() onPressed;
  final String titleText;//, iconPath;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        onPrimary: MyAppColors.signInTextColor,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        primary: buttonColor.withOpacity(0.9), //MyAppColors.appPrimaryColor.withOpacity(0.6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: SizedBox(
        width: Get.width * .34,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              titleText,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: MyAppColors.signInTextColor,
                  letterSpacing: 1.5,
                  wordSpacing: 1.5),
            ),
            Image.asset(
              'assets/icons_png/enter_ico.png',
              height: 22,
              color: MyAppColors.signInTextColor,
            )
          ],
        ),
      ),
    );
  }
}
