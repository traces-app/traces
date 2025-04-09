import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traces/pages/shipment/views/edit/view_shipping_info_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/circular_icon_button.dart';

class ViewLocationView extends StatelessWidget {
  const ViewLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: false,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// **Map Preview** inside a container
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: Colors.black12,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// **Map Image**
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/icons/map_expanded.png', // Replace with the actual map view
                        width: double.infinity,
                        height: 320,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// **Pin Icon Overlay**
                    Positioned(
                      child: SvgPicture.asset(
                        'assets/icons/pin.svg', // Replace with actual pin asset
                        width: 50,
                        height: 59,
                      ),
                    ),
                  ],
                ),
              ),

              /// **Shipping Address**
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "No. 25, Dambulla Road, Kurunegala, North Western, 60000",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(255, 255, 255, 0.7),
                          fontFamily: "SF Pro Text",
                          letterSpacing: -0.425),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// **Top-right floating button**
          Positioned(
            top: 10.0,
            right: 10.0,
            child: CircularIconButton(
              icon: CupertinoIcons.arrow_uturn_left,
              iconColor: Color(0xFF0A84FF),
              backgroundColor: Color(0xFF1C1C1E),
              onPressed: () {
                final modal =
                    context.findAncestorStateOfType<ModalBottomSheetState>();
                modal?.navigateTo(ViewShippingInformationView());
              },
            ),
          ),
        ],
      ),
    );
  }
}
