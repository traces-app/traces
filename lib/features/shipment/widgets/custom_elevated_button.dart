import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Make it nullable

  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.onPressed, // Allow null value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed == null
              ? Color(0xFF2C2C2E)
              : Color(0xFF0A84FF), // Gray when disabled
          padding: EdgeInsets.symmetric(vertical: 14.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        onPressed: onPressed, // If null, button is disabled
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: onPressed == null
                ? Color.fromRGBO(255, 255, 255, 0.5)
                : Colors.white,
            fontFamily: "SF Pro Text",
          ),
        ),
      ),
    );
  }
}
