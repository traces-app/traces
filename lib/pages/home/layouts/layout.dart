import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseLayout extends StatelessWidget {
  final List<Widget>? children;
  const BaseLayout({this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(index == 0 ? 'Home' : 'Settings'),
              ),
              child: SafeArea(
                child: Column(
                  children: children ?? [],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
