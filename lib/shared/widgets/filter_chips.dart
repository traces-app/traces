import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterChipsWidget extends StatelessWidget {
  const FilterChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip(
              "All",
              "5",
              const Color.fromRGBO(0, 69, 139, 0.58),
              const Color.fromRGBO(162, 205, 249, 0.8),
            ),
            const SizedBox(width: 15),
            _buildFilterChipWithIcon(
              "Delivered",
              "2",
              CupertinoIcons.checkmark,
              const Color.fromRGBO(118, 118, 128, 0.24),
              const Color.fromRGBO(235, 235, 245, 0.6),
            ),
            const SizedBox(width: 15),
            _buildFilterChipWithIcon(
              "In Transit",
              "0",
              CupertinoIcons.checkmark,
              const Color.fromRGBO(118, 118, 128, 0.24),
              const Color.fromRGBO(235, 235, 245, 0.64),
            ),
            const SizedBox(width: 15),
            _buildFilterChip(
              "Cancelled",
              "0",
              const Color.fromRGBO(118, 118, 128, 0.24),
              const Color.fromRGBO(235, 235, 245, 0.64),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(
      String label, String count, Color backgroundColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(26.46),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            count,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChipWithIcon(
    String label,
    String count,
    IconData icon,
    Color backgroundColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(26.46),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            count,
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
