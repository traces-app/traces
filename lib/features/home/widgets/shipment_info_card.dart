import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShipmentInfoCard extends StatelessWidget {
  final String trackingNumber;
  final String date;
  final String company;
  final String courier;
  final String? customsMessage;
  final String? customsLocation;
  final bool showDateIcon;
  final IconData? extraIcon;

  // 🎨 Customization for Colors
  final Color trackingNumberColor;
  final Color dateColor;
  final Color companyColor;
  final Color courierColor;
  final Color customsMessageColor;
  final Color customsLocationColor;
  final Color iconColor;

  // 🔠 Customization for Font Sizes
  final double trackingNumberFontSize;
  final double dateFontSize;
  final double companyFontSize;
  final double courierFontSize;
  final double customsMessageFontSize;
  final double customsLocationFontSize;

  // 🔤 Customization for Font Weights
  final FontWeight trackingNumberFontWeight;
  final FontWeight dateFontWeight;
  final FontWeight companyFontWeight;
  final FontWeight courierFontWeight;
  final FontWeight customsMessageFontWeight;
  final FontWeight customsLocationFontWeight;

  const ShipmentInfoCard({
    super.key,
    required this.trackingNumber,
    required this.date,
    required this.company,
    required this.courier,
    this.customsMessage,
    this.customsLocation,
    this.showDateIcon = true,
    this.extraIcon,

    // 🎨 Default Text Colors
    this.trackingNumberColor = Colors.white,
    this.dateColor = Colors.white,
    this.companyColor = Colors.white,
    this.courierColor = Colors.white,
    this.customsMessageColor = Colors.white,
    this.customsLocationColor = Colors.white,
    this.iconColor = Colors.white,

    // 🔠 Default Font Sizes
    this.trackingNumberFontSize = 18,
    this.dateFontSize = 18,
    this.companyFontSize = 17,
    this.courierFontSize = 17,
    this.customsMessageFontSize = 17,
    this.customsLocationFontSize = 17,

    // 🔤 Default Font Weights
    this.trackingNumberFontWeight = FontWeight.w600,
    this.dateFontWeight = FontWeight.w500,
    this.companyFontWeight = FontWeight.w500,
    this.courierFontWeight = FontWeight.w500,
    this.customsMessageFontWeight = FontWeight.w500,
    this.customsLocationFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 5,
                children: [
                  Text(
                    trackingNumber,
                    style: TextStyle(
                      color: trackingNumberColor,
                      fontSize: trackingNumberFontSize,
                      fontWeight: trackingNumberFontWeight,
                      letterSpacing: -0.41,
                    ),
                  ),
                  if (showDateIcon)
                    Icon(
                      CupertinoIcons.calendar,
                      color: iconColor,
                      size: 18,
                    ),
                  Text(
                    date,
                    style: TextStyle(
                      color: dateColor,
                      fontSize: dateFontSize,
                      fontWeight: dateFontWeight,
                    ),
                  ),
                  if (extraIcon != null)
                    Icon(
                      extraIcon,
                      color: iconColor,
                      size: 18,
                    ),
                ],
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 5,
                runSpacing: 3,
                children: [
                  Text(
                    company,
                    style: TextStyle(
                      color: companyColor,
                      fontSize: companyFontSize,
                      fontWeight: companyFontWeight,
                    ),
                  ),
                  Text(
                    courier,
                    style: TextStyle(
                      color: courierColor,
                      fontSize: courierFontSize,
                      fontWeight: courierFontWeight,
                    ),
                  ),
                ],
              ),
              if (customsMessage != null && customsLocation != null) ...[
                const SizedBox(height: 5),
                Wrap(
                  spacing: 2,
                  runSpacing: 3,
                  children: [
                    Text(
                      customsMessage!,
                      style: TextStyle(
                        color: customsMessageColor,
                        fontSize: customsMessageFontSize,
                        fontWeight: customsMessageFontWeight,
                        height: 1.35,
                        letterSpacing: -0.42,
                      ),
                    ),
                    Text(
                      customsLocation!,
                      style: TextStyle(
                        color: customsLocationColor,
                        fontSize: customsLocationFontSize,
                        fontWeight: customsLocationFontWeight,
                        height: 1.35,
                        letterSpacing: -0.42,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),

        // ✅ Kept Chevron Icon but Removed Navigation
        Positioned(
          right: 5,
          top: 20,
          child: Icon(
            CupertinoIcons.chevron_right,
            color: const Color.fromRGBO(235, 235, 245, 0.30),
            size: 12,
          ),
        ),
      ],
    );
  }
}
