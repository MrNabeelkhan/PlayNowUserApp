import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/app_colors.dart';

class MyProfileEventsScreen extends StatefulWidget {
  const MyProfileEventsScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileEventsScreen> createState() => _MyProfileEventsScreenState();
}

class _MyProfileEventsScreenState extends State<MyProfileEventsScreen> {
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
          'My Events',
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
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
