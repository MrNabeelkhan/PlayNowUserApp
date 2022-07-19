import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.myController,
      required this.myHintText,
      required this.isPassword,
      required this.myIcon,
      required this.isNumeric})
      : super(key: key);

  final TextEditingController myController;
  final IconData myIcon;
  final String myHintText;
  final bool isPassword, isNumeric;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      obscureText: isPassword,
      cursorColor: MyAppColors.signInBgColor,
      cursorHeight: Get.height * .03,
      keyboardType: isNumeric ? TextInputType.phone : TextInputType.text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        // hintText: myHintText,
        labelText: myHintText,
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),

        prefixIcon: Icon(
          myIcon,
          color: MyAppColors.signInBgColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: MyAppColors.signInBgColor,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: MyAppColors.signInBgColor.withOpacity(0.5),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: MyAppColors.signInBgColor,
            style: BorderStyle.solid,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      ),
    );
  }
}
