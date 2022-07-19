import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class LoyaltyProgramsScreen extends StatefulWidget {
  const LoyaltyProgramsScreen({Key? key}) : super(key: key);

  @override
  State<LoyaltyProgramsScreen> createState() => _LoyaltyProgramsScreenState();
}

class _LoyaltyProgramsScreenState extends State<LoyaltyProgramsScreen> {
  final String _shareContents =
      "Hi There!\n I am using PLAY_NOW_SPORTS app which provide to join sports as a team or spectator, you can search it in PlayStore or AppStore below is the link to the app: \n \\http:flutter.com";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: MyAppColors.appSecondaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Loyalty Program',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 18,
                color: Colors.black,
              ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: Get.height * .05),
              MyLoyaltyButton(
                onTap: () {
                  Share.share(_shareContents);
                },
                title: 'Refer A Friend',
                iconPath: 'assets/icons_png/refer.png',
                points: 10,
              ),
              SizedBox(height: Get.height * .03),
              MyLoyaltyButton(
                onTap: () {},
                title: 'Follow On FaceBook',
                iconPath: 'assets/icons_png/facebook.png',
                points: 5,
              ),
              SizedBox(height: Get.height * .03),
              MyLoyaltyButton(
                onTap: () {},
                title: 'Follow On Instagram',
                iconPath: 'assets/icons_png/instagram.png',
                points: 5,
              ),
              SizedBox(height: Get.height * .03),
              MyLoyaltyButton(
                onTap: () {},
                title: 'Give Us A Rating',
                iconPath: 'assets/icons_png/rating.png',
                points: 5,
              ),
              SizedBox(height: Get.height * .1),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 77,
                  minHeight: 8,
                  backgroundColor: Colors.blueGrey,
                  color: Colors.blueGrey.shade300,
                  // valueColor: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Points 0/100',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: .8),
                  ),
                  Text(
                    '100 more to get \$10 credit',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          // fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLoyaltyButton extends StatelessWidget {
  const MyLoyaltyButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.iconPath,
      required this.points})
      : super(key: key);

  final Function() onTap;
  final String title, iconPath;
  final num points;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPrimary: MyAppColors.signInTextColor,
        primary: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  iconPath,
                  height: 30,
                ),
                const SizedBox(width: 18),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .8),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: Text(
                '+${points.toString()}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
