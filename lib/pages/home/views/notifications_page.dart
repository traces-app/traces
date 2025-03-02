import 'package:flutter/material.dart';
import 'package:traces/shared/widgets/section_title.dart';
import 'package:traces/shared/widgets/notification_item.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Hardcoded notification data with timestamps
  final Map<String, List<Map<String, dynamic>>> categorizedNotifications = {
    'New': [
      {
        'trackingId': 'TX 268 431',
        'message':
            'Arrived at Kurunegala Warehouse and is being processed for the next transit step.',
        'icon': Icons.call_received,
        'color': Colors.yellow,
        'timestamp': DateTime.now().subtract(Duration(minutes: 16)),
        // 16 minutes ago
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'Starbucks Corporation, added a new shipment linking to you.',
        'icon': 'assets/icons/images.png',
        'color': Colors.blue,
        'timestamp': DateTime.now().subtract(Duration(hours: 2)), // 2 hours ago
      },
    ],
    'Today': [
      {
        'trackingId': 'TX 268 431',
        'message':
            'Shipment is out for delivery and will arrive at the destination soon.',
        'icon': Icons.arrow_forward,
        'color': Colors.orange,
        'timestamp': DateTime.now().subtract(Duration(hours: 4)), // 4 hours ago
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'UPS Logistics, canceled shipment as the courier was unable to pick up the package.',
        'icon': Icons.cancel,
        'color': Colors.red,
        'timestamp': DateTime.now().subtract(Duration(hours: 5)), // 5 hours ago
      },
    ],
    'Yesterday': [
      {
        'trackingId': 'TX 268 431',
        'message': 'Successfully arrived at the destination.',
        'icon': Icons.check_circle,
        'color': Colors.green,
        'timestamp': DateTime.now().subtract(Duration(days: 1)), // 1 day ago
      },
      {
        'trackingId': 'TX 268 431',
        'message': 'Chanel International, added a new shipment linking to you.',
        'icon': Icons.add_circle,
        'color': Colors.blue,
        'timestamp': DateTime.now().subtract(Duration(days: 1, hours: 2)),
        // 1 day and 2 hours ago
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'Starbucks Corporation, added a new shipment linking to you.',
        'icon': Icons.add_circle,
        'color': Colors.blue,
        'timestamp': DateTime.now().subtract(Duration(days: 1, hours: 3)),
        // 1 day and 3 hours ago
      },
    ],
    'Earlier': [
      {
        'trackingId': 'TX 268 431',
        'message':
            'Arrived at Colombo Distribution Center and is being prepared for dispatch.',
        'icon': Icons.call_received,
        'color': Colors.yellow,
        'timestamp': DateTime.now().subtract(Duration(days: 3)), // 3 days ago
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'Shipment has arrived at Kandy Warehouse and is awaiting transfer.',
        'icon': Icons.call_received,
        'color': Colors.yellow,
        'timestamp': DateTime.now().subtract(Duration(days: 4)), // 4 days ago
      },
    ],
  };

  // Calculate the total number of notifications dynamically
  int get notificationCount {
    return categorizedNotifications.values
        .expand((notifications) => notifications)
        .length;
  }

  // Function to calculate time difference (e.g., "16m", "2h", "1d")
  String _getTimeDifference(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m'; // Minutes ago
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h'; // Hours ago
    } else {
      return '${difference.inDays}d'; // Days ago
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Notifications',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    height: 36.9 / 34,
                    letterSpacing: 0.337,
                    fontFamily: "SF Pro Display")),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF411C1C),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                '$notificationCount',
                style: const TextStyle(
                  color: Color(0xFFF56666),
                  // Light red color
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  height: 38.745 / 21,
                  // Corrected placement
                  letterSpacing: 0.353, // Corrected placement
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: categorizedNotifications.isEmpty
          ? const Center(
              child: Text('No notifications available',
                  style: TextStyle(color: Colors.white)),
            )
          : ListView.separated(
              itemCount: categorizedNotifications.length,
              itemBuilder: (context, index) {
                final entry = categorizedNotifications.entries.elementAt(index);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(title: entry.key),
                    // Using the new SectionTitle widget
                    ...entry.value
                        .map(
                          (notification) => NotificationItem(
                            trackingId: notification['trackingId'],
                            message: notification['message'],
                            icon: notification['icon'],
                            iconColor: notification['color'],
                            timestamp: notification['timestamp'],
                            getTimeDifference:
                                _getTimeDifference, // Passing function reference
                          ),
                        )
                        .toList(),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(
                  thickness: 1, color: Color.fromRGBO(84, 84, 88, 0.35)),
            ),
    );
  }
}
