import 'package:flutter/material.dart';
import 'package:traces/features/home/widgets/content.dart';
import 'package:traces/features/home/widgets/no_content.dart';
import 'package:traces/features/home/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _empty = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBar(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: _empty ? [NoContent()] : [Content()],
            ),
          ),
        ),
      ],
    );
  }
}
