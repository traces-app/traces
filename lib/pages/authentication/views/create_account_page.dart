import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/authentication/authentication.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Setting background to black as per the wireframe
      body: Stack(
        children: [
          // Back Button at the top-right corner
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white.withOpacity(0.7),
                size: 24,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),  // Increased height to accommodate back button
                const Text(
                  "Enter Your Personal Information",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600, // Semi-bold title
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600, // Applying semi-bold weight for input text
                  ),
                  decoration: InputDecoration(
                    hintText: "First Name",  // Use hintText instead of labelText
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600, 
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,  // Set the border width when not focused
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,  // Set a thicker border width when focused
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600, // Applying semi-bold weight for input text
                  ),
                  decoration: InputDecoration(
                    hintText: "Last Name",  // Use hintText instead of labelText
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,  // Applying semi-bold weight for hint
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,  // Set the border width
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,  // Set a thicker border width when focused
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600, // Semi-bold button text
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CreateAccountPage(),
  ));
}
