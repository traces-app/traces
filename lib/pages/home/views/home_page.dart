import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: Stack(
          children: [
            AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: const Padding(
                padding: EdgeInsets.zero,
                child: Text(
                  'Shipments',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF), // Primary Label Color
                    fontFamily: 'SF Pro Display',
                    fontSize: 34, // Font size applied
                    fontWeight: FontWeight.w700, // Bold
                    height: 36.9 / 34, // Line height applied
                    letterSpacing: 0.337, // Letter spacing applied
                  ),
                ),
              ),
              centerTitle: false,
            ),
            Positioned(
              top: 3,
              right: 16,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.add_circled_solid,
                  color: Colors.blue,
                  size: 32,
                ),
                onPressed: () {
                  _showAddShipmentModal(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Search Bar Removed**

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  void _showAddShipmentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New Shipment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Tracking Number",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Add Shipment", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}