import 'package:flutter/material.dart';
import 'package:traces/pages/authentication/authentication.dart';
import 'package:flutter/cupertino.dart';

class PoliciesPage extends StatefulWidget {
  const PoliciesPage({super.key});

  @override
  State<PoliciesPage> createState() => _PoliciesPageState();
}

class _PoliciesPageState extends State<PoliciesPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AuthenticationLayout(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Review Policies and Create Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to Traces",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Thank you for signing up! Before creating your account please review the following summary of our key terms and policies. ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(153, 255, 255, 255),
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: "By continuing, you agree to these terms.",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(198, 255, 255, 255),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Terms of Service
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Terms of Service Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(CupertinoIcons.link, size: 18, color: Colors.blue),
                ],
              ),
              SizedBox(height: 10),
              // Text(
              //   "By using our platform, you agree to our Terms of Service.You are responsible for your account information and ensuring it is used lawfully.All content is protected by intellectual property laws.We are not liable for any damages resulting from your use of the service.",
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w500,
              //     color: Colors.white70,
              //     height: 1.6,
              //   ),
              // ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "By using our platform, you agree to our Terms of Service. ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(153, 255, 255, 255),
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text:
                          "You are responsible for your account information and ensuring it is used lawfully",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(198, 255, 255, 255),
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text:
                          "All content is protected by intellectual property laws.We are not liable for any damages resulting from your use of the service. ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(153, 255, 255, 255),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Privacy Policy
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Privacy Policy Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(CupertinoIcons.link, size: 18, color: Colors.blue),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "We collect and use your personal information like name and email address to provide and improve our services. We may share data with trusted partners but never sell it. You can access, update, or delete your data anytime.By using our platform, you agree to our data collection practices.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Checkbox and Agreement
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text(
                  "I agree to Terms and Privacy Policy",
                  style: TextStyle(
                    fontSize: 17.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isChecked ? Colors.blue : Colors.white70,
                      width: 2.5,
                    ),
                    color: _isChecked ? Colors.blue : Colors.transparent,
                  ),
                  width: 24.14,
                  height: 24.14,
                  child: _isChecked
                      ? const Icon(CupertinoIcons.checkmark,
                          color: Colors.white, size: 13)
                      : null,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        // Create Account Button
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isChecked ? () {} : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: _isChecked
                      ? Colors.white
                      : Colors.white24, // Dim button if disabled
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: _isChecked ? 5 : 0,
                ),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: _isChecked
                        ? Colors.black
                        : Colors.white38, // Dim text when disabled
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
