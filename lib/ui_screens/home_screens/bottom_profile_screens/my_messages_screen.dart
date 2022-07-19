import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';

class MyMessagesScreen extends StatefulWidget {
  const MyMessagesScreen({Key? key}) : super(key: key);

  @override
  State<MyMessagesScreen> createState() => _MyMessagesScreenState();
}

class _MyMessagesScreenState extends State<MyMessagesScreen> {
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
          'Messages',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * .3),
            SizedBox(
              height: 70,
              child: Image.asset(
                'assets/icons_png/no_messages.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: Get.height * .01),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Text(
                'Your inbox seems to be empty.',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
