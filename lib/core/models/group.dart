import 'package:flutter/material.dart';
import 'package:traces/core/utils/app_icons.dart';

enum Group {
  inTransit(
    "In Transit",
    AppIcons.path,
    Color(0xFF2B2D1D),
    Color.fromRGBO(235, 247, 102, 0.9),
  ),
  outForDelivery(
    "Out for Delivery",
    AppIcons.arrowForward,
    Color.fromRGBO(150, 97, 25, 0.33),
    Color.fromRGBO(235, 181, 84, 0.8),
  ),
  delivered(
    "Delivered",
    AppIcons.tickmark,
    Color.fromRGBO(10, 40, 18, 0.8),
    Color.fromRGBO(91, 218, 124, 0.8),
  ),
  canceled(
    "Canceled",
    AppIcons.close,
    Color.fromRGBO(126, 0, 2, 0.5),
    Color.fromRGBO(251, 189, 206, 0.9),
  ),
  others(
    "Other Shipments",
    null,
    Color.fromRGBO(255, 255, 255, 0.2),
    Color.fromRGBO(255, 255, 255, 0.75),
  );

  final String label; // Custom label for display
  final String? iconPath;
  final Color background;
  final Color color;

  const Group(this.label, this.iconPath, this.background, this.color);
}
