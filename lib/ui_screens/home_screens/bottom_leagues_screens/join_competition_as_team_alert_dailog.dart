import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';

class JoinCompetitionDetailDialogForTeam extends StatefulWidget {
  const JoinCompetitionDetailDialogForTeam(
      {Key? key,
        required this.onTapped,
        required this.teamName,
        required this.kitColor})
      : super(key: key);

  final Function() onTapped;
  final String teamName;
  final Color kitColor;

  @override
  State<JoinCompetitionDetailDialogForTeam> createState() =>
      _JoinCompetitionDetailDialogForTeamState();
}

class _JoinCompetitionDetailDialogForTeamState
    extends State<JoinCompetitionDetailDialogForTeam> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: Get.height * .9,
        color: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: Get.width * .8,
                height: Get.height * .79,
                padding: const EdgeInsets.all(20),
                margin:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    Text(
                      'Join Competition',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyAppColors.appSecondaryColor,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: MyAppColors.appSecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          'Competition Details',
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyAppColors.signInTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 4),
                        const ImageIcon(
                          AssetImage('assets/icons_png/calendar_hollow.png'),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Jun 16, Thursday',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 28,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Soccer Field',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: MyAppColors.appSecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          'Selected Team',
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyAppColors.signInTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'assets/icons_png/uniform.PNG',
                          height: 30,
                          color: widget.kitColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          widget.teamName,
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: MyAppColors.appSecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          'Payment Details',
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MyAppColors.signInTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            '\$',
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              '25',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 2,
                            color: Colors.grey.shade400,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          Text(
                            '25 × 1 Team',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: widget.onTapped,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book My Spot',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const ImageIcon(AssetImage(
                              'assets/icons_png/confirm_booking.png'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset('assets/icons_png/soccer_player.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
