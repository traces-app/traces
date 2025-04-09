import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/authentication/authentication.dart';
import 'package:traces/features/authentication/widgets/password_strength_meter.dart';
import 'package:traces/shared/widgets/styled_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill this field ";
    } else if (value.length < 7) {
      return "Password is too short";
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d).+$').hasMatch(value)) {
      return "One capital letter and number required";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill this field ";
    } else if (newPasswordController.text != value) {
      return "Password fields aren't matched";
    }
    return null;
  }

  void validateTextFields() {
    if (_formKey.currentState!.validate()) {
      print("Validated Successfully");
    } else {
      print("Invalid Values");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Text(
            "Reset Your Password",
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 21.0),
          child: StyledTextField(
            type: "password",
            placeholder: "New Password",
            focused: true,
            controller: newPasswordController,
          ),
        ),
        const SizedBox(height: 10.0),
        PasswordStrengthMeter(newPasswordController: newPasswordController),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StyledTextField(
            type: "password",
            placeholder: "Confirm New Password",
            focused: true,
            compare: newPasswordController.text,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 36.0),
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
              "Reset Password",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const PasswordPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
