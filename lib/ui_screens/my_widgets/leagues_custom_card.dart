import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaguesCustomCard extends StatelessWidget {
  const LeaguesCustomCard(
      {Key? key,
        required this.titleText,
        required this.leagueImage,
        required this.date,
        required this.time,
        required this.price,
        required this.totalSlots,
        required this.filledSlots,
        required this.onTapped})
      : super(key: key);

  final String titleText, leagueImage, date, time;
  final num price, totalSlots, filledSlots;
  final Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Card(
        margin: const EdgeInsets.only(top: 20),
        elevation: 5,
        // color: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            // color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8),
            // color: Colors.blueGrey.withOpacity(0.1),
          ),
          child: Column(
            children: [
              Container(
                // margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(6),
                width: double.infinity,
                height: Get.height * .22,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    image: DecorationImage(
                        image: AssetImage(leagueImage), fit: BoxFit.cover)),
                child: Column(
                  children: [
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Get.to(CompetitionBookingScreen());
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       onPrimary: Colors.white,
                    //       primary: MyAppColors.appPrimaryColor,
                    //       elevation: 0.3,
                    //       padding: const EdgeInsets.symmetric(horizontal: 20),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20)),
                    //     ),
                    //     child: Text(
                    //       'Details',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .bodyText1!
                    //           .copyWith(
                    //               fontWeight: FontWeight.w500,
                    //               fontSize: 13,
                    //               color: Colors.white,
                    //               letterSpacing: 1,
                    //               wordSpacing: .8),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: Get.height * .165),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              titleText,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          Image.asset('assets/icons_png/letter_f.png',height: 25,width: 25,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 12),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\$ ${price.toString()}',
                              style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          date.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          // color: Colors.grey,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, top: 12),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${filledSlots.toString()}/${totalSlots.toString()}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/icons_png/succer.PNG',
                                height: 20,
                                width: 20,
                                color:
                                Colors.black, //MyAppColors.appSecondaryColor,
                              )
                            ],
                          ),
                        ),
                        Text(
                          time.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
