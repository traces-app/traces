import 'package:flutter/material.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({super.key});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      titleSpacing: 0.0,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          spacing: 12.0,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.337,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF411C1C),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                '4',
                style: TextStyle(
                  color: Color(0xFFF56666),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: 0.35,
                ),
              ),
            ),
          ],
        ),
      ),
      centerTitle: false,
    );
  }
}
