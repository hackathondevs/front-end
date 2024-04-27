import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackfest/app/pages/home/home_page.dart';
import 'package:hackfest/app/pages/kbs/kbs_maps_page.dart';
import 'package:hackfest/app/pages/point/point_page.dart';
import 'package:hackfest/app/pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<String> _activeIcons = [
    'assets/icons/home_active.svg',
    'assets/icons/kbs_maps_active.svg',
    'assets/icons/point_active.svg',
    'assets/icons/profile_active.svg',
  ];

  final List<String> _inactiveIcons = [
    'assets/icons/home_inactive.svg',
    'assets/icons/kbs_maps_inactive.svg',
    'assets/icons/point_inactive.svg',
    'assets/icons/profile_inactive.svg',
  ];

  final List<Widget> _pages = [
    HomePage(),
    KBSMapsPage(),
    PointPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildBottomNavBarItem(0),
            buildBottomNavBarItem(1),
            buildBottomNavBarItem(2),
            buildBottomNavBarItem(3),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavBarItem(int index) {
    return IconButton(
      icon: SvgPicture.asset(
        _currentIndex == index ? _activeIcons[index] : _inactiveIcons[index],
        width: 28.w,
        height: 28.h,
      ),
      onPressed: () {
        _onTabTapped(index);
      },
    );
  }
}
