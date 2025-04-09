import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.zero,
      backgroundColor: Colors.black,
      middle: const Text(
        "Map View",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      leading: Navigator.of(context).canPop()
          ? CupertinoNavigationBarBackButton(
              color: const Color(0xFF0A84FF),
              previousPageTitle: "Back",
              onPressed: () => Navigator.pop(context),
            )
          : null,
      trailing: IconButton(
        onPressed: () {
          // You can define search action here
        },
        icon: const Icon(
          CupertinoIcons.search,
          size: 24.0,
          color: Color(0xFF0A84FF),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
