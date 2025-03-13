import 'package:flutter/material.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_scan_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class AddShipmentManualView extends StatelessWidget {
  const AddShipmentManualView({super.key});

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
              Text("Link New Shipment (Manual)",
                  style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(AddShipmentScanView());
                },
                child: Text("Scan QR Code"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
