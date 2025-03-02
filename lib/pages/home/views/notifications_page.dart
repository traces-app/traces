import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Hardcoded notification data (can be moved to a separate file or fetched from an API)
  final Map<String, List<Map<String, dynamic>>> categorizedNotifications = {
    'New': [
      {
        'trackingId': 'TX 268 431',
        'message':
            'Arrived at Kurunegala Warehouse and is being processed for the next transit step.',
        'icon': Icons.call_received,
        'color': Colors.yellow,
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'Starbucks Corporation, added a new shipment linking to you.',
        'icon': Icons.add_circle,
        'color': Colors.blue,
      },
    ],
    'Today': [
      {
        'trackingId': 'TX 268 431',
        'message':
            'Shipment is out for delivery and will arrive at the destination soon.',
        'icon': Icons.arrow_forward,
        'color': Colors.orange,
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'UPS Logistics, canceled shipment as the courier was unable to pick up the package.',
        'icon': Icons.cancel,
        'color': Colors.red,
      },
    ],
    'Yesterday': [
      {
        'trackingId': 'TX 268 431',
        'message': 'Successfully arrived at the destination.',
        'icon': Icons.check_circle,
        'color': Colors.green,
      },
      {
        'trackingId': 'TX 268 431',
        'message': 'Chanel International, added a new shipment linking to you.',
        'icon': Icons.add_circle,
        'color': Colors.blue,
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'Starbucks Corporation, added a new shipment linking to you.',
        'icon': Icons.add_circle,
        'color': Colors.blue,
      },
    ],
    'Earlier': [
      {
        'trackingId': 'TX 268 431',
        'message':
            'Arrived at Colombo Distribution Center and is being prepared for dispatch.',
        'icon': Icons.call_received,
        'color': Colors.yellow,
      },
      {
        'trackingId': 'TX 268 431',
        'message':
            'Shipment has arrived at Kandy Warehouse and is awaiting transfer.',
        'icon': Icons.call_received,
        'color': Colors.yellow,
      },
    ],
  };

  // Calculate the total number of notifications dynamically
  int get notificationCount {
    return categorizedNotifications.values
        .expand((notifications) => notifications)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Notifications',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('$notificationCount',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      backgroundColor: Colors.black,
      body: categorizedNotifications.isEmpty
          ? Center(
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
                    _buildSectionTitle(entry.key),
                    ...entry.value
                        .map((notification) => _buildNotificationItem(
                            notification['trackingId'],
                            notification['message'],
                            notification['icon'],
                            notification['color']))
                        .toList(),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(color: Colors.grey),
            ),
    );
  }

  // Helper method to build section titles (e.g., "New", "Today")
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  // Helper method to build individual notification items
  Widget _buildNotificationItem(
      String trackingId, String message, IconData icon, Color iconColor) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 30),
      title: Text(
        trackingId,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
    );
  }
}
