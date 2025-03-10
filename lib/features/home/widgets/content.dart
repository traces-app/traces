import 'package:flutter/material.dart';
import 'package:traces/core/models/group.dart';
import 'package:traces/features/home/widgets/shipment_card.dart';
import 'package:traces/features/home/widgets/shipment_group.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 35.0,
      children: const [
        SizedBox(height: 3.0),
        ShipmentGroup(
          group: Group.outForDelivery,
          children: [
            ShipmentCard(
              type: Group.outForDelivery,
              identifier: "TX 768 431",
              timestamp: "Thu Jan 30",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
              bubble: true,
            ),
            ShipmentCard(
              type: Group.outForDelivery,
              identifier: "TX 768 431",
              timestamp: "Thu Jan 30",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
            ),
          ],
        ),
        ShipmentGroup(
          group: Group.inTransit,
          children: [
            ShipmentCard(
              type: Group.inTransit,
              identifier: "TX 768 431",
              timestamp: "Thu Jan 30",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
              description: "Pending customs clearance in **Los Angeles, CA**",
            ),
            ShipmentCard(
              type: Group.inTransit,
              identifier: "TX 768 431",
              timestamp: "Thu Jan 30",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
              description: "Pending customs clearance in **Los Angeles, CA**",
            ),
          ],
        ),
        ShipmentGroup(
          group: Group.canceled,
          children: [
            ShipmentCard(
              type: Group.canceled,
              identifier: "TX 768 431",
              timestamp: "Jan 30, 8:00 PM",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
            ),
            ShipmentCard(
              type: Group.canceled,
              identifier: "TX 768 431",
              timestamp: "Jan 30, 8:00 PM",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
            ),
          ],
        ),
        ShipmentGroup(
          group: Group.others,
          children: [
            ShipmentCard(
              type: Group.others,
              identifier: "TX 768 431",
              timestamp: "Thu Jan 30",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
            ),
            ShipmentCard(
              type: Group.others,
              identifier: "TX 768 431",
              timestamp: "Thu Jan 30",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
            ),
          ],
        ),
        ShipmentGroup(
          group: Group.delivered,
          children: [
            ShipmentCard(
              type: Group.delivered,
              identifier: "TX 768 431",
              timestamp: "Jan 30, 8:00 PM",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
            ),
            ShipmentCard(
              type: Group.delivered,
              identifier: "TX 768 431",
              timestamp: "Jan 30, 8:00 PM",
              merchant: "Amazon.com, Inc",
              logistics: "FedEx Corporation",
            ),
          ],
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
