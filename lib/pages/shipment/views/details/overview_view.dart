import 'package:flutter/material.dart';

class OverviewView extends StatefulWidget {
  const OverviewView({super.key});

  @override
  State<OverviewView> createState() => _OverviewViewState();
}

class _OverviewViewState extends State<OverviewView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.3),
      child: Center(
        child: Text('Overview'),
      ),
    );
  }
}
