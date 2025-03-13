import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:traces/core/models/group.dart';
import 'package:traces/core/utils/app_icons.dart';
import 'package:traces/pages/shipment/views/shipment_details_page.dart';
import 'package:traces/shared/utils/markdown.dart';

class ShipmentCard extends StatelessWidget {
  final Group type;
  final String identifier;
  final String timestamp;
  final String merchant;
  final String logistics;
  final bool bubble;
  final String? description;

  const ShipmentCard({
    super.key,
    required this.type,
    required this.identifier,
    required this.timestamp,
    required this.merchant,
    required this.logistics,
    this.bubble = false,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const ShipmentDetailsPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 3.0,
                      children: [
                        Row(
                          spacing: 16.0,
                          children: [
                            Text(
                              identifier,
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.5,
                                  color: (type == Group.canceled)
                                      ? Color(0xFFEDC9C9)
                                      : (type == Group.delivered)
                                          ? Color(0xFFC3EEC2)
                                          : Colors.white),
                            ),
                            Row(
                              spacing: 6.0,
                              children: [
                                if (type != Group.delivered &&
                                    type != Group.canceled)
                                  const Icon(
                                    CupertinoIcons.calendar,
                                    size: 19,
                                    color: Color.fromRGBO(255, 255, 255, 0.7),
                                  ),
                                Text(
                                  timestamp,
                                  style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500,
                                    // color: Color.fromRGBO(255, 255, 255, 0.7),
                                    letterSpacing: -0.5,
                                    color: (type == Group.canceled)
                                        ? Color.fromRGBO(237, 201, 201, 0.6)
                                        : (type == Group.delivered)
                                            ? Color.fromRGBO(195, 238, 194, 0.6)
                                            : Color.fromRGBO(
                                                255, 255, 255, 0.7),
                                  ),
                                ),
                              ],
                            ),
                            if (type == Group.canceled ||
                                type == Group.delivered)
                              SvgPicture.asset(
                                type.iconPath!,
                                height: 12.0,
                                colorFilter: ColorFilter.mode(
                                  type == Group.canceled
                                      ? Color.fromRGBO(226, 76, 76, 0.7)
                                      : Color.fromRGBO(51, 199, 90, 1),
                                  BlendMode.srcIn,
                                ),
                              ),
                            if (bubble)
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(210, 101, 101, 0.32),
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        Row(
                          spacing: 12.0,
                          children: [
                            Text(
                              merchant,
                              style: TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.3,
                                color: (type == Group.canceled)
                                    ? Color.fromRGBO(237, 201, 201, 0.6)
                                    : (type == Group.delivered)
                                        ? Color.fromRGBO(176, 219, 175, 0.6)
                                        : Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                            ),
                            Text(
                              logistics,
                              style: TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.3,
                                color: (type == Group.canceled)
                                    ? Color.fromRGBO(237, 201, 201, 0.6)
                                    : (type == Group.delivered)
                                        ? Color.fromRGBO(176, 219, 175, 0.6)
                                        : Color.fromRGBO(255, 255, 255, 0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SvgPicture.asset(
                  AppIcons.chevronRight,
                  height: 13.0,
                ),
              ],
            ),
            if (type == Group.inTransit && description != null)
              Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Markdown(description: description!),
              ),
          ],
        ),
      ),
    );
  }
}
