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
              const SizedBox(width: 12),
              Container(
                width: 4.4, // Size of the dot
                height: 4.4,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(241, 60, 60, 0.7),
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
