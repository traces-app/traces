import 'package:flutter/material.dart';
import 'dart:math';

class DashedOctagonPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final double strokeWidth;

  DashedOctagonPainter({
    this.dashWidth = 2,
    this.dashSpace = 2,
    this.color = const Color(0xFF8B0000),
    this.strokeWidth = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color.withOpacity(0.6)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Generate Hexagon Points
    List<Offset> octagonPoints = [];
    for (int i = 0; i < 8; i++) {
      double angle = (pi / 4) * i;
      octagonPoints.add(Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      ));
    }
    octagonPoints.add(octagonPoints[0]); // Close the hexagon

    // Draw Dashed Hexagon
    for (int i = 0; i < octagonPoints.length - 1; i++) {
      _drawDashedLine(canvas, octagonPoints[i], octagonPoints[i + 1], paint);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    double dx = end.dx - start.dx;
    double dy = end.dy - start.dy;
    double distance = sqrt(dx * dx + dy * dy);
    double dashCount = distance / (dashWidth + dashSpace);
    double dashDx = dx / dashCount;
    double dashDy = dy / dashCount;

    for (int i = 0; i < dashCount; i += 2) {
      final Offset startDash =
          Offset(start.dx + dashDx * i, start.dy + dashDy * i);
      final Offset endDash =
          Offset(start.dx + dashDx * (i + 1), start.dy + dashDy * (i + 1));
      canvas.drawLine(startDash, endDash, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
