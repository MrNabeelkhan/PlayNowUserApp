import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../my_widgets/leagues_custom_card.dart';
import 'competition_info_screen.dart';

class MyLeaguesAndCompetition extends StatelessWidget {
  const MyLeaguesAndCompetition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: MyAppColors.signInBgColor));

    return Scaffold(
      backgroundColor: MyAppColors.greyButtonColor.withOpacity(0.5),
      appBar: AppBar(
        title: Text(
          'Leagues & Competitions',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            letterSpacing: 1.5,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return LeaguesCustomCard(
                  titleText: 'Title Text ${1 + index}',
                  date: 'Thursday, Jun ${11 + index}, 2022',
                  time: '${11 + index}:${32 + index}',
                  price: (10 + index),
                  totalSlots: (23 + index),
                  filledSlots: (11 + index),
                  leagueImage: index == 2
                      ? 'assets/icons_png/event_$index.jpeg'
                      : 'assets/icons_png/event_$index.jpg',
                  onTapped: () {
                    Get.to(CompetitionInfoScreen());
                  },
                );
              }),
        ),
      ),
    );
  }
}
