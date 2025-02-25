import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to the Home Page',
          style: TextStyle(
              color: Color.fromRGBO(10, 132, 255, 1),
              decoration: TextDecoration.none, // Disable underline explicitly
              fontSize: 20)),
    );
  }
}
