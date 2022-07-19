import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../my_widgets/home_events_custom_card.dart';
import 'event_detail_screen.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  final List<String> _eventDays = [
    'All',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  String _selectedDay = 'All';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: MyAppColors.appSecondaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),);
    return Scaffold(

      backgroundColor: MyAppColors.greyButtonColor.withOpacity(0.5),
      appBar: AppBar(

        title: Text(
          'Events',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: 1.5,
                color: Colors.black,
              ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              // color: Colors.blueGrey,
              padding: const EdgeInsets.only(top: 28, bottom: 20),
              child: ListView.builder(
                itemCount: _eventDays.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedDay = _eventDays[index];
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.5,
                        // padding: EdgeInsets.all(12),
                        maximumSize: const Size(80, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPrimary: MyAppColors.signInTextColor,
                        primary: _selectedDay == _eventDays[index]
                            ? MyAppColors.appSecondaryColor
                            : MyAppColors.greyButtonColor,
                      ),
                      child: Text(
                        _eventDays[index],
                        style: Theme.of(context).textTheme.button!.copyWith(
                              color: _selectedDay == _eventDays[index]
                                  ? MyAppColors.signInTextColor
                                  : Colors.black,
                            ),
                      ),
                    ),
                  );
                  // return Container(
                  //   // height: 10,
                  //   // width: 20,
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   margin:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 23),
                  //   decoration: BoxDecoration(
                  //     color: Colors.blue,
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       _eventDays[index].toString(),
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
            Container(
              height: Get.height * .71,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _selectedDay == 'All'
                  ? ListView.builder(
                      itemCount: 5,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return EventsCustomCard(
                          titleText: 'Title Text ${1 + index}',
                          date: 'Thursday, Jun ${11 + index}, 2022',
                          time: '${11 + index}:${32 + index}',
                          price: (10 + index),
                          totalSlots: (23 + index),
                          filledSlots: (11 + index),
                          leagueImage: index == 2
                              ? 'assets/icons_png/event_$index.jpeg'
                              : 'assets/icons_png/event_$index.jpg',
                          onTap: () {
                            Get.to( EventDetailScreen());
                          },
                        );
                      })
                  : Center(
                      child:
                          Text('No events for ${_selectedDay.toString()}...')),
            ),
          ],
        ),
      ),
    );
  }
}
