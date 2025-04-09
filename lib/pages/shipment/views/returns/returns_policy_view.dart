import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/returns/select_reason_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class ReturnsPolicyView extends StatelessWidget {
  const ReturnsPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed Title
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 18),
            child: Text(
              "Returns Policy",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
          ),

          SizedBox(height: 10.0),

          SizedBox(
            height: 450.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 12.0),
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
                  trackColor: MaterialStateProperty.all(Colors.transparent),
                  thickness:
                      MaterialStateProperty.all(2.0), // Thinner scrollbar
                  radius: Radius.circular(8.0),
                  minThumbLength: 40,
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "We accept returns within 30 days of delivery. Items must be unused, in their original packaging, and include proof of purchase. Certain items, such as final sale, personalized, or perishable goods, cannot be returned.",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Returns can be made by dropping off the item at a designated location or scheduling a courier pickup if eligible. Refunds will be processed to the original payment method within 5–10 business days after the return is received and inspected. If the return is due to a damaged or incorrect item, we will cover the return shipping costs.",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "For any return-related issues, please contact our support team within 7 days of receiving your item.",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Please note: The item must be in its original condition with all packaging and tags intact. If the item is found to be used, damaged, or missing parts, we reserve the right to reject the return request.",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Additional items that cannot be returned include digital goods, gift cards, and any personalized products. If you have any concerns about an order, please contact our support team before initiating a return.",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "We reserve the right to refuse a return if it does not meet the above conditions. Refunds may take up to 10 business days to process after we receive the returned item.",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(SelectReasonView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0A84FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  minimumSize: Size(391, 47),
                ),
                child: Text(
                  "Accept and Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
