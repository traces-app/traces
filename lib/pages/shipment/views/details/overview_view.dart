import 'package:flutter/material.dart';
import 'package:traces/core/models/status.dart';
import 'package:traces/features/shipment/widgets/rating_list_item.dart';
import 'package:traces/features/shipment/widgets/shipping_info_section.dart';
import 'package:traces/features/shipment/widgets/status_description_item.dart';
import 'package:traces/shared/widgets/status_icon.dart';

class OverviewView extends StatefulWidget {
  const OverviewView({super.key});

  @override
  State<OverviewView> createState() => _OverviewViewState();
}

class _OverviewViewState extends State<OverviewView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25.0,
            left: 15.0,
            right: 15.0,
            bottom: 200.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10.0,
                children: [
                  StatusIcon(type: Status.inTransit),
                  Text(
                    Status.inTransit.label.toUpperCase(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ShippingInfoSection(
                  address:
                      "No. 25, Dambulla Road, Kurunegala, North Western, 60000"),
              _Divider(),
              SizedBox(height: 100.0),
              _Divider(),
              Column(
                spacing: 19.0,
                children: const [
                  StatusDescriptionItem(
                    type: Status.delivered,
                    description:
                        "The package was successfully delivered to the recipient's address.",
                    time: "April 22, 11:40 AM",
                    bubble: true,
                  ),
                  StatusDescriptionItem(
                    type: Status.outForDelivery,
                    description:
                        "The package is with the delivery driver and on its way to the recipient.",
                    time: "April 22, 11:40 AM",
                  ),
                  StatusDescriptionItem(
                    type: Status.inTransit,
                    description:
                        "The package left the Colombo facility and is en route to the Kandy hub",
                    time: "April 22, 11:40 AM",
                  ),
                ],
              ),
              _Divider(),
              Column(
                spacing: 20.0,
                children: const [
                  RatingListItem(
                    name: "Amazon.com, Inc",
                    country: "Sri Lanka",
                    category: "Ecommerce",
                    src:
                        "https://images.icon-icons.com/2429/PNG/512/amazon_logo_icon_147320.png",
                    rating: 4.3,
                  ),
                  RatingListItem(
                    name: "UPS International",
                    country: "Sri Lanka",
                    src:
                        "https://logowik.com/content/uploads/images/647_ups.jpg",
                    rating: 3.6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Divider(
        thickness: 0.6,
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
