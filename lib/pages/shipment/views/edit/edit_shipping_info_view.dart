import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/edit/pin_location_view.dart';
import 'package:traces/pages/shipment/views/edit/view_addresses_view.dart';
import 'package:traces/pages/shipment/views/edit/view_shipping_info_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class EditShippingInformationView extends StatelessWidget {
  const EditShippingInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Start replacing content from here
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Column(
            children: [
              Text(
                "Update Shipping Information (Form)",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(PinLocationView());
                },
                child: Text("Locate Address"),
              ),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(ViewAddressesView());
                },
                child: Text("Use Another Address"),
              ),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(ViewShippingInformationView());
                },
                child: Text("Back"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
