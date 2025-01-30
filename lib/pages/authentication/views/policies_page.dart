import 'package:flutter/material.dart';
import 'package:traces/pages/authentication/authentication.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Review Policies and Create Account",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome to Traces",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Thank you for signing up! Before creating your account, "
                    "please review the following summary of our key terms and policies. "
                    "By continuing, you agree to these terms.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        // Terms of Service
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Terms of Service Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.attach_file, size: 18, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "By using our platform, you agree to our Terms of Service.You are responsible for your account information and ensuring it is used lawfully.All content is protected by intellectual property laws.We are not liable for any damages resulting from your use of the service.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),

        // Privacy Policy
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Privacy Policy Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.attach_file, size: 18, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "We collect and use your personal information like name and email address to provide and improve our services. We may share data with trusted partners but never sell it. You can access, update, or delete your data anytime.By using our platform, you agree to our data collection practices.",
                style: TextStyle(
                  fontSize: 16,
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
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "I agree to Terms and Privacy Policy",
                  style: TextStyle(
                    fontSize: 18,
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
                  width: 24,
                  height: 24,
                  child: _isChecked
                      ? const Icon(Icons.check, color: Colors.white, size: 16)
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
                onPressed: _isChecked
                    ? () {}
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: _isChecked ? Colors.white : Colors.white24, // Dim button if disabled
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: _isChecked ? 5 : 0,
                ),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: _isChecked ? Colors.black : Colors.white38, // Dim text when disabled
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