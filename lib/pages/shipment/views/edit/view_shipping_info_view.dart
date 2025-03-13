import 'package:flutter/material.dart';
import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/edit/view_location_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class ViewShippingInformationView extends StatelessWidget {
  const ViewShippingInformationView({super.key});

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
              Text("Current Shipping Information Overview",
                  style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(ViewLocationView());
                },
                child: Text("Expand Current Address (Map)"),
              ),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(EditShippingInformationView());
                },
                child: Text("Edit Address"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
