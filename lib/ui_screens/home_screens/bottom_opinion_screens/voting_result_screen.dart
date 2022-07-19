import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../dummy_data/my_dummy_data.dart';
import '../my_home_screen.dart';

class VotingResultScreen extends StatefulWidget {
  const VotingResultScreen({Key? key}) : super(key: key);

  @override
  State<VotingResultScreen> createState() => _VotingResultScreenState();
}

class _VotingResultScreenState extends State<VotingResultScreen> {
  int index = 0;
  bool isFinished = false;

  double _yesWidth = Get.width * .8, _yesHeight = Get.height * .07;
  double _noWidth = Get.width * .8, _noHeight = Get.height * .07;

  likedAnimate() {
    setState(
      () {
        _yesWidth = Get.width * .9;
        _yesHeight = Get.height * .09;
      },
    );
    Timer(
      const Duration(milliseconds: 100),
      () {
        setState(
          () {
            _yesWidth = Get.width * .8;
            _yesHeight = Get.height * .07;
          },
        );
      },
    );
  }

  dislikedAnimate() {
    setState(
      () {
        _noWidth = Get.width * .9;
        _noHeight = Get.height * .09;
      },
    );
    Timer(
      const Duration(milliseconds: 100),
      () {
        setState(
          () {
            _noWidth = Get.width * .8;
            _noHeight = Get.height * .07;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Voting Results',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: 1.5,
                color: Colors.black,
              ),
        ),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          // height: Get.height,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                height: 250,
                width: 220,
                // alignment: Alignment.center,
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    myContents[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              isFinished
                  ? SizedBox(
                      width: 220,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.off(const MyHomeScreen(
                            isReturnVR: true,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 2,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPrimary: MyAppColors.appSecondaryColor),
                        child: Text(
                          'Done',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: MyAppColors.appSecondaryColor,
                                  ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              if (index >= 1) {
                                setState(() {
                                  index--;
                                });
                              } else {
                                mySnackBar(
                                    snackText: 'Date limit cannot be 0...');
                              }
                              myContents[index].isLiked
                                  ? likedAnimate()
                                  : dislikedAnimate();
                            },
                            elevation: 2,
                            mini: true,
                            backgroundColor: MyAppColors.appSecondaryColor,
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: MyAppColors.signInTextColor,
                              size: 25,
                            ),
                          ),
                          Text(
                            '${(index + 1).toString()}/${myContents.length}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              if (index == myContents.length - 2) {
                                setState(() {
                                  isFinished = true;
                                  index++;
                                });
                              } else if (index < myContents.length) {
                                setState(() {
                                  index++;
                                });
                              } else {
                                mySnackBar(snackText: 'DB errors...');
                              }
                              myContents[index].isLiked
                                  ? likedAnimate()
                                  : dislikedAnimate();
                            },
                            mini: true,
                            elevation: 2,
                            backgroundColor: MyAppColors.appSecondaryColor,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: MyAppColors.signInTextColor,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
              myContents[index].isLiked ? Text('Liked') : Text('Disliked'),
              const SizedBox(height: 35),
              Container(
                width: Get.width * .9,
                height: Get.height * .28,
                padding: const EdgeInsets.only(
                  // left: 25,
                  // right: 25,
                  top: 55,
                  // bottom: 25,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     myContents[index].isLiked
                    //         ? likedAnimate()
                    //         : dislikedAnimate();
                    //   },
                    //   child: Text('Change'),
                    // ),
                    AnimatedContainer(
                      height: _yesHeight,
                      width: _yesWidth,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: myContents[index].isLiked
                            ? MyAppColors.appSecondaryColor
                            : Colors.grey,
                      ),
                      duration: const Duration(milliseconds: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            '55 %',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    AnimatedContainer(
                      height: _noHeight,
                      width: _noWidth,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: myContents[index].isLiked
                            ? Colors.grey
                            : MyAppColors.appSecondaryColor,
                      ),
                      duration: const Duration(milliseconds: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            '55 %',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
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
