import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/returns/returns_policy_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class EligibilityView extends StatelessWidget {
  const EligibilityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 29.0, left: 25.0, right: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Report a Return",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 3.0),
                Text(
                  "Start a return in just a few steps. Choose your item, select a return method, and get your refund quickly.",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0x99FFFFFF),
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildDateSelector(context, "Thu Jan 30"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "—",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(86, 237, 126, 0.5),
                        ),
                      ),
                    ),
                    _buildDateSelector(context, "Thu Jan 30", showCheck: true),
                  ],
                ),
                SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final modal = context
                          .findAncestorStateOfType<ModalBottomSheetState>();
                      modal?.navigateTo(ReturnsPolicyView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0A84FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      minimumSize: Size(391, 47),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
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

  Widget _buildDateSelector(BuildContext context, String date,
      {bool showCheck = false}) {
    return Row(
      children: [
        Icon(
          CupertinoIcons.calendar,
          color: Color.fromRGBO(86, 237, 126, 0.5),
          size: 20,
        ),
        SizedBox(width: 6),
        Text(
          date,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(86, 237, 126, 0.5),
          ),
        ),
        if (showCheck) ...[
          SizedBox(width: 10.0),
          Icon(CupertinoIcons.check_mark,
              color: Color.fromRGBO(86, 237, 126, 0.5), size: 18),
        ]
      ],
    );
  }
}
