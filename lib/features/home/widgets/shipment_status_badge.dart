import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShipmentStatusBadge extends StatelessWidget {
  final String statusText;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon; // ✅ Made `icon` nullable (optional)

  const ShipmentStatusBadge({
    super.key,
    required this.statusText,
    required this.backgroundColor,
    required this.textColor,
    this.icon, // ✅ Now `icon` is optional
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.8, vertical: 2.94),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    statusText,
                    style: TextStyle(
                      fontFamily:
                          'SF Pro Text', // Ensure this font is available
                      fontSize: 18.326,
                      fontWeight: FontWeight.w500,
                      height: 23.716 / 18.326, // Line height ratio
                      letterSpacing: -0.44,
                      color: textColor,
                    ),
                  ),

                  // ✅ Only show icon if it's not null
                  if (icon != null) ...[
                    const SizedBox(width: 9), // Space between text and icon
                    Icon(
                      icon,
                      color: textColor,
                      size: 18.326, // Same as text size
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_up_chevron_down,
              color: Colors.white54,
              size: 16,
            ),
          ],
        ),

        // ✅ Divider for visual separation
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.white24,
          margin: const EdgeInsets.symmetric(vertical: 15),
        ),
      ],
    );
  }
}
