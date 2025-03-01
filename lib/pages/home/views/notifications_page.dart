import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
              child: const Text('4',
                  style: TextStyle(
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('New'),
            _buildNotificationItem(
                'TX 268 431',
                'Arrived at Kurunegala Warehouse and is being processed for the next transit step.',
                Icons.location_on,
                Colors.blue),
            _buildNotificationItem(
                'TX 268 431',
                'Starbucks Corporation, added a new shipment linking to you.',
                Icons.add_circle,
                Colors.green),
            _buildSectionTitle('Today'),
            _buildNotificationItem(
                'TX 268 431',
                'Shipment is out for delivery and will arrive at the destination soon.',
                Icons.local_shipping,
                Colors.orange),
            _buildNotificationItem(
                'TX 268 431',
                'UPS Logistics, canceled shipment as the courier was unable to pick up the package.',
                Icons.cancel,
                Colors.red),
            _buildSectionTitle('Yesterday'),
            _buildNotificationItem(
                'TX 268 431',
                'Successfully arrived at the destination.',
                Icons.check_circle,
                Colors.green),
            _buildNotificationItem(
                'TX 268 431',
                'Chanel International, added a new shipment linking to you.',
                Icons.add_circle,
                Colors.green),
            _buildNotificationItem(
                'TX 268 431',
                'Starbucks Corporation, added a new shipment linking to you.',
                Icons.add_circle,
                Colors.green),
            _buildSectionTitle('Earlier'),
            _buildNotificationItem(
                'TX 268 431',
                'Arrived at Colombo Distribution Center and is being prepared for dispatch.',
                Icons.location_on,
                Colors.blue),
            _buildNotificationItem(
                'TX 268 431',
                'Shipment has arrived at Kandy Warehouse and is awaiting transfer.',
                Icons.sync,
                Colors.grey),
          ],
        ),
      ),
    );
  }

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
