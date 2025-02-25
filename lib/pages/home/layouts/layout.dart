import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../views/home_page.dart';
import '../views/notifications_page.dart';
import '../views/account_page.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const NotificationsPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: const Color.fromRGBO(22, 22, 22, 0.94),
        activeColor: const Color.fromRGBO(10, 132, 255, 1),
        inactiveColor: const Color.fromRGBO(136, 136, 136, 1),
        height: 60, // Adjust tab bar height
        items: [
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 7, left: 22, right: 21),
              child: Icon(
                CupertinoIcons.home,
                size: 28,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 7, left: 22, right: 21),
                  child: Icon(
                    CupertinoIcons.tray,
                    size: 28,
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 6,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(241, 60, 60, 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
            label: "Notifications",
          ),
          const BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 7, left: 22, right: 21),
              child: Icon(
                CupertinoIcons.person_crop_circle_fill,
                size: 28,
              ),
            ),
            label: "Account",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          backgroundColor: Colors.black,
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              index == 0
                  ? 'Home'
                  : index == 1
                      ? 'Notifications'
                      : 'Account',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'SFProDisplay',
              ),
            ),
            padding:
                const EdgeInsetsDirectional.only(start: 22, end: 21, top: 5),
          ),
          child: SafeArea(
            child: _pages[_selectedIndex],
          ),
        );
      },
    );
  }
}
