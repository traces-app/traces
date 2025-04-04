import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/pages/home/views/add_shipment/add_shipment_manual_view.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class AddShipmentScanView extends StatelessWidget {
  const AddShipmentScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.0),
              TitleWithInstruction(),
              SizedBox(height: 10.0),
              QRScanFinder(),
            ],
          ),
        ),
        Positioned(
          right: 3.0,
          top: 3.0,
          child: BackButtonIconOnly(),
        ),
      ],
    );
  }
}

class BackButtonIconOnly extends StatelessWidget {
  const BackButtonIconOnly({super.key});

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
          CupertinoIcons.arrow_uturn_left,
          color: Colors.blue,
        ),
      ),
      onPressed: () {
        final modal = context.findAncestorStateOfType<ModalBottomSheetState>();
        modal?.navigateTo(const AddShipmentManualView());
      },
    );
  }
}

class TitleWithInstruction extends StatelessWidget {
  const TitleWithInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Link New Shipment",
          textAlign: TextAlign.start,
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
            height: 1.4,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class QRScanFinder extends StatefulWidget {
  const QRScanFinder({super.key});

  @override
  State<QRScanFinder> createState() => _QRScanFinderState();
}

class _QRScanFinderState extends State<QRScanFinder> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scannedText;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
    scannedText = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Stack(
        children: [
          QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor:
                    scannedText == null ? Colors.red : Colors.transparent,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 180,
              )),
          if (scannedText != null)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.8),
                height: double.infinity,
                width: double.infinity,
                child: CupertinoActivityIndicator(),
              ),
            )
        ],
      ),
    );
  }

  void _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        scannedText = scanData.code;
      });

      if (scannedText != null) {
        await Future.delayed(Duration(seconds: 2));
        if (!mounted) {
          return; // Ensure the widget is still mounted before accessing context
        }

        final modal = context.findAncestorStateOfType<ModalBottomSheetState>();
        modal?.navigateTo(AddShipmentManualView(
          scannedText: scannedText,
        ));
      }
    });
  }
}

/*
const Center(
          child: Icon(
            CupertinoIcons.qrcode_viewfinder,
            size: 180.0,
            color: Colors.white30,
          ),
        ),

 */
