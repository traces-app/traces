import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 409,
      height: 40,
      padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(CupertinoIcons.search, color: Colors.grey, size: 18),
          SizedBox(width: 7),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w500,
                fontSize: 17,
                height: 22 / 17,
                letterSpacing: -0.41,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  height: 22 / 17,
                  letterSpacing: -0.41,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
