import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/core/models/status.dart';

class StatusIcon extends StatelessWidget {
  final String type;
  final double _defaultIconSize = 12.0;

  const StatusIcon({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    Status status = _getStatusTypeInfo(type);

    return Container(
      width: 25.0,
      height: 25.0,
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: status.background,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          status.iconPath!,
          height: _defaultIconSize,
          colorFilter: ColorFilter.mode(
            status.color,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

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
}
