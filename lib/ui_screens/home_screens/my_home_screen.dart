import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/app_colors.dart';
import 'bottom_opinion_screens/opinion_screen.dart';
import 'bottom_my_event_screens/my_events_screen.dart';
import 'bottom_leagues_screens/my_leagues_and_competition.dart';
import 'bottom_profile_screens/profile_screen.dart';
import 'bottom_setting_screens/settings_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key, this.isReturnVR = false}) : super(key: key);

  final bool isReturnVR;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedScreenIndex = 0;

  final _screens = [
    MyEventsScreen(),
    MyLeaguesAndCompetition(),
    OpinionScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    if(widget.isReturnVR) {
      _selectScreen(2);
    }
    super.initState();
  }
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
      extendBodyBehindAppBar: true,
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        // selectedItemColor: Colors.blue,
        // showSelectedLabels: true,
        selectedItemColor: MyAppColors.signInTextColor,
        selectedIconTheme: Theme.of(context)
            .iconTheme
            .copyWith(color: MyAppColors.appSecondaryColor.withOpacity(0.7)),
        selectedLabelStyle:
            TextStyle(color: MyAppColors.signInTextColor, fontSize: 14),
        unselectedItemColor: MyAppColors.signInBgColor.withOpacity(0.7),
        // backgroundColor: Colors.blueGrey,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons_png/football.png')),
              label: 'Events'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                  AssetImage('assets/icons_png/bottom_nav_league.png')),
              label: 'Leagues'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons_png/polling.png')),
              label: 'Opinions'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons_png/account.png')),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons_png/setting.png')),
              label: 'Settings'),
        ],
      ),
    );
  }
}
