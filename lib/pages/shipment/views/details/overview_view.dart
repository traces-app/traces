import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/core/models/status.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipping Address",
                            style: TextStyle(
                              fontSize: 17.5,
                              letterSpacing: 0.15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "No. 25, Dambulla Road, Kurunegala, North Western, 60000",
                            style: TextStyle(
                              fontSize: 17.5,
                              letterSpacing: 0.15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.85),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Color(0xff222222),
                        shape: BoxShape.circle,
                      ),
                      child: Transform.rotate(
                        angle: -0.9, // radians
                        child: Icon(
                          CupertinoIcons.arrow_up,
                          size: 20.0,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(
                  thickness: 0.6,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 100.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(
                  thickness: 0.6,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(
                  thickness: 0.6,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
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

class RatingListItem extends StatelessWidget {
  final String name;
  final String country;
  final String? category;
  final double rating;
  final String src;

  const RatingListItem({
    super.key,
    required this.name,
    required this.country,
    this.category,
    required this.rating,
    this.src = "#",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 15.0,
          children: [
            ClipOval(
              child: Image.network(
                src,
                width: 40.0,
                height: 40.0,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                Row(
                  spacing: 12.0,
                  children: [
                    Text(
                      country,
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    if (category != null) ...[
                      Container(
                        height: 3.5,
                        width: 3.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        category!,
                        style: TextStyle(
                          fontSize: 15.5,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
        Rating(rating: rating),
      ],
    );
  }
}

class Rating extends StatelessWidget {
  final double rating;

  const Rating({
    super.key,
    required this.rating,
  });

  Color _getRatingThemeColor() {
    if (rating <= 2.5) {
      return const Color.fromARGB(255, 240, 110, 101).withOpacity(0.6);
    } else if (rating <= 4.0) {
      return Colors.white.withOpacity(0.6);
    } else {
      return Color.fromRGBO(209, 219, 88, 0.75);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color ratingColorGroup = _getRatingThemeColor();

    return Row(
      spacing: 8.5,
      children: [
        Icon(
          CupertinoIcons.star_fill,
          size: 16.0,
          color: ratingColorGroup,
        ),
        Text(
          "$rating / 5",
          style: TextStyle(
            fontSize: 16.5,
            letterSpacing: 0.8,
            fontWeight: FontWeight.w500,
            color: ratingColorGroup,
          ),
        ),
      ],
    );
  }
}

class StatusDescriptionItem extends StatelessWidget {
  final Status type;
  final String description;
  final String time;
  final bool bubble;

  const StatusDescriptionItem({
    super.key,
    required this.type,
    required this.description,
    required this.time,
    this.bubble = false,
  });

  Color _getTextThemeColor() {
    switch (type) {
      case Status.delivered:
        return Color.fromRGBO(120, 210, 120, 1);
      case Status.canceled:
        return Color.fromRGBO(253, 108, 108, 1);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = _getTextThemeColor();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 12.0,
                  children: [
                    Text(
                      type.label.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15.5,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500,
                        color: color.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 16.5,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500,
                        color: color.withOpacity(0.5),
                      ),
                    ),
                    if (bubble)
                      Container(
                        width: 4.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xff672903),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 3.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 0.15,
                    fontWeight: FontWeight.w500,
                    color: color.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
        StatusIcon(
          type: type,
          size: 13.0,
        ),
      ],
    );
  }
}
