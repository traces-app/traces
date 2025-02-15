// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// class BaseLayout extends StatelessWidget {
//   final List<Widget>? children;
//   const BaseLayout({this.children, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.home),
//             color: CupertinoColors.systemBlue,
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.tray),
//             label: "Notifications",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.person_crop_circle_fill),
//             label: "Account",
//           ),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         return CupertinoTabView(
//           builder: (context) {
//             return CupertinoPageScaffold(
//               navigationBar: CupertinoNavigationBar(
//                 middle: Text(index == 0 ? 'Home' : 'Settings'),
//               ),
//               child: SafeArea(
//                 child: Column(
//                   children: children ?? [],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseLayout extends StatelessWidget {
  final List<Widget>? children;
  const BaseLayout({this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // Use CupertinoTabBar directly
      tabBar: CupertinoTabBar(
        height: 80.0, // Set the height of the tab bar
        activeColor: Color.fromRGBO(10, 132, 255, 1), // Active icon color
        inactiveColor: Color.fromRGBO(136, 136, 136, 1), // Inactive icon color
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0), // Add top padding to the item
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.home), // Home icon
                  SizedBox(height: 4), // Space between icon and label
                  Text("Home"), // Home label
                ],
              ),
            ),
            label: "", // Empty label since we're handling it in the Column
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0), // Add top padding to the item
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.tray), // Notifications icon
                  SizedBox(height: 4), // Space between icon and label
                  Text("Notifications"), // Notifications label
                ],
              ),
            ),
            label: "", // Empty label since we're handling it in the Column
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0), // Add top padding to the item
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.person_crop_circle_fill), // Account icon
                  SizedBox(height: 4), // Space between icon and label
                  Text("Account"), // Account label
                ],
              ),
            ),
            label: "", // Empty label since we're handling it in the Column
          ),
        ],
      ),
      // Tab builder to handle the content for each tab
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              // Navigation bar with a title based on the selected tab
              navigationBar: CupertinoNavigationBar(
                middle: Text(
                  index == 0
                      ? 'Home'
                      : index == 1
                          ? 'Notifications'
                          : 'Account',
                ),
              ),
              // Main content of the tab
              child: SafeArea(
                child: Column(
                  children: children ??
                      [], // Use the provided children or an empty list
                ),
              ),
            );
          },
        );
      },
    );
  }
}
