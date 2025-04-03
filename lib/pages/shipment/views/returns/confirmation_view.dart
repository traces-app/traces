import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class ConfirmationView extends StatelessWidget {
  const ConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 25.0, right: 25.0),
            child: Column(
              children: [
                Container(
                  width: 53,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF0A84FF), width: 4),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.check_mark,
                      size: 35,
                      color: Color(0xFF0A84FF),
                    ),
                  ),
                ),
                SizedBox(height: 35.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Expected Pickup Date",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 14),
                    Icon(
                      CupertinoIcons.calendar,
                      size: 14,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Thu Jan 30",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Text(
                  "Your return request has been received",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 14.0),
                Text(
                  "A driver will come to pick up your return item from your provided address. Please ensure the item is securely packed and ready for collection.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
