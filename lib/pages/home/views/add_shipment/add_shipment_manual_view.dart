import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_scan_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';

class AddShipmentManualView extends StatefulWidget {
  final String? scannedCode;
  const AddShipmentManualView({super.key, this.scannedCode});

  @override
  _AddShipmentManualViewState createState() => _AddShipmentManualViewState();
}

class _AddShipmentManualViewState extends State<AddShipmentManualView> {
  final TextEditingController _trackingController = TextEditingController();
  bool _isTrackingEntered = false;

  @override
  void initState() {
    super.initState();

    if (widget.scannedCode != null && widget.scannedCode!.isNotEmpty) {
      _trackingController.text = widget.scannedCode!;
      _isTrackingEntered = true;
    }
  }

  void _onTrackingChanged(String value) {
    setState(() {
      _isTrackingEntered = value.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6.0),
              const TitleAndInstruction(),
              const SizedBox(height: 25.0),
              TrackingInputField(
                controller: _trackingController,
                onChanged: _onTrackingChanged,
                isTrackingEntered: _isTrackingEntered,
                onClear: () {
                  _trackingController.clear();
                  _onTrackingChanged("");
                },
              ),
              const SizedBox(height: 19.0),
              AddShipmentButton(isEnabled: _isTrackingEntered),
            ],
          ),
        ),
        const Positioned(
          right: 3.0,
          top: 3.0,
          child: QRCodeButton(),
        ),
      ],
    );
  }
}

//TITLE WITH INSTRUCTIONS
class TitleAndInstruction extends StatelessWidget {
  const TitleAndInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Link New Shipment",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.5),
        Text(
          "Provide your shipment details to link it to your account. You can enter the information manually or quickly scan the QR code for faster input.",
          style: TextStyle(
            fontSize: 15.5,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(255, 255, 255, 0.6),
          ),
        ),
      ],
    );
  }
}

// QR CODE BUTTON
class QRCodeButton extends StatelessWidget {
  const QRCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: 43.56,
        height: 43.56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[900],
        ),
        child: const Icon(
          CupertinoIcons.qrcode,
          color: Color.fromRGBO(10, 132, 255, 1),
          size: 27.76,
        ),
      ),
      onPressed: () {
        final modal = context.findAncestorStateOfType<ModalBottomSheetState>();
        modal?.navigateTo(AddShipmentScanView());
      },
    );
  }
}

// TRACKING INPUT FIELD
class TrackingInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onClear;
  final bool isTrackingEntered;

  const TrackingInputField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    required this.isTrackingEntered,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(
        color: Color.fromRGBO(235, 235, 245, 0.6),
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: "Enter Tracking Number",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(235, 235, 245, 0.6),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(28, 28, 30, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (controller.text == "code")
              const Padding(
                padding: EdgeInsets.only(right: 0),
                child: Icon(
                  CupertinoIcons.check_mark,
                  color: Color.fromRGBO(51, 199, 90, 1),
                  size: 20,
                ),
              ),
            if (isTrackingEntered)
              IconButton(
                icon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: onClear,
              ),
          ],
        ),
      ),
    );
  }
}

// ADD SHIPMENT BUTTON
class AddShipmentButton extends StatelessWidget {
  final bool isEnabled;

  const AddShipmentButton({super.key, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? () {} : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? Colors.blue : Colors.grey[800],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: const Text(
          "Add Shipment",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
