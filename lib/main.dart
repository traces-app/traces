import 'package:flutter/material.dart';
import 'package:traces/core/services/notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:traces/pages/home/layouts/layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationsService().initialize();
  runApp(const RootWidget());
}

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traces',
      theme: ThemeData.dark(),
      home: const BaseLayout(),
    );
  }
}
