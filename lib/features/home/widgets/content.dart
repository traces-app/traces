import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/features/home/widgets/shipment_status_badge.dart';
import 'package:traces/features/home/widgets/shipment_info_card.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 28),
            ShipmentStatusBadge(
              statusText: "Out for Delivery",
              backgroundColor: Color.fromRGBO(150, 97, 25, 0.33),
              textColor: Color.fromRGBO(235, 181, 84, 0.75),
              icon: CupertinoIcons.arrow_right,
            ),
            SizedBox(height: 10),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: true,
              trackingNumberColor: Color.fromRGBO(255, 255, 255, 1),
              dateColor: Color.fromRGBO(255, 255, 255, 0.7),
              companyColor: Color.fromRGBO(235, 235, 245, 0.6),
              courierColor: Color.fromRGBO(235, 235, 245, 0.6),
              iconColor: Color.fromRGBO(255, 255, 255, 0.7),
            ),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: true,
              trackingNumberColor: Color.fromRGBO(255, 255, 255, 1),
              dateColor: Color.fromRGBO(255, 255, 255, 0.7),
              companyColor: Color.fromRGBO(235, 235, 245, 0.6),
              courierColor: Color.fromRGBO(235, 235, 245, 0.6),
              iconColor: Color.fromRGBO(255, 255, 255, 0.7),
            ),

            SizedBox(height: 28),

            ShipmentStatusBadge(
              statusText: "In Transit",
              backgroundColor: Color.fromRGBO(43, 45, 29, 1),
              textColor: Color.fromRGBO(235, 247, 102, 0.98),
              icon: CupertinoIcons.arrow_2_circlepath,
            ),

            SizedBox(height: 10),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              customsMessage: "Pending customs clearance in ",
              customsLocation: "Los Angeles, CA",
              showDateIcon: true,
              trackingNumberColor: Color.fromRGBO(255, 255, 255, 1),
              dateColor: Color.fromRGBO(255, 255, 255, 0.7),
              companyColor: Color.fromRGBO(235, 235, 245, 0.6),
              courierColor: Color.fromRGBO(235, 235, 245, 0.6),
              iconColor: Color.fromRGBO(255, 255, 255, 0.7),
              customsMessageColor: Color.fromRGBO(237, 231, 170, 0.5),
              customsLocationColor: Color.fromRGBO(237, 231, 170, 0.7),
            ),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              customsMessage: "Pending customs clearance in ",
              customsLocation: "Los Angeles, CA",
              showDateIcon: true,
              trackingNumberColor: Color.fromRGBO(255, 255, 255, 1),
              dateColor: Color.fromRGBO(255, 255, 255, 0.7),
              companyColor: Color.fromRGBO(235, 235, 245, 0.6),
              courierColor: Color.fromRGBO(235, 235, 245, 0.6),
              iconColor: Color.fromRGBO(255, 255, 255, 0.7),
              customsMessageColor: Color.fromRGBO(237, 231, 170, 0.5),
              customsLocationColor: Color.fromRGBO(237, 231, 170, 0.7),
            ),

            SizedBox(height: 28),

            ShipmentStatusBadge(
              statusText: "Cancelled",
              backgroundColor: Color.fromRGBO(126, 0, 2, 0.6),
              textColor: Color.fromRGBO(251, 189, 206, 0.98),
              icon: CupertinoIcons.xmark,
            ),
            SizedBox(height: 10),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: false,
              extraIcon: CupertinoIcons.xmark,
              trackingNumberColor: Color.fromRGBO(237, 201, 201, 1),
              dateColor: Color.fromRGBO(237, 201, 201, 0.5),
              companyColor: Color.fromRGBO(237, 201, 201, 0.6),
              courierColor: Color.fromRGBO(237, 201, 201, 0.6),
              iconColor: Color.fromRGBO(226, 76, 76, 1),
            ),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: false,
              extraIcon: CupertinoIcons.xmark,
              trackingNumberColor: Color.fromRGBO(237, 201, 201, 1),
              dateColor: Color.fromRGBO(237, 201, 201, 0.5),
              companyColor: Color.fromRGBO(237, 201, 201, 0.6),
              courierColor: Color.fromRGBO(237, 201, 201, 0.6),
              iconColor: Color.fromRGBO(226, 76, 76, 1),
            ),

            SizedBox(height: 28),

            ShipmentStatusBadge(
              statusText: "Other Shipments",
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
              textColor: Color.fromRGBO(255, 255, 255, 0.9),
            ),

            SizedBox(height: 10),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: true,
              trackingNumberColor: Color.fromRGBO(255, 255, 255, 1),
              dateColor: Color.fromRGBO(255, 255, 255, 0.7),
              companyColor: Color.fromRGBO(235, 235, 245, 0.6),
              courierColor: Color.fromRGBO(235, 235, 245, 0.6),
              iconColor: Color.fromRGBO(255, 255, 255, 0.7),
            ),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: true,
              trackingNumberColor: Color.fromRGBO(255, 255, 255, 1),
              dateColor: Color.fromRGBO(255, 255, 255, 0.7),
              companyColor: Color.fromRGBO(235, 235, 245, 0.6),
              courierColor: Color.fromRGBO(235, 235, 245, 0.6),
              iconColor: Color.fromRGBO(255, 255, 255, 0.7),
            ),

            SizedBox(height: 28),

            ShipmentStatusBadge(
              statusText: "Delivered",
              backgroundColor: Color.fromRGBO(10, 40, 18, 1),
              textColor: Color.fromRGBO(91, 218, 124, 1),
              icon: CupertinoIcons.check_mark,
            ),

            SizedBox(height: 10),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: false,
              extraIcon: CupertinoIcons.check_mark,
              trackingNumberColor: Color.fromRGBO(195, 238, 194, 1),
              dateColor: Color.fromRGBO(176, 219, 175, 0.6),
              companyColor: Color.fromRGBO(176, 219, 175, 0.6),
              courierColor: Color.fromRGBO(237, 201, 201, 0.6),
              iconColor: Color.fromRGBO(195, 238, 194, 1),
            ),

            ShipmentInfoCard(
              trackingNumber: "TX 768 431",
              date: "Thu Jan 30",
              company: "Amazon.com, Inc",
              courier: "FedEx Corporation",
              showDateIcon: false,
              extraIcon: CupertinoIcons.check_mark,
              trackingNumberColor: Color.fromRGBO(195, 238, 194, 1),
              dateColor: Color.fromRGBO(176, 219, 175, 0.6),
              companyColor: Color.fromRGBO(176, 219, 175, 0.6),
              courierColor: Color.fromRGBO(237, 201, 201, 0.6),
              iconColor: Color.fromRGBO(195, 238, 194, 1),
            ),

            // ✅ Bottom Padding for smooth scrolling
            SizedBox(height: 40), // ✅ Moved outside ShipmentInfoCard
          ],
        ),
      ),
    );
  }
}
