import 'package:flutter/cupertino.dart';
import 'package:traces/core/models/notification_type.dart';

NotificationTypeDetails getNotificationTypeData(NotificationType type) {
  switch (type) {
    case NotificationType.arrived:
      return const NotificationTypeDetails(
        icon: CupertinoIcons.arrow_down_left,
        color: Color(0xFFCDD93C),
        background: Color.fromRGBO(205, 217, 60, 0.2),
      );
    case NotificationType.outForDelivery:
      return const NotificationTypeDetails(
        icon: CupertinoIcons.arrow_right,
        color: Color.fromRGBO(255, 165, 0, 0.9),
        background: Color.fromRGBO(128, 97, 54, 0.42),
      );
    case NotificationType.delivered:
      return const NotificationTypeDetails(
        icon: CupertinoIcons.check_mark,
        color: Color(0xFF33C75A),
        background: Color.fromRGBO(0, 189, 49, 0.21),
      );
    case NotificationType.canceled:
      return const NotificationTypeDetails(
        icon: CupertinoIcons.xmark,
        color: Color.fromARGB(255, 209, 37, 40),
        background: Color.fromRGBO(211, 2, 2, 0.27),
      );
    case NotificationType.shipmentCreated:
      return const NotificationTypeDetails(
        icon: CupertinoIcons.add,
        color: Color(0xFF73A9E3),
        background: Color.fromRGBO(0, 48, 99, 0.46),
      );
  }
}

class NotificationTypeDetails {
  final IconData icon;
  final Color color;
  final Color background;

  const NotificationTypeDetails({
    required this.icon,
    required this.color,
    required this.background,
  });
}
