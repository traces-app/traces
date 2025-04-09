import 'package:flutter/material.dart';
import 'package:traces/core/models/status.dart';
import 'package:traces/shared/widgets/status_icon.dart';

class StatusDescriptionItem extends StatelessWidget {
  final Status type;
  final String description;
  final String time;
  final bool bubble;

  const StatusDescriptionItem({
    super.key,
    required this.type,
    required this.description,
    required this.time,
    this.bubble = false,
  });

  Color _getTextThemeColor() {
    switch (type) {
      case Status.delivered:
        return Color.fromRGBO(120, 210, 120, 1);
      case Status.canceled:
        return Color.fromRGBO(253, 108, 108, 1);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = _getTextThemeColor();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 12.0,
                  children: [
                    Text(
                      type.label.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500,
                        color: color.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 16.5,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500,
                        color: color.withOpacity(0.5),
                      ),
                    ),
                    if (bubble)
                      Container(
                        width: 4.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xff672903),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 3.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500,
                    color: color.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
        StatusIcon(
          type: type,
          size: 13.0,
        ),
      ],
    );
  }
}
