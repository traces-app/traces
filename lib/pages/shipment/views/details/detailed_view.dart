import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedView extends StatefulWidget {
  const DetailedView({super.key});

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 15.0,
            right: 15.0,
            bottom: 100.0,
          ),
          child: Column(
            spacing: 16.0,
            children: [
              GroupSection(
                title: "Shipment Overview",
                children: const [
                  GroupItem(label: "Status"),
                  GroupItem(
                    label: "Shipment ID",
                    value: "TX 768 431",
                  ),
                  GroupItem(
                    type: "date",
                    label: "Estimated Delivery Date",
                    value: "Thu Jan 30",
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.2),
                thickness: 0.6,
              ),
              GroupSection(
                title: "Recipient Information",
                children: const [
                  GroupItem(
                    label: "Name",
                    value: "Lithika Damnod",
                  ),
                  GroupItem(
                    label: "Address",
                    value: "Madagalla Road, Polpithigama, Kurunegala, 60620",
                  ),
                  GroupItem(
                    label: "Contact Number",
                    value: "+94 77 004 1341",
                    highlight: true,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.2),
                thickness: 0.6,
              ),
              GroupSection(
                title: "Sender Information",
                children: const [
                  GroupItem(
                    label: "Name",
                    value: "Amazon.com, Inc",
                  ),
                  GroupItem(
                    label: "Address",
                    value: "3875 Airways, Module H3 Department 4634, Memphis",
                  ),
                  GroupItem(
                    label: "Contact Number",
                    value: "+94 71 444 2343",
                    highlight: true,
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.2),
                thickness: 0.6,
              ),
              GroupSection(
                title: "Package Information",
                children: const [
                  GroupItem(
                    label: "Weight",
                    value: "5 KG",
                  ),
                  GroupItem(
                    label: "Package Size",
                    value: "Small Bag",
                  ),
                  GroupItem(
                    label: "Dimensions",
                    value: "30 cm x 20 cm x 10 cm",
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.withOpacity(0.2),
                thickness: 0.6,
              ),
              GroupSection(
                title: "Shipping Details",
                children: const [
                  GroupItem(
                    label: "Courier Name",
                    value: "FedEx Corporation",
                  ),
                  GroupItem(
                    label: "Payment Method",
                    value: "Bank Transfer",
                  ),
                  GroupItem(
                    label: "Payment Status",
                    value: "Paid",
                  ),
                  GroupItem(
                    label: "Total Cost",
                    value: "LKR 32300",
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

class GroupSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const GroupSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 19.0,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 16.0),
          child: Column(
            spacing: 10.0,
            children: children,
          ),
        ),
      ],
    );
  }
}

class GroupItem extends StatelessWidget {
  final String type; // "text" "date" "status"
  final String label;
  final String? value;
  final bool highlight;
  const GroupItem({
    super.key,
    this.type = "text",
    required this.label,
    this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15.0,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 17.5,
            letterSpacing: 0.15,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        if (value != null)
          if (type == "date")
            Row(
              spacing: 10.0,
              children: [
                Icon(
                  CupertinoIcons.calendar,
                  size: 20.0,
                  color: Colors.white.withOpacity(0.75),
                ),
                Text(
                  value!,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 17.5,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
              ],
            )
          else
            Flexible(
              child: Text(
                value!,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 17.5,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.w500,
                  color: highlight
                      ? Color(0xFF0A84FF).withOpacity(0.9)
                      : Colors.white.withOpacity(0.75),
                ),
              ),
            )
      ],
    );
  }
}
