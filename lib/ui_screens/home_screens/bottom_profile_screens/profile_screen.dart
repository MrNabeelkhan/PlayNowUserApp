import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/home_screens/bottom_profile_screens/profile_settings_screen.dart';

import '../../../utils/app_colors.dart';
import 'my_loyalty_programs_screen.dart';
import 'my_messages_screen.dart';
import 'my_profile_events_screen.dart';
import 'my_teams_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyAppColors.signInBgColor));

    return Scaffold(
      backgroundColor: MyAppColors.greyButtonColor.withOpacity(0.5),
      appBar: AppBar(
        title: Text(
          'Profile',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 140,
                  width: 150,
                  // color: Colors.blueGrey,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(65),
                              border: Border.all(
                                  width: 3,
                                  color: MyAppColors.signInTextColor)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(65),
                            child: Image.asset('assets/icons_png/event_1.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 6,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 0.5, color: MyAppColors.signInTextColor),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset('assets/icons_png/pak_flag.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Muhammad Bilal',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 30),
              ProfileButtons(
                onTap: () {
                  Get.to(MyMessagesScreen());
                },
                titleText: 'Messages',
                iconPath: 'assets/icons_png/profile_messages.PNG',
              ),
              ProfileButtons(
                onTap: () {
                  Get.to(MyProfileEventsScreen());
                },
                titleText: 'My Events',
                iconPath: 'assets/icons_png/profile_events.PNG',
              ),
              ProfileButtons(
                onTap: () {
                  Get.to(MyTeamsScreen());
                },
                titleText: 'My Teams',
                iconPath: 'assets/icons_png/profile_team.PNG',
              ),
              ProfileButtons(
                onTap: () {
                  Get.to(LoyaltyProgramsScreen());
                },
                titleText: 'Loyalty Program',
                iconPath: 'assets/icons_png/profile_loyalty.PNG',
              ),
              ProfileButtons(
                onTap: () {
                  Get.to(ProfileSettingsScreen());
                },
                titleText: 'Profile Settings',
                iconPath: 'assets/icons_png/profile_setting.PNG',
              ),
            ],
          )),
    );
  }
}

class ProfileButtons extends StatelessWidget {
  const ProfileButtons(
      {Key? key,
      required this.titleText,
      required this.iconPath,
      required this.onTap})
      : super(key: key);

  final String titleText, iconPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 3.5),
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 0),
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              primary: Colors.white,
              onPrimary: MyAppColors.signInTextColor,
            ),
            child: ListTile(
              // onTap: onTap,

              leading: Image.asset(iconPath, height: 35),
              title: Text(
                titleText,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
