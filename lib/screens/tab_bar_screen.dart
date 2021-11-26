import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  final tabs = const [HomeScreen(), HomeScreen(), HomeScreen()];
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/bulb.svg'),
            label: "Light",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Icon feather-home.svg'),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Icon feather-settings.svg'),
              label: "Settings"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
