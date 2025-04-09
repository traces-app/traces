import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
import 'package:traces/pages/shipment/views/edit/view_addresses_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/custom_text_field.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';
import 'package:traces/features/shipment/widgets/circular_icon_button.dart';

class EditShippingInformationView extends StatelessWidget {
  const EditShippingInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// **Title & Buttons**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Update Shipping Address",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "SF Pro Text",
                  ),
                ),

                /// **Buttons Row (Back & Add)**
                Row(
                  children: [
                    /// **Back Button (Circular)**
                    CircularIconButton(
                      icon: CupertinoIcons.arrow_uturn_left,
                      iconColor: Color(0xFF8E8E93),
                      backgroundColor: Color(0xFF1C1C1E),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 16),

                    /// **Add Button (Circular)**
                    CircularIconButton(
                      icon: CupertinoIcons.add,
                      iconColor: Color(0xFF0A84FF),
                      backgroundColor: Color(0xFF1C1C1E),
                      onPressed: () {
                        final modal = context
                            .findAncestorStateOfType<ModalBottomSheetState>();
                        modal?.navigateTo(ViewAddressesView());
                      },
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 8),

            /// **Form Fields**
            CustomTextField(
                label: "Street Address Line 1", hint: "No. 50, Madagalla Road"),
            CustomTextField(
                label: "Street Address Line 2", hint: "No. 50, Madagalla Road"),
            CustomTextField(label: "City", hint: "Kurunegala"),
            CustomTextField(label: "Province", hint: "North Western"),
            CustomTextField(
                label: "Country", hint: "Sri Lanka", isEditable: false),

            SizedBox(height: 50),

            /// **Button pinned at the bottom**
            CustomElevatedButton(
              text: "Locate Address",
              onPressed: () {
                final modal =
                    context.findAncestorStateOfType<ModalBottomSheetState>();
                modal?.navigateTo(PinLocationView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
