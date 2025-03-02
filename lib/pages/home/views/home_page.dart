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
            // Search Bar
            Container(
              width: 409,
              height: 40,
              padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.search,
                      color: Colors.grey, size: 18),
                  const SizedBox(width: 7),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        height: 22 / 17,
                        letterSpacing: -0.41,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          height: 22 / 17,
                          letterSpacing: -0.41,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Scrollable Filter Chips
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip(
                        "All", "5", const Color(0xFF002D62), Colors.white),
                    const SizedBox(width: 15),
                    _buildFilterChipWithIcon(
                        "Delivered",
                        "2",
                        CupertinoIcons.checkmark,
                        const Color(0xFF303030),
                        Colors.white70),
                    const SizedBox(width: 15),
                    _buildFilterChipWithIcon(
                        "In Transit",
                        "0",
                        CupertinoIcons.location,
                        const Color(0xFF303030),
                        Colors.white60),
                    const SizedBox(width: 15),
                    _buildFilterChip("Cancelled", "0", const Color(0xFF303030),
                        Colors.white54),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 35),

            // No Shipments Found UI
            const NoShipmentsWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(
      String label, String count, Color backgroundColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          Text(
            count,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChipWithIcon(String label, String count, IconData icon,
      Color backgroundColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          Text(
            count,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
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
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Tracking Number",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Add Shipment",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}

// No Shipments Found Widget
class NoShipmentsWidget extends StatelessWidget {
  const NoShipmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(CupertinoIcons.cube_box, color: Colors.white60, size: 40),
        SizedBox(height: 10),
        Text(
          "No Shipments Found",
          style: TextStyle(color: Colors.white60, fontSize: 18),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tap on ", style: TextStyle(color: Colors.white38)),
            Icon(CupertinoIcons.add_circled, color: Colors.blue, size: 18),
            Text(" in the top right corner",
                style: TextStyle(color: Colors.white38)),
          ],
        ),
        Text("to link a new shipment", style: TextStyle(color: Colors.white38)),
      ],
    );
  }
}
