import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/my_widgets/my_text_field.dart';
import '../../../utils/app_colors.dart';

class AddNewTeamScreen extends StatefulWidget {
  const AddNewTeamScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTeamScreen> createState() => _AddNewTeamScreenState();
}

class _AddNewTeamScreenState extends State<AddNewTeamScreen> {
  TextEditingController teamNameController = TextEditingController();

  Color kitColor = Colors.black54;
  List<Color> kitColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.black87,
    Colors.white,
    Colors.indigo,
    Colors.lightBlue,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreenAccent,
    Colors.yellow,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.cyan,
  ];

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
          'Add New Team',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: .5,
                      blurRadius: 5,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/icons_png/uniform.PNG',
                  color: kitColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Center(
                      child: Container(
                        width: Get.width * .8,
                        height: Get.height * .58,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            Text(
                              'Choose Kit Color',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: MyAppColors.appSecondaryColor,
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  ),
                            ),
                            SizedBox(height: Get.height * .06),
                            GridView.builder(
                              itemCount: kitColors.length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(bottom: 12),
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 7,
                                mainAxisSpacing: 18,
                              ),
                              itemBuilder: (context, index) {
                                return FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      kitColor = kitColors[index];
                                    });
                                    Get.back();
                                  },
                                  backgroundColor: kitColors[index],
                                  elevation: 3,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Select Kit Color',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyAppColors.appSecondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: MyTextField(
                myController: teamNameController,
                myHintText: 'Team Name',
                isPassword: false,
                myIcon: Icons.sort_by_alpha,
                isNumeric: false,
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: Get.width * .6,
              child: ElevatedButton(
                onPressed: () {
                  if (teamNameController.text == '') {
                    mySnackBar(
                        snackText:
                            'Team Name must contain at least 3 characters.');
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Team',
                      style: Theme.of(context).textTheme.button!.copyWith(
                            fontSize: 17,
                            color: MyAppColors.appSecondaryColor,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                    ),
                    SizedBox(width: Get.width * .04),
                    Icon(
                      Icons.supervisor_account_sharp,
                      color: MyAppColors.appSecondaryColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
