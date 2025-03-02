import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/shared/widgets/search_bar.dart';
import 'package:traces/shared/widgets/filter_chips.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _shipments = [];

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
              title: const Text(
                'Shipments',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  height: 36.9 / 34,
                  letterSpacing: 0.337,
                ),
              ),
              centerTitle: false,
            ),
            Positioned(
              right: 16,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.add_circled_solid,
                  color: Color.fromRGBO(10, 132, 255, 1),
                  size: 32,
                ),
                onPressed: () {},
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
            const SearchBarWidget(),
            const SizedBox(height: 14),
            const FilterChipsWidget(),
            const SizedBox(height: 20),
            Expanded(
              child: _shipments.isEmpty
                  ? _buildNoShipmentsUI()
                  : ListView.builder(
                      itemCount: _shipments.length,
                      itemBuilder: (context, index) {
                        final shipment = _shipments[index];
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoShipmentsUI() {
    return Column(
      children: [
        const SizedBox(height: 60),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.cube,
                size: 40,
                color: Color.fromRGBO(118, 118, 128, 0.48),
              ),
              const SizedBox(height: 16),
              const Text(
                "No Shipments Found",
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  height: 21.48 / 18,
                  letterSpacing: -0.31,
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 25 / 18,
                      letterSpacing: -0.38,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    children: const [
                      TextSpan(text: "Tap on "),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            CupertinoIcons.add_circled_solid,
                            color: Color.fromRGBO(10, 132, 255, 1),
                            size: 18,
                          ),
                        ),
                      ),
                      TextSpan(
                          text:
                              " in the top right corner to link a new\nshipment"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
