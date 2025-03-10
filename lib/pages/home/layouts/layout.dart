import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// linked pages
import '../views/home_page.dart';
import '../views/notifications_page.dart';
import '../views/account_page.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  static const _notifications = false;

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int _selectedIndex = 0;

  static const _pages = [
    HomePage(),
    NotificationsPage(),
    AccountPage(),
  ];

  static const _tabPadding =
      EdgeInsetsDirectional.only(top: 10, start: 22, end: 21);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: const Color.fromRGBO(22, 22, 22, 0.94),
        activeColor: const Color(0xff0A84FF),
        inactiveColor: const Color.fromRGBO(136, 136, 136, 1),
        height: 60,
        currentIndex: _selectedIndex,
        items: _buildTabItems(),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 26),
          child: _pages[_selectedIndex],
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildTabItems() {
    return [
      const BottomNavigationBarItem(
        icon: Padding(
          padding: _tabPadding,
          child: Icon(CupertinoIcons.home, size: 28),
        ),
        label: "Home",
      ),
      const BottomNavigationBarItem(
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: _tabPadding,
              child: Icon(CupertinoIcons.tray, size: 28),
            ),
            BaseLayout._notifications
                ? Positioned(
                    right: 12,
                    top: 6,
                    child: SizedBox(
                      width: 5,
                      height: 5,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(241, 60, 60, 1),
                            shape: BoxShape.circle),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        label: "Notifications",
      ),
      const BottomNavigationBarItem(
        icon: Padding(
          padding: _tabPadding,
          child: Icon(CupertinoIcons.person_crop_circle_fill, size: 28),
        ),
        label: "Account",
      ),
    ];
  }
}
