import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String trackingId;
  final String message;
  final dynamic icon;
  final Color iconColor;
  final DateTime timestamp;
  final String Function(DateTime) getTimeDifference;
  final IconData? smallIcon;
  final Color? smallIconColor;

  const NotificationItem({
    super.key,
    required this.trackingId,
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.timestamp,
    required this.getTimeDifference,
    this.smallIcon,
    this.smallIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final timeDifference = getTimeDifference(timestamp);

    return ListTile(
      leading: _buildIcon(),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: trackingId,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(255, 255, 255, 0.8),
                fontSize: 17,
              ),
            ),
            TextSpan(
              text: "  $timeDifference",
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
      contentPadding:
          const EdgeInsets.fromLTRB(5, 10, 16, 10), // Adjusted padding
    );
  }

  Widget _buildIcon() {
    return Stack(
      clipBehavior: Clip.none, // Allows small icon to overlap
      children: [
        _buildMainIcon(),
        if (smallIcon != null)
          Positioned(
            bottom: -35,
            left: 1,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: smallIconColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  smallIcon,
                  color: iconColor,
                  size: 30,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMainIcon() {
    if (icon is String) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
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
          color: iconColor.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink(); // Hide if no valid icon is provided
    }
  }
}
