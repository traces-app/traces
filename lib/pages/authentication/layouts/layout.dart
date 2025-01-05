import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traces/pages/authentication/cubit/activity_indicator_cubit.dart';

class AuthenticationLayout extends StatelessWidget {
  final List<Widget>? children;
  const AuthenticationLayout({this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (_) => ActivityIndicatorCubit(),
        child: SingleChildScrollView(
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
                BlocBuilder<ActivityIndicatorCubit, bool>(
                  builder: (context, visible) {
                    return Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: IgnorePointer(
                        ignoring: !visible,
                        child: AnimatedOpacity(
                          opacity: visible ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                          child: SizedBox(
                            child: Container(
                              color: Colors.black.withOpacity(0.6),
                              child: const Center(
                                child: CupertinoActivityIndicator(
                                  radius: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
