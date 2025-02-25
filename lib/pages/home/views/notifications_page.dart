import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications Page',
          style: TextStyle(
              color: Color.fromRGBO(10, 132, 255, 1),
              decoration: TextDecoration.none, // Disable underline explicitly
              fontSize: 20)),
    );
  }
}
