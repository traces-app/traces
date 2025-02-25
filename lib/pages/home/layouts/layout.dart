import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// linked pages
import '../views/home_page.dart';
import '../views/notifications_page.dart';
import '../views/account_page.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({super.key});

  static const _pages = [
    HomePage(),
    NotificationsPage(),
    AccountPage(),
  ];

  static const _tabPadding =
      EdgeInsetsDirectional.only(top: 7, start: 22, end: 21);

  static const _notifications = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: const Color.fromRGBO(22, 22, 22, 0.94),
        activeColor: const Color.fromRGBO(10, 132, 255, 1),
        inactiveColor: const Color.fromRGBO(136, 136, 136, 1),
        height: 60,
        items: _buildTabItems(),
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          backgroundColor: Colors.black,
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              ['Home', 'Notifications', 'Account'][index],
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontFamily: 'SFProDisplay'),
            ),
            padding: _tabPadding,
          ),
          child: SafeArea(child: _pages[index]),
        );
      },
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
            _notifications
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
