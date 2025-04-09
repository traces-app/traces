import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShippingInfoSection extends StatelessWidget {
  final String address;

  const ShippingInfoSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  address,
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
    );
  }
}
