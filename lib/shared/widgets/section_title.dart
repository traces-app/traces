import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 15, 16, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
            ),
            if (title == "New") ...[
              const SizedBox(width: 6), // Spacing between text and dot
              Container(
                width: 6, // Size of the dot
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFF13C3C), // Dark red color for the dot
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
