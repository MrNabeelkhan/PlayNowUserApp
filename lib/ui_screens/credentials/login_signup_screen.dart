import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/my_widgets/my_button_home.dart';
import 'package:play_now_users/ui_screens/my_widgets/my_text_field.dart';
import 'package:play_now_users/utils/app_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';

import 'loading_screen.dart';

class LogInSignUpScreen extends StatefulWidget {
  const LogInSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LogInSignUpScreen> createState() => _LogInSignUpScreenState();
}

class _LogInSignUpScreenState extends State<LogInSignUpScreen> {
  bool isSignIn = false;

  TextEditingController em = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(

            statusBarColor: MyAppColors.signInBgColor));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              margin: const EdgeInsets.only(
                  left: 90, right: 90, top: 70, bottom: 30),
              decoration: BoxDecoration(
                color: MyAppColors.signInBgColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset('assets/icons_png/SignInIcon.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: isSignIn
                        ? Border.all(color: Colors.transparent)
                        : Border(
                            bottom: BorderSide(
                                color: MyAppColors.signInBgColor, width: 3),
                          ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isSignIn = false;
                      });
                    },
                    style: TextButton.styleFrom(
                        primary: MyAppColors.signInTextColor),
                    child: Text(
                      'LogIn',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: isSignIn
                                    ? Colors.black
                                    : MyAppColors.signInTextColor,
                              ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: isSignIn
                        ? Border(
                            bottom: BorderSide(
                                color: MyAppColors.signInBgColor, width: 3),
                          )
                        : Border.all(color: Colors.transparent),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isSignIn = true;
                      });
                    },
                    style: TextButton.styleFrom(
                        primary: MyAppColors.signInTextColor),
                    child: Text(
                      'SignUp',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: isSignIn
                                    ? MyAppColors.signInTextColor
                                    : Colors.black,
                              ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            isSignIn ? const SignUpForm() : const LogInForm(),
            // MyTextField(myController: em, myHintText: 'myHintText', isPassword: false)
          ],
        ),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FormField(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          children: [
            MyTextField(
              myController: emailController,
              myHintText: 'Email',
              isNumeric: false,
              isPassword: false,
              myIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            MyTextField(
              myController: passwordController,
              myHintText: 'Password',
              isNumeric: false,
              isPassword: true,
              myIcon: Icons.lock,
            ),
            const SizedBox(height: 70),
            SignUpLogInButton(
              onPressed: () {
                if (emailController.text.length <= 2) {
                  mySnackBar(snackText: 'Please enter a valid email.');
                } else if (passwordController.text.length <= 2) {
                  mySnackBar(snackText: 'Please enter a valid password.');
                } else {
                  Get.to(const LoadingScreen());
                }
              },
              buttonColor: MyAppColors.signInBgColor,
              // iconPath: 'Icons.arrow_right_alt_sharp',
              titleText: 'LogIn',
            )
          ],
        ),
      );
    });
  }

  void mySnackBar({required String snackText}) {
    SnackBar snackBar = SnackBar(
      elevation: 0.0,
      padding: const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.transparent,
      content: Container(
        width: double.infinity,
        height: Get.height * .07,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.only(left: 18, right: 8, top: 18, bottom: 18),
        child: Text(
          snackText,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
      // margin: EdgeInsets.all(8),
      // padding: EdgeInsets.all(20),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  String countryCode = '+1';

  @override
  Widget build(BuildContext context) {
    return FormField(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          children: [
            MyTextField(
              myController: emailController,
              myHintText: 'Email',
              isNumeric: false,
              isPassword: false,
              myIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            MyTextField(
              myController: passwordController,
              myHintText: 'Password',
              isNumeric: false,
              isPassword: true,
              myIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            MyTextField(
              myController: firstNameController,
              myHintText: 'Firstname',
              isNumeric: false,
              isPassword: false,
              myIcon: Icons.abc,
            ),
            const SizedBox(height: 20),
            MyTextField(
              myController: lastNameController,
              myHintText: 'Lastname',
              isNumeric: false,
              isPassword: false,
              myIcon: Icons.abc,
            ),
            const SizedBox(height: 20),
            MyTextField(
              myController: cityController,
              myHintText: 'City (Optional)',
              isNumeric: false,
              isPassword: false,
              myIcon: Icons.business_outlined,
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: MyAppColors.signInBgColor,
                    style: BorderStyle.solid,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .73,
                    // color: Colors.blueGrey,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CountryCodePicker(
                        flagWidth: 50,
                        // boxDecoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        // showDropDownButton: true,
                        alignLeft: true,
                        initialSelection: 'US',
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        showFlagMain: true,
                        enabled: true,
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        showFlagDialog: true,
                        onChanged: (code) {
                          setState(() {
                            countryCode = code.toString();
                          });
                        },
                        onInit: (code) {
                          countryCode = code.toString();
                        },
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: MyAppColors.signInTextColor,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: MyAppColors.signInBgColor,
                    style: BorderStyle.solid,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 70,
                    color: MyAppColors.signInBgColor,
                    child: Center(
                      child: Text(
                        countryCode.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .6,
                    // color: Colors.orange,
                    child: TextFormField(
                      controller: phoneController,
                      cursorColor: MyAppColors.signInBgColor,
                      cursorHeight: Get.height * .03,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(right: 12),
                      ),
                    ),
                  )
                  // Expanded(
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: CountryCodePicker(
                  //       flagWidth: 50,
                  //       // boxDecoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  //       // showDropDownButton: true,
                  //       textStyle: const TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w400,
                  //           color: Colors.black),
                  //       showFlagMain: true,
                  //       enabled: true,
                  //       showCountryOnly: true,
                  //       showOnlyCountryWhenClosed: true,
                  //       showFlagDialog: true,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            SignUpLogInButton(
              onPressed: () {},
              buttonColor: MyAppColors.signInBgColor,
              // iconPath: 'Icons.arrow_right_alt_sharp',
              titleText: 'SignUp',
            )
          ],
        ),
      );
    });
  }
}
