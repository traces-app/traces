import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white70,
      decoration: InputDecoration(
        isCollapsed: true,
        filled: true,
        fillColor: Color.fromRGBO(118, 118, 128, 0.24),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "Search",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          letterSpacing: -0.41,
          color: Color.fromRGBO(235, 235, 245, 0.6),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 5.0,
          ),
          child: Icon(
            CupertinoIcons.search,
            color: Color.fromRGBO(235, 235, 245, 0.6),
            size: 20,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        letterSpacing: -0.41,
        color: Colors.white,
      ),
      enabled: false,
    );
  }
}
