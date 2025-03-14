import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traces/pages/authentication/authentication.dart';
import 'package:traces/shared/widgets/styled_text_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  // Timer-related variables
  Timer? _timer;
  int _remainingTime = 60; // 1 minute in seconds

  // Animation controller for rotating the refresh icon
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.isNotEmpty && i < _controllers.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
        if (_controllers.every((controller) => controller.text.isNotEmpty)) {
          _navigateToForgotPassword();
        }
      });
    }

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 1 second per rotation
    );

    // Start the timer when the page loads
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  void _resetTimer() {
    // Start the rotation animation
    _animationController.repeat();

    // Stop the rotation after 3 seconds and start the timer
    Future.delayed(const Duration(seconds: 3), () {
      _animationController.stop();
      _animationController.reset();

      // Restart the timer
      setState(() {
        _remainingTime = 60; // Reset the timer to 1 minute
      });
      _startTimer();
    });
  }

  void _resetVerificationFields() {
    for (var controller in _controllers) {
      controller.clear(); // Clear all text fields
    }
    _focusNodes[0].requestFocus(); // Focus on the first field
  }

  void _navigateToForgotPassword() async {
    FocusScope.of(context).unfocus(); // Dismiss the keyboard
    await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const ForgotPasswordPage(),
      ),
    );

    // Reset fields and timer when returning to the verification page
    _resetVerificationFields();
    _resetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to avoid memory leaks
    _animationController.dispose(); // Dispose the animation controller
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Format the remaining time as "MM:SS"
    String formattedTime =
        "${(_remainingTime ~/ 60).toString().padLeft(2, '0')}:${(_remainingTime % 60).toString().padLeft(2, '0')}";

    return AuthenticationLayout(
      children: [
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the left
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: RichText(
                text: const TextSpan(
                  text: "We've sent a verification code to your email address ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "(info@lithika.com)",
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Align text fields to the left
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right:
                            index < 3 ? 25.0 : 0), // Add spacing between fields
                    child: SizedBox(
                      width: 75.0,
                      height: 60.0,
                      child: StyledTextField(
                        type: "number",
                        placeholder: "",
                        focused: index == 0,
                        compare: null,
                        onSubmitted: (value) {},
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(1),
                        ],
                        disableClearIcon: true, // Disable the 'x' icon
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: _remainingTime > 0
                  ? const Color.fromARGB(255, 18, 18, 18)
                  // Muted background while timer is running
                  : const Color.fromARGB(255, 28, 28, 28),
            ),
            child: TextButton(
              onPressed: _remainingTime == 0
                  ? () {
                      // Resend verification logic
                      _resetTimer(); // Reset the timer when resending the code
                    }
                  : null, // Disable the button if the timer is still running
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: _remainingTime > 0
                  ? RichText(
                      text: TextSpan(
                        text: "Resend code via SMS ",
                        style: const TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 0.40),
                        ),
                        children: [
                          TextSpan(
                            text: formattedTime, // Timer text
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(255, 255, 255, 0.50),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0)
                              .animate(_animationController), // Rotate the icon
                          child: Icon(
                            Icons.refresh, // Use the refresh icon
                            color: Colors.white.withOpacity(0.6),
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Add spacing between icon and text
                        const Text(
                          "Resend code via SMS",
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 0.60),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
