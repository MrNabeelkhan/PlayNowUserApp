import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/home_screens/bottom_leagues_screens/join_competition_as_team_alert_dailog.dart';
import 'package:play_now_users/ui_screens/home_screens/payment_method_screens/payment_method_screen.dart';
import '../../../utils/app_colors.dart';
import 'join_competition_alert_dialog_single_player.dart';

class CompetitionInfoScreen extends StatefulWidget {
  const CompetitionInfoScreen({Key? key}) : super(key: key);

  @override
  State<CompetitionInfoScreen> createState() => _CompetitionInfoScreenState();
}

class _CompetitionInfoScreenState extends State<CompetitionInfoScreen> {
  bool isJustMe = false, isMyTeam = false;
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
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Competition Info'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            barrierColor: Colors.black45,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (BuildContext buildContext, Animation animation,
                Animation secondaryAnimation) {
              return CupertinoAlertDialog(
                content: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Choose Type',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: MyAppColors.appSecondaryColor,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Center(
                                  child: Text(
                                    'Select A Team',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: MyAppColors.appSecondaryColor,
                                        ),
                                  ),
                                ),
                                content: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 40),
                                      SizedBox(
                                        height: 500,
                                        child: ListView.builder(
                                          itemCount: kitColors.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0),
                                              child: SelectTeamButton(
                                                teamName:
                                                    'teamName ${index.toString()}',
                                                kitColor: kitColors[index],
                                                onTapped: () {
                                                  Get.back();
                                                  showGeneralDialog(
                                                    context: context,
                                                    barrierDismissible: true,
                                                    barrierLabel:
                                                        MaterialLocalizations
                                                                .of(context)
                                                            .modalBarrierDismissLabel,
                                                    barrierColor:
                                                        Colors.black45,
                                                    transitionDuration:
                                                        const Duration(
                                                            milliseconds: 200),
                                                    pageBuilder: (BuildContext
                                                            buildContext,
                                                        Animation animation,
                                                        Animation
                                                            secondaryAnimation) {
                                                      return JoinCompetitionDetailDialogForSinglePlayer(
                                                        kitColor:
                                                            kitColors[index],
                                                        teamName:
                                                            'teamName ${index.toString()}',
                                                        onTapped: () {
                                                          Get.back();
                                                          Get.to(
                                                            const PaymentMethodScreen(),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle_outlined,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              'Just Me',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Center(
                                  child: Text(
                                    'Select A Team',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: MyAppColors.appSecondaryColor,
                                        ),
                                  ),
                                ),
                                content: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 40),
                                      SizedBox(
                                        height: 500,
                                        child: ListView.builder(
                                          itemCount: kitColors.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0),
                                              child: SelectTeamButton(
                                                teamName:
                                                    'teamName ${index.toString()}',
                                                kitColor: kitColors[index],
                                                onTapped: () {
                                                  Get.back();
                                                  showGeneralDialog(
                                                    context: context,
                                                    barrierDismissible: true,
                                                    barrierLabel:
                                                        MaterialLocalizations
                                                                .of(context)
                                                            .modalBarrierDismissLabel,
                                                    barrierColor:
                                                        Colors.black45,
                                                    transitionDuration:
                                                        const Duration(
                                                            milliseconds: 200),
                                                    pageBuilder: (BuildContext
                                                            buildContext,
                                                        Animation animation,
                                                        Animation
                                                            secondaryAnimation) {
                                                      return JoinCompetitionDetailDialogForTeam(
                                                        kitColor:
                                                            kitColors[index],
                                                        teamName:
                                                            'teamName ${index.toString()}',
                                                        onTapped: () {
                                                          Get.back();
                                                          Get.to(
                                                            const PaymentMethodScreen(),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle_outlined,
                              size: 25,
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              'Enter My Team',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ); // JoinGameDetailDialog();
            },
          );
        },
        isExtended: true,
        backgroundColor: MyAppColors.appSecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        label: Row(
          children: [
            Text(
              'Join Competition',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(width: 8),
            const ImageIcon(
              AssetImage('assets/icons_png/join_game_ico.png'),
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'assets/icons_png/event_1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * .04),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Test Event title 1',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                      ),
                    ),
                    SizedBox(height: Get.height * .04),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'About Competition',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: MyAppColors.appSecondaryColor,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called seeding, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called Seeding, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.4),
                      ),
                    ),
                    SizedBox(height: Get.height * .04),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Competition Details',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: MyAppColors.appSecondaryColor,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width * .5,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  ImageIcon(
                                      AssetImage(
                                          'assets/icons_png/calendar_hollow.png'),
                                      size: 23),
                                  SizedBox(width: 6),
                                  Text(
                                    'May 16, Wednesday',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all()),
                                    child: const CircleAvatar(
                                        radius: 10,
                                        backgroundColor: Colors.transparent,
                                        child: Icon(
                                          Icons.attach_money,
                                          color: Colors.black,
                                          size: 15,
                                        )),
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    '\$ 25',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  const SizedBox(width: 6),
                                  SizedBox(
                                    width: Get.width * .4,
                                    // color: Colors.blue,
                                    child: const Text(
                                      'Boston United Football Club',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .38,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons_png/clock_hollow.png',
                                    height: 22,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    '90 mins',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons_png/succer.PNG',
                                    color: Colors.black,
                                    height: 22,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    '2/20',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    ' Teams',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Get.height * .05),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Location',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: MyAppColors.appSecondaryColor,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/icons_png/map_location.PNG',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * .15),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class SelectTeamButton extends StatelessWidget {
  const SelectTeamButton(
      {Key? key,
      required this.teamName,
      required this.kitColor,
      required this.onTapped})
      : super(key: key);

  final String teamName;
  final Color kitColor;
  final Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: MyAppColors.signInTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
      ),
      child: Container(
        // height: 90,
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(
        //     horizontal: 18, vertical: 6),
        // padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
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
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons_png/uniform.PNG',
                color: kitColor,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              teamName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 17,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
