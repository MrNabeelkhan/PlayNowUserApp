import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/credentials/login_signup_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/app_colors.dart';
import '../../my_widgets/pdf_viewer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  final String _shareContents =
      "Hi There!\n I am using PLAY_NOW_SPORTS app which provide to join sports as a team or spectator, you can search it in PlayStore or AppStore below is the link to the app: \n \\http:flutter.com";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: MyAppColors.signInBgColor));

    return Scaffold(
      backgroundColor: MyAppColors.greyButtonColor.withOpacity(0.5),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: 1.5,
                color: Colors.black,
              ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rate & Share',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: MyAppColors.appSecondaryColor),
                ),
                const SizedBox(height: 15),
                SettingsButton(
                  onTap: () {
                    Share.share(_shareContents);
                  },
                  titleText: 'Share App Link',
                  iconPath: 'assets/icons_png/share.png',
                ),
                SettingsButton(
                  onTap: () {},
                  titleText: 'Give Us A Rating',
                  iconPath: 'assets/icons_png/rating.png',
                ),
                const SizedBox(height: 30),
                Text(
                  'Terms & Policies',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: MyAppColors.appSecondaryColor),
                ),
                const SizedBox(height: 15),
                SettingsButton(
                  onTap: () {
                    Get.to(const MyPDFViewer(
                      pageTitle: 'Terms & Conditions',
                      pdfPath: 'assets/pdf/terms-and-conditions-template.pdf',
                    ));
                  },
                  titleText: 'Terms & Conditions',
                  iconPath: 'assets/icons_png/terms.png',
                ),
                SettingsButton(
                  onTap: () {
                    Get.to(
                      const MyPDFViewer(
                        pageTitle: 'Privacy Policy',
                        pdfPath: 'assets/pdf/terms-and-conditions-template.pdf',
                      ),
                    );
                  },
                  titleText: 'Privacy Policy',
                  iconPath: 'assets/icons_png/privacy_policy.png',
                ),
                const SizedBox(height: 30),
                Text(
                  'App Settings',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: MyAppColors.appSecondaryColor),
                ),
                const SizedBox(height: 15),
                SettingsButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                            title: const Text('Change Sports'),
                            content: Column(
                              children: [
                                const SizedBox(height: 40),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/icons_png/football_colored_ico.png',
                                        height: 35,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Football / Soccer',
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/icons_png/cricket.png',
                                        height: 35,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'Cricket',
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  },
                  titleText: 'Change Sports',
                  iconPath: 'assets/icons_png/exchange.png',
                ),
                SettingsButton(
                  onTap: () {},
                  titleText: 'Account Credit : ',
                  isAccountCredit: true,
                  currentBalance: 0,
                  iconPath: 'assets/icons_png/dollar_ico.png',
                ),
                SettingsButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Confirm Action'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'CANCEL',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(const LogInSignUpScreen());
                              },
                              child: Text(
                                'LOGOUT',
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                      color: Colors.red,
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  titleText: 'Logout',
                  iconPath: 'assets/icons_png/logout_ico.png',
                ),
              ],
            ),
          )),
    );
  }
}

class SettingsButton extends StatelessWidget {
  SettingsButton({
    Key? key,
    required this.titleText,
    required this.iconPath,
    this.isAccountCredit = false,
    this.currentBalance = 0,
    required this.onTap,
  }) : super(key: key);

  final String titleText, iconPath;
  num currentBalance;
  final Function() onTap;
  bool isAccountCredit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: MyAppColors.greyButtonColor.withOpacity(0.1),
          onPrimary: MyAppColors.signInTextColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(iconPath, height: 30),
            const SizedBox(width: 20),
            isAccountCredit
                ? Row(
                    children: [
                      Text(
                        titleText,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                      ),
                      Text(
                        '\$${currentBalance.toString()}',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                      ),
                    ],
                  )
                : Text(
                    titleText,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                  ),
          ],
        ),
      ),
    );
  }
}
