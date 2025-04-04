import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OrderConfirmationView extends StatelessWidget {
  const OrderConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PickupLabel extends StatelessWidget {
  const PickupLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel(
      title: "Return Pickup Scheduled",
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      subtitle: Row(
        children: const [
          Text(
            "Expected Pickup Date",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Icon(CupertinoIcons.calendar, color: Colors.white, size: 18),
          SizedBox(width: 4),
          Text(
            "Thu Jan 30",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      description:
          "A driver will come to pick up your return item from your provided address. Please ensure the item is securely packed and ready for collection.",
      descriptionStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: Color.fromRGBO(217, 223, 145, 0.09),
      iconColor: Color(0xFFCDD93C),
    );
  }
}

class TransitLabel extends StatelessWidget {
  const TransitLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel(
      title: "Return In Transit",
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      description:
          "Your return is on its way back to the seller. The courier has picked up your item, and it is currently in transit.",
      descriptionStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: Color.fromRGBO(217, 223, 145, 0.09),
      iconColor: Color(0xFFCDD93C),
    );
  }
}

class ReceivedLabel extends StatelessWidget {
  const ReceivedLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel(
      title: "Returned Item(s) Received",
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      description:
          "Your returned item has been received by the seller and is now under review. The shop will inspect the item to determine if it meets the return criteria.",
      descriptionStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: Color.fromRGBO(217, 223, 145, 0.09),
      iconColor: Color(0xFFCDD93C),
    );
  }
}

class AcceptedLabel extends StatelessWidget {
  const AcceptedLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel(
      title: "Return Accepted",
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Color.fromRGBO(217, 223, 145, 0.09),
      iconColor: Color(0xFFCDD93C),
      statusIcon: CupertinoIcons.checkmark,
      statusIconColor: Colors.green,
    );
  }
}

class DeclinedLabel extends StatelessWidget {
  const DeclinedLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLabel(
      title: "Return Declined",
      titleStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: Color.fromRGBO(217, 223, 145, 0.09),
      iconColor: Color(0xFFCDD93C),
      statusIcon: CupertinoIcons.xmark,
      statusIconColor: Colors.red,
    );
  }
}

Widget _buildLabel({
  required String title,
  TextStyle? titleStyle,
  Widget? subtitle,
  String? date,
  TextStyle? dateStyle,
  String? description,
  TextStyle? descriptionStyle,
  required Color backgroundColor,
  required Color iconColor,
  IconData? statusIcon,
  Color? statusIconColor,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: subtitle,
                ),
              if (date != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    date,
                    style: dateStyle ??
                        TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                  ),
                ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    description,
                    style: descriptionStyle ??
                        TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 13,
                        ),
                  ),
                ),
            ],
          ),
        ),
        Icon(CupertinoIcons.refresh, color: iconColor),
        if (statusIcon != null) ...[
          const SizedBox(width: 6),
          Icon(statusIcon, color: statusIconColor),
        ]
      ],
    ),
  );
}
