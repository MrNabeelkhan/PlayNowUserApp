import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../../utils/app_colors.dart';
import '../../dummy_data/my_dummy_data.dart';
import 'voting_result_screen.dart';

class OpinionScreen extends StatefulWidget {
  const OpinionScreen({Key? key}) : super(key: key);

  @override
  State<OpinionScreen> createState() => _OpinionScreenState();
}

class _OpinionScreenState extends State<OpinionScreen> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    for (int i = 0; i < myContents.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: Content(
              title: myContents[i].title,
              description: myContents[i].description,
              imagePath: myContents[i].imagePath,
              isLiked: myContents[i].isLiked),

          //Liked Function
          likeAction: () {
            setState(() {
              myContents[i].isLiked = true;
            });
            _scaffoldKey.currentState?.showSnackBar(
              SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: Container(
                  color: Colors.transparent,
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                        bottom: Get.height * .3, left: Get.width * .6),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      'assets/icons_png/thumbs_up_animated.gif',
                    ),
                  ),
                ),
                duration: const Duration(milliseconds: 200),
              ),
            );
          },

          //DisLiked Function
          nopeAction: () {
            myContents[i].isLiked = false;
            _scaffoldKey.currentState?.showSnackBar(
              SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: Container(
                  color: Colors.transparent,
                  child: Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                        bottom: Get.height * .3, right: Get.width * .6),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      'assets/icons_png/thumbs_down_animated.gif',
                    ),
                  ),
                ),
                duration: const Duration(milliseconds: 200),
              ),
            );
          },
          // superlikeAction: () {
          //   _scaffoldKey.currentState?.showSnackBar(SnackBar(
          //     content: Text("Superliked ${_names[i]}"),
          //     duration: Duration(milliseconds: 500),
          //   ));
          // },
          onSlideUpdate: (SlideRegion? region) async {
            // print("Region $region");
          },
        ),
      );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: MyAppColors.signInBgColor));

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyAppColors.greyButtonColor.withOpacity(0.5),
      appBar: AppBar(
        title: Text(
          'Opinion',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(),
        leadingWidth: 2,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons_png/opinions_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: 520,
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 48),
                child: SwipeCards(
                  matchEngine: _matchEngine!,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                image: DecorationImage(
                                    image:
                                        AssetImage(myContents[index].imagePath),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                myContents[index].title,
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height * .089,
                            width: Get.width * .9,
                            // color: Colors.blue,
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12, bottom: 12),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  myContents[index].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                  overflow: TextOverflow.clip,
                                  // style: const TextStyle(fontSize: 100),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  onStackFinished: () {
                    // mySnackBar(snackText: 'snackText');
                    Get.to(const VotingResultScreen());
                  },
                  itemChanged: (SwipeItem item, int index) {
                    // mySnackBar(snackText: 'snackText');
                  },
                  // upSwipeAllowed: true,
                  fillSpace: true,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () {
              //           _matchEngine!.currentItem?.nope();
              //         },
              //         child: Text("Nope")),
              //     ElevatedButton(
              //         onPressed: () {
              //           _matchEngine!.currentItem?.superLike();
              //         },
              //         child: Text("Superlike")),
              //     ElevatedButton(
              //         onPressed: () {
              //           _matchEngine!.currentItem?.like();
              //         },
              //         child: Text("Like"))
              //   ],
              // ),
              // Container(
              //   height: 100,
              //   width: 100,
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(50),
              //   ),
              //   child: Image.asset(
              //     'assets/icons_png/thumbs_up_animated.gif',
              //   ),
              // ),
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
