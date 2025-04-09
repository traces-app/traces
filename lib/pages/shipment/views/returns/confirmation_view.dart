import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/core/utils/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
            padding: const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0),
            child: Column(
              children: [
                Center(
                    child: SvgPicture.asset(
                  height: 45.0,
                  AppIcons.checkmark,
                )),
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
                    SizedBox(width: 16),
                    Icon(
                      CupertinoIcons.calendar,
                      size: 18,
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
                SizedBox(height: 12.0),
                Text(
                  "Your return request has been received",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 5.0),
                Text(
                  "A driver will come to pick up your return item from your provided address. Please ensure the item is securely packed and ready for collection.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.6),
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
