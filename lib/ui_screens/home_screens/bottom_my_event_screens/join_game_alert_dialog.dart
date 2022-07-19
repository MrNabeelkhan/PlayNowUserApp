import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../payment_method_screens/payment_method_screen.dart';


class JoinGameDetailDialog extends StatefulWidget {
  const JoinGameDetailDialog({Key? key}) : super(key: key);

  @override
  State<JoinGameDetailDialog> createState() => _JoinGameDetailDialogState();
}

class _JoinGameDetailDialogState extends State<JoinGameDetailDialog> {
  int totalFriends = 0;
  int totalPayAmount = 10;

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
                      'Join this game',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyAppColors.appSecondaryColor,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * .05,
                      // color: Colors.deepOrangeAccent,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            child: Container(
                              height: Get.height * .055,
                              decoration: BoxDecoration(
                                // color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                  'assets/icons_png/soccer_player.png'),
                            ),
                          ),
                          Positioned(
                            left: 33,
                            child: Container(
                              height: Get.height * .05,
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                  'assets/icons_png/soccer_player.png'),
                            ),
                          ),
                          Positioned(
                            left: 56,
                            child: Container(
                              height: Get.height * .05,
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                  'assets/icons_png/soccer_player.png'),
                            ),
                          ),
                          Positioned(
                            left: 79,
                            child: Container(
                              height: Get.height * .05,
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                  'assets/icons_png/soccer_player.png'),
                            ),
                          ),
                          Positioned(
                            left: 102,
                            child: Container(
                              height: Get.height * .05,
                              width: Get.height * .05,
                              decoration: BoxDecoration(
                                color: MyAppColors.signInTextColor,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
                                Icons.more_horiz,
                                size: 25,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                '2 Slots Left',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          'Game Details',
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Bringing Friends?  ',
                          style:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          'assets/icons_png/friends_ico.png',
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(
                                  () {
                                if (totalFriends > 0) {
                                  totalFriends--;

                                  totalPayAmount = totalPayAmount - 10;
                                }
                              },
                            );
                          },
                          mini: true,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: 1.8,
                                )),
                            child: const Icon(
                              Icons.horizontal_rule_outlined,
                              size: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            totalFriends.toString(),
                            style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 30,
                              color: MyAppColors.signInTextColor,
                            ),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(
                                  () {
                                totalFriends++;
                                totalPayAmount = totalPayAmount + 10;
                              },
                            );
                          },
                          mini: true,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: const Icon(
                            Icons.add_circle_outline_outlined,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                              totalPayAmount.toString(),
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
                            '10 × 1',
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
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        Get.back() ;
                        Get.to(const PaymentMethodScreen());
                      },
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
