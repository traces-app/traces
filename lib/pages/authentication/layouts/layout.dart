import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final List<Widget>? children;
  const AuthenticationLayout({this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            ...(children ?? []),
          ],
        ),
      ),
    );
  }
}
