import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String trackingId;
  final String message;
  final dynamic icon;
  final Color iconColor;
  final DateTime timestamp;
  final String Function(DateTime)
      getTimeDifference; // Function to calculate time difference

  const NotificationItem({
    super.key,
    required this.trackingId,
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.timestamp,
    required this.getTimeDifference,
  });

  @override
  Widget build(BuildContext context) {
    final timeDifference =
        getTimeDifference(timestamp); // Calculate time difference

    return ListTile(
      leading: _buildIcon(),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: trackingId, // Tracking ID in bold
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(255, 255, 255, 0.8),
                fontSize: 17,
              ),
            ),
            TextSpan(
              text: "  $timeDifference", // Time difference in lighter text
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.9),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(5, 10, 16, 2),
    );
  }

  Widget _buildIcon() {
    if (icon is String) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          icon,
          width: 45,
          height: 45,
          fit: BoxFit.cover,
        ),
      );
    } else if (icon is IconData) {
      return Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
