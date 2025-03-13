import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/authentication/authentication.dart';
import 'package:traces/shared/widgets/password_strength_depiction.dart';
import 'package:traces/shared/widgets/styled_text_field_form.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

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
    return AuthenticationLayout(children: [
      GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            SizedBox(height: 10),
            Text(
              'Reset Your Password',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 25),
            StyledTextFormField(
              placeholder: "New Password",
              textEditingController: newPasswordController,
              // validator: validateNewPassword,
              type: "password",
            ),
            if (newPasswordController.text.isNotEmpty) ...[
              SizedBox(height: 27),
              ContainerBar(newPasswordController: newPasswordController),
              SizedBox(height: 27),
            ] else ...[
              SizedBox(height: 27),
            ],
            StyledTextFormField(
              placeholder: "Confirm New Password",
              textEditingController: confirmPasswordController,
              externalTextEditingController: newPasswordController,
              //  validator: validateConfirmPassword,
              type: "password",
            ),
            SizedBox(height: 41),
            ElevatedButton(
              onPressed: validateTextFields,
              child: Text(
                "Reset Password",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all(Color(0xFFD9D9D9)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
