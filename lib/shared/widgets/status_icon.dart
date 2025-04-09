import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/core/models/status.dart';

class StatusIcon extends StatelessWidget {
  final Status type;
  final double? size;

  const StatusIcon({
    super.key,
    required this.type,
    this.size = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: type.background,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          type.iconPath!,
          height: size,
          colorFilter: ColorFilter.mode(
            type.color,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  /*
  Status _getStatusTypeInfo(String type) {
    switch (type) {
      case "transit":
        return Status.inTransit;
      case "out":
        return Status.outForDelivery;
      case "delivered":
        return Status.delivered;
      case "canceled":
        return Status.canceled;
      case "initiated":
        return Status.initiated;
      default:
        throw ArgumentError("Invalid status type: $type");
    }
  }
*/
}
