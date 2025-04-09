import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/edit/view_location_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';

class ViewShippingInformationView extends StatelessWidget {
  const ViewShippingInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// **Title**
            Text(
              "Edit Shipping Information",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: "SF Pro Text",
              ),
            ),
            SizedBox(height: 12.0),

            /// **Shipping Address Label**
            Text(
              "Shipping Address",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.4),
                fontFamily: "SF Pro Text",
              ),
            ),
            SizedBox(height: 2.0),

            /// **Shipping Address**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "No. 25, Dambulla Road, Kurunegala, North Western, 60000",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                ),
                SizedBox(width: 30.0),
                GestureDetector(
                  onTap: () {
                    final modal = context
                        .findAncestorStateOfType<ModalBottomSheetState>();
                    modal?.navigateTo(ViewLocationView());
                  },
                  child: Container(
                    width: 83,
                    height: 83,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      color: Colors.black12,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        /// **Map Image**
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: Image.asset(
                            'assets/icons/map_image.png', // Replace with the actual asset path
                            fit: BoxFit.cover,
                            width: 83,
                            height: 83,
                          ),
                        ),

                        /// **Pin Icon Overlay**
                        Positioned(
                          child: SvgPicture.asset(
                            'assets/icons/pin.svg', // Replace with actual pin asset
                            width: 25,
                            height: 34,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.0),

            /// **Edit Address Button**
            CustomElevatedButton(
              text: "Edit Address",
              onPressed: () {
                final modal =
                    context.findAncestorStateOfType<ModalBottomSheetState>();
                modal?.navigateTo(EditShippingInformationView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
