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
              Navigator.canPop(context)
                  ? Positioned(
                      right: 10,
                      top: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // go back
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white.withOpacity(0.7),
                          size: 25.5,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
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
