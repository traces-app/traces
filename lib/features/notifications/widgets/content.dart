import 'package:flutter/material.dart';
import 'package:traces/features/notifications/widgets/notification_item.dart';
import 'package:traces/core/models/notification_type.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20.0),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "New",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(241, 60, 60, 0.6),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Column(
                    children: [
                      NotificationItem(
                        type: NotificationType.arrived,
                        identifier: "TX 268 431",
                        timestamp: "16m",
                        description:
                            "Arrived at Anuradhapura Warehouse and is being processed for the next transit step.",
                      ),
                      NotificationItem(
                        type: NotificationType.shipmentCreated,
                        iconImageUrl: "assets/icons/starbucks.png",
                        identifier: "TX 268 431",
                        timestamp: "16m",
                        description:
                            "Starbucks Corporation, added a new shipment linking to you.",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color.fromRGBO(84, 84, 88, 0.4),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Earlier",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      NotificationItem(
                        type: NotificationType.arrived,
                        identifier: "TX 268 431",
                        timestamp: "16m",
                        description:
                            "Arrived at Kurunegala Warehouse and is being processed for the next transit step.",
                      ),
                      NotificationItem(
                        type: NotificationType.delivered,
                        iconImageUrl: "assets/icons/starbucks.png",
                        identifier: "TX 268 431",
                        timestamp: "1d",
                        description:
                            "Your shipment has been successfully delivered to its destination.",
                      ),
                      NotificationItem(
                        type: NotificationType.outForDelivery,
                        identifier: "TX 268 431",
                        timestamp: "4h",
                        description:
                            "Shipment is out for delivery and will arrive at the destination soon.",
                      ),
                      NotificationItem(
                        type: NotificationType.arrived,
                        identifier: "TX 268 431",
                        timestamp: "16m",
                        description:
                            "Arrived at Colombo Distribution Center and is being prepared for dispatch.",
                      ),
                      NotificationItem(
                        type: NotificationType.arrived,
                        identifier: "TX 268 431",
                        timestamp: "16m",
                        description:
                            "Arrived at Kurunegala Warehouse and is being processed for the next transit step.",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
