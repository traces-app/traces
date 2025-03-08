import 'package:flutter/material.dart';
import 'package:traces/features/notifications/widgets/content.dart';
import 'package:traces/features/notifications/widgets/title_bar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const TitleBar(),
        centerTitle: false,
      ),
      body: const Content(),
    );
  }
}
