import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_now_users/ui_screens/my_widgets/user_profile.dart';

import '../../../utils/app_colors.dart';
import '../../dummy_data/my_dummy_data.dart';
import 'join_game_alert_dialog.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  int totalFriends = 0;
  int totalPayAmount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Event Detail'),
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
              return const JoinGameDetailDialog();
            },
          );
        },
        isExtended: true,
        backgroundColor: MyAppColors.appSecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        label: Row(
          children: [
            Text(
              'Join this game',
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
                        'Test Event title',
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
                        'About Event',
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
                        'event subtitle and description...',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                      ),
                    ),
                    SizedBox(height: Get.height * .04),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Game Details',
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
                                  Icon(Icons.calendar_month_outlined),
                                  SizedBox(width: 6),
                                  Text(
                                    'Jun 16, Wednesday',
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
                                    '\$ 10',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: const [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(width: 6),
                                  Text(
                                    'Soccer Field',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
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
                                    '30 mins',
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
                                    '20/20',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Get.height * .04),
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
                      height: 10,
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
                    SizedBox(height: Get.height * .04),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Participants',
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

                    // 'assets/icons_png/pak_flag.jpg',
                    // 'assets/icons_png/event_1.jpg',

                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              mainAxisExtent: 120),
                      itemCount: usersDemoData.length,
                      itemBuilder: (context, index) {
                        return UserProfile(
                          name: usersDemoData[index].name,
                          imagePath: usersDemoData[index].imagePath,
                          flagPath: usersDemoData[index].countryFlag,
                          isProfile: usersDemoData[index].isProfileImage,
                          index: index,
                          onTap: () {},
                        );
                      },
                    ),
                    SizedBox(height: Get.height * .04),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Match Host',
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
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/suarez.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
