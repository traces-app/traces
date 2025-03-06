import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 409,
      height: 40,
      padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
      decoration: BoxDecoration(
        color: Color.fromRGBO(118, 118, 128, 0.24),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            CupertinoIcons.search,
            color: Color.fromRGBO(235, 235, 245, 0.6),
            size: 20,
          ),
          SizedBox(width: 7),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.white70,
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: -0.41,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.only(bottom: 1.5),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: -0.41,
                  color: Color.fromRGBO(235, 235, 245, 0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
