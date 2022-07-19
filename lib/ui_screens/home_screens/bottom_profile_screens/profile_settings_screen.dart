import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/my_widgets/my_text_field.dart';
import '../../../utils/app_colors.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  String selectedPosition = 'Choose Position';
  List<String> defensesList = [
    'Left Back',
    'Right Back',
    'Center Back',
  ];
  List<String> midFieldsList = [
    'Defensive Midfield',
    'Center Midfield',
    'Attacking Midfield',
    'Left Wing',
    'Right Wing',
  ];
  List<String> attacksList = [
    'Center Forward',
    'Striker',
  ];
  bool isPlayedInHighSchool = false;
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController bioController = TextEditingController();

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
          'Profile Settings',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Preferred Position',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.only(left: 12),
              width: double.infinity,
              height: Get.height * .08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedPosition,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 13.5, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                    height: Get.height * .05,
                    width: Get.width * .35,
                    // color: Colors.black45,
                    child: PositionButton(
                      onPressed: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return Center(
                              child: Container(
                                width: Get.width * .8,
                                height: Get.height * .85,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Select Position',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(
                                                fontSize: 18,
                                                // letterSpacing: 1,
                                              ),
                                        ),
                                        const SizedBox(width: 12),
                                        Image.asset(
                                          'assets/icons_png/lineup.png',
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: Get.height * .04),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Defense',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.green,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ListView.builder(
                                      itemCount: defensesList.length,
                                      shrinkWrap: true,
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          // color: Colors.cyan,
                                          height: 33,
                                          // padding: EdgeInsets.only(bottom: 6),
                                          margin:
                                              const EdgeInsets.only(bottom: 4),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedPosition =
                                                    defensesList[index]
                                                        .toString();
                                              });
                                              Get.back();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(width: 12),
                                                Text(
                                                  '- ' + defensesList[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 2,
                                      child: Divider(
                                        thickness: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Midfield',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.blue,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ListView.builder(
                                      itemCount: midFieldsList.length,
                                      shrinkWrap: true,
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          // color: Colors.cyan,
                                          height: 33,
                                          // padding: EdgeInsets.only(bottom: 6),
                                          margin:
                                              const EdgeInsets.only(bottom: 4),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedPosition =
                                                    midFieldsList[index]
                                                        .toString();
                                              });
                                              Get.back();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(width: 12),
                                                Text(
                                                  '- ' + midFieldsList[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 2,
                                      child: Divider(
                                        thickness: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Attack',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.red,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    ListView.builder(
                                      itemCount: attacksList.length,
                                      shrinkWrap: true,
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          // color: Colors.cyan,
                                          height: 33,
                                          // padding: EdgeInsets.only(bottom: 6),
                                          margin:
                                              const EdgeInsets.only(bottom: 4),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedPosition =
                                                    attacksList[index]
                                                        .toString();
                                              });
                                              Get.back();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(width: 12),
                                                Text(
                                                  '- ' + attacksList[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
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
                      titleText: 'Choose',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * .038),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Played in College / High School',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              height: Get.height * .08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'No',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 13.5, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Switch(
                      value: isPlayedInHighSchool,
                      activeColor: MyAppColors.appSecondaryColor,
                      onChanged: (value) {
                        setState(() {
                          isPlayedInHighSchool = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    'Yes',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 13.5, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * .038),
            MyTextField(
              myController: phoneController,
              myHintText: 'Phone Number',
              isPassword: false,
              isNumeric: true,
              myIcon: Icons.phone,
            ),
            SizedBox(height: Get.height * .038),
            MyTextField(
              myController: cityController,
              myHintText: 'City',
              isNumeric: false,
              isPassword: false,
              myIcon: Icons.location_city_outlined,
            ),
            SizedBox(height: Get.height * .038),
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: MyAppColors.signInBgColor.withOpacity(0.5),
                  style: BorderStyle.solid,
                ),
              ),
              child: TextFormField(
                controller: bioController,
                minLines: 1,
                maxLines: 5,
                // expands: true,
                cursorColor: MyAppColors.signInBgColor,
                cursorHeight: Get.height * .03,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  // hintText: myHintText,
                  // labelText: ' Profile Bio ',
                  label: Container(
                    color: Colors.grey.shade200,
                    child: Text(
                      ' Profile Bio ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  // labelStyle: TextStyle(
                  //   color: Colors.grey,
                  //   fontSize: 16,
                  //   backgroundColor: Colors.grey.shade200,
                  // ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      // color: Colors.black
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      // color: Colors.black
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      // color: Colors.black
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                ),
              ),
            ),
            SizedBox(height: Get.height * .045),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6, horizontal: 60.0),
              child: MySaveButton(
                onPressed: () {
                  mySnackBar(snackText: 'Updated profile info.');
                },
                titleText: 'Save Changes',
              ),
            ),
            // const SizedBox(height: 50),
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

class PositionButton extends StatelessWidget {
  const PositionButton({
    Key? key,
    required this.onPressed,
    required this.titleText,
  }) : super(key: key);

  final Function() onPressed;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // padding: EdgeInsets.symmetric(horizontal: 9),
        onPrimary: Colors.white,
        // padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        primary: MyAppColors.appSecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        titleText,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class MySaveButton extends StatelessWidget {
  const MySaveButton({
    Key? key,
    required this.onPressed,
    required this.titleText,
  }) : super(key: key);

  final Function() onPressed;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        // padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        primary: MyAppColors.appSecondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: 1,
                ),
          ),
          const Icon(Icons.save_rounded)
        ],
      ),
    );
  }
}
