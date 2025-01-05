import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traces/core/utils/app_icons.dart';
import 'package:traces/pages/authentication/authentication.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/pages/authentication/cubit/activity_indicator_cubit.dart';
import 'package:traces/shared/widgets/styled_text_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(); // TODO: Configure Google Authentication Properly

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Text(
            "Enter Your Email Address",
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        BlocBuilder<ActivityIndicatorCubit, bool>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 21.0),
            child: StyledTextField(
              type: "email",
              placeholder: "user@example.com",
              focused: true,
              onSubmitted: (value) {
                context.read<ActivityIndicatorCubit>().toggle();
                Timer(
                  const Duration(seconds: 3),
                  () {
                    // manual 3 seconds waiting
                    context.read<ActivityIndicatorCubit>().toggle();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const PasswordPage(),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }),
        BlocBuilder<ActivityIndicatorCubit, bool>(builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 38.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.9),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 11,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                context.read<ActivityIndicatorCubit>().toggle();
                Timer(
                  const Duration(seconds: 3),
                  () {
                    // manual 3 seconds waiting
                    context.read<ActivityIndicatorCubit>().toggle();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const PasswordPage(),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Divider(
            color: Colors.white.withOpacity(0.15),
            thickness: 2,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 36, 36, 36),
              foregroundColor: Colors.white.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.5,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Opacity(
                opacity: 0.9,
                child: SvgPicture.asset(AppIcons.google),
              ),
            ),
            label: const Text(
              "Continue with Google",
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () async {
              try {
                // Trigger the Google Sign-In flow
                final GoogleSignInAccount? googleUser =
                    await GoogleSignIn().signIn();

                if (googleUser == null) {
                  return;
                }

                // Get authentication details from the Google account
                final GoogleSignInAuthentication googleAuth =
                    await googleUser.authentication;

                // Create a new credential for Firebase
                final OAuthCredential credential =
                    GoogleAuthProvider.credential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken,
                );

                // Sign in to Firebase with the Google credential
                final UserCredential userCredential = await FirebaseAuth
                    .instance
                    .signInWithCredential(credential);

                // Access the signed-in user
                final User? user = userCredential.user;

                if (user != null) {
                  debugPrint('Signed in successfully: ${user.displayName}');
                  // Add your navigation or other logic here
                } else {
                  debugPrint('Google Sign-In failed');
                }
              } catch (e) {
                debugPrint('Error during Google Sign-In: $e');
              }
            },
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 25.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 36, 36, 36),
              foregroundColor: Colors.white.withOpacity(0.9),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.5,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Opacity(
                opacity: 0.9,
                child: SvgPicture.asset(AppIcons.apple),
              ),
            ),
            label: const Text(
              "Continue with Apple",
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
