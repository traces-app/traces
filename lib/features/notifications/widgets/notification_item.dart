import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/core/models/notification_type.dart';
import 'package:traces/features/notifications/utils/icons.dart';
import 'dart:ui';

class NotificationItem extends StatelessWidget {
  final NotificationType type;
  final String identifier;
  final String timestamp;
  final String description;
  final String? iconImageUrl;

  const NotificationItem({
    super.key,
    required this.type,
    required this.identifier,
    required this.timestamp,
    required this.description,
    this.iconImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    NotificationTypeDetails iconData = getNotificationTypeData(type);

    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomLeft,
            children: (iconImageUrl?.isEmpty ?? true)
                ? [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: iconData.background,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          iconData.icon,
                          color: iconData.color,
                          size: 26,
                        ),
                      ),
                    ),
                  ]
                : [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        iconImageUrl ?? "",
                        width: 35,
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: -3,
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 200.0,
                            sigmaY: 5.0,
                          ),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: iconData
                                  .background, // Semi-transparent overlay
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                iconData.icon,
                                color: iconData.color,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
          ),
          const SizedBox(width: 18.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      identifier,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 0.8),
                        fontSize: 16.5,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      timestamp,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        fontSize: 16.5,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2.0),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5,
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
