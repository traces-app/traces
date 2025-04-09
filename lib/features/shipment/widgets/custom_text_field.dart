import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isEditable;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.isEditable = true,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(); // Remove initial text
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Label**
          Text(
            widget.label,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.40),
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              fontFamily: "SF Pro Text",
              letterSpacing: -0.408,
            ),
          ),
          SizedBox(height: 6.0),

          /// **Text Field**
          TextFormField(
            controller: _controller,
            enabled: widget.isEditable,
            cursorColor: Colors.white70,
            style: TextStyle(
              color: Color.fromRGBO(235, 235, 245, 0.60),
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontFamily: "SF Pro Text",
              letterSpacing: -0.408,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16, 11, 0, 10),
              filled: true,
              fillColor: Color.fromRGBO(28, 28, 30, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              hintText: widget.hint, // Correct way to set hintText
              hintStyle: TextStyle(
                color: Color.fromRGBO(235, 235, 245, 0.60),
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                fontFamily: "SF Pro Text",
                letterSpacing: -0.408,
              ),

              /// **Clear Button without Click Effect**
              suffixIcon: widget.isEditable
                  ? Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.clear(); // Clear text field
                          });
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Color(0xFF8E8E93),
                          size: 18,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
