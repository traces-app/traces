// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class OrderConfirmationView extends StatelessWidget {
//   const OrderConfirmationView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         top: 38.0,
//         left: 16.0,
//         right: 16.0,
//         bottom: 16.0,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const _SuccessIcon(),
//           const SizedBox(height: 22),
//           const _DateTimeRow(),
//           const SizedBox(height: 15),
//           const _ShipmentDetailText(),
//           const SizedBox(height: 22),
//           const _CustomDivider(),
//           _buildRatingRow("Amazon.com, Inc"),
//           const _CustomDivider(),
//           _buildRatingRow("FedEx Corporation"),
//           const _CustomDivider(),
//         ],
//       ),
//     );
//   }

//   Widget _buildRatingRow(String companyName) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             companyName,
//             style: const TextStyle(
//               fontSize: 19.0,
//               color: Colors.grey,
//             ),
//           ),
//           Row(
//             children: List.generate(5, (index) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: const Icon(
//                   CupertinoIcons.star,
//                   size: 22,
//                   color: Color.fromRGBO(0, 122, 255, 1),
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SuccessIcon extends StatelessWidget {
//   const _SuccessIcon();

//   @override
//   Widget build(BuildContext context) {
//     return const Icon(
//       CupertinoIcons.check_mark_circled,
//       color: Color.fromRGBO(4, 144, 41, 1),
//       size: 53.0,
//     );
//   }
// }

// class _DateTimeRow extends StatelessWidget {
//   const _DateTimeRow();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: const [
//         Icon(
//           CupertinoIcons.calendar,
//           size: 19,
//           color: Colors.grey,
//         ),
//         SizedBox(width: 6),
//         Text(
//           "Thu Jan 30  09:41 PM",
//           style: TextStyle(fontSize: 17.15, color: Colors.grey),
//         ),
//       ],
//     );
//   }
// }

// class _ShipmentDetailText extends StatelessWidget {
//   const _ShipmentDetailText();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       child: RichText(
//         textAlign: TextAlign.center,
//         text: const TextSpan(
//           style: TextStyle(
//             color: Color.fromRGBO(255, 255, 255, 0.7),
//             fontSize: 18.0,
//             height: 1.5,
//           ),
//           children: [
//             TextSpan(text: "Your Shipment "),
//             TextSpan(
//               text: "TX 768 431",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             TextSpan(text: " Has Been Delivered Successfully."),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CustomDivider extends StatelessWidget {
//   const _CustomDivider();

//   @override
//   Widget build(BuildContext context) {
//     return const Divider(
//       height: 0,
//       thickness: 0.5,
//       color: Color.fromRGBO(84, 84, 88, 0.65),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
          const SizedBox(height: 22),
          const _DateTimeRow(),
          const SizedBox(height: 15),
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
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            companyName,
            style: const TextStyle(
              fontSize: 19.0,
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
    return const Icon(
      CupertinoIcons.check_mark_circled,
      color: Color.fromRGBO(4, 144, 41, 1),
      size: 53.0,
    );
  }
}

class _DateTimeRow extends StatelessWidget {
  const _DateTimeRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          CupertinoIcons.calendar,
          size: 19,
          color: Colors.grey,
        ),
        SizedBox(width: 6),
        Text(
          "Thu Jan 30  09:41 PM",
          style: TextStyle(fontSize: 17.15, color: Colors.grey),
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
      width: 300,
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 0.7),
            fontSize: 18.0,
            height: 1.5,
          ),
          children: [
            TextSpan(text: "Your Shipment "),
            TextSpan(
              text: "TX 768 431",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextSpan(text: " Has Been Delivered Successfully."),
          ],
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
