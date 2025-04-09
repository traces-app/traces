import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/core/utils/app_icons.dart';

class OrderConfirmationView extends StatefulWidget {
  const OrderConfirmationView({super.key});

  @override
  State<OrderConfirmationView> createState() => _OrderConfirmationViewState();
}

class _OrderConfirmationViewState extends State<OrderConfirmationView> {
  int amazonRating = 0;
  int fedexRating = 0;

  void updateRating(String company, int rating) {
    setState(() {
      if (company == "Amazon.com, Inc") {
        amazonRating = rating;
      } else if (company == "FedEx Corporation") {
        fedexRating = rating;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 38.0,
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _SuccessIcon(),
          const SizedBox(height: 30.0),
          const _DateTimeRow(),
          const SizedBox(height: 13.0),
          const _ShipmentDetailText(),
          const SizedBox(height: 22),
          const _CustomDivider(),
          _buildRatingRow("Amazon.com, Inc", amazonRating),
          const _CustomDivider(),
          _buildRatingRow("FedEx Corporation", fedexRating),
          const _CustomDivider(),
        ],
      ),
    );
  }

  Widget _buildRatingRow(String companyName, int currentRating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.5, horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            companyName,
            style: const TextStyle(
              fontSize: 18.5,
              color: Colors.grey,
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return GestureDetector(
                onTap: () => updateRating(companyName, starIndex),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    starIndex <= currentRating
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    size: 22,
                    color: const Color.fromRGBO(0, 122, 255, 1),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _SuccessIcon extends StatelessWidget {
  const _SuccessIcon();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SvgPicture.asset(
      height: 45.0,
      AppIcons.checkmark,
      colorFilter: ColorFilter.mode(
        Color(0xff049029),
        BlendMode.srcIn,
      ),
    ));
  }
}

class _DateTimeRow extends StatelessWidget {
  const _DateTimeRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.calendar,
          size: 18,
          color: Colors.white.withOpacity(0.5),
        ),
        SizedBox(width: 6),
        Text(
          "Thu Jan 30 09:41 PM",
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ShipmentDetailText extends StatelessWidget {
  const _ShipmentDetailText();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.0,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Your Shipment",
          children: const [
            TextSpan(
              text: ' TX 768 431 ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(text: 'Has Been Delivered Successfully.'),
          ],
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.85),
            height: 1.5,
          ),
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      thickness: 0.5,
      color: Color.fromRGBO(84, 84, 88, 0.65),
    );
  }
}
