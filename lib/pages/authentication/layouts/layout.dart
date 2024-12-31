import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final List<Widget>? children;
  const AuthenticationLayout({this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              /*
              Positioned(
                right: 22.0,
                top: 6.0,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white.withOpacity(0.8),
                  size: 25.5,
                ),
              ),
              */
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...(children ?? []),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
