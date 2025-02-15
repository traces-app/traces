import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseLayout extends StatelessWidget {
  final List<Widget>? children;
  const BaseLayout({this.children, super.key});

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
              padding: EdgeInsets.only(
                  top: 7, left: 22, right: 21), // Padding for Home icon
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
                // Red dot for notifications without border
                Positioned(
                  right: 12,
                  top: 6,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(241, 60, 60,
                          1), // Updated color to rgba(241, 60, 60, 1)
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
      ),
      tabBuilder: (context, index) {
        Widget middleText;
        if (index == 0) {
          middleText = const Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'SFProDisplay',
            ),
          );
        } else if (index == 1) {
          middleText = const Text(
            'Notifications',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'SFProDisplay',
            ),
          );
        } else {
          middleText = const Text(
            'Account',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'SFProDisplay',
            ),
          );
        }

        return CupertinoPageScaffold(
          backgroundColor: Colors.black, // Set the page color to black
          navigationBar: CupertinoNavigationBar(
            middle: middleText,
            padding: EdgeInsetsDirectional.only(start: 22, end: 21, top: 5),
          ),
          child: SafeArea(
            child: Column(
              children: children ?? [],
            ),
          ),
        );
      },
    );
  }
}
