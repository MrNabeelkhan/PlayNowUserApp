import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import 'add_new_team_screen.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({Key? key}) : super(key: key);

  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
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
          'My Teams',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNewTeamScreen());
        },
        backgroundColor: MyAppColors.appSecondaryColor,
        child: Icon(
          Icons.add,
          color: MyAppColors.signInTextColor,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              // height: 90,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: .5,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/icons_png/uniform.PNG',
                      color: Colors.blueGrey.shade700,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Test Team 0',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              // height: 90,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 6),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: .5,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/icons_png/uniform.PNG',
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Test Team',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 17,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
