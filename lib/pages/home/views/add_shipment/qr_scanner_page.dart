import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  bool _hasPermission = false;
  bool _hasScanned = false;

  final MobileScannerController _scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
  );

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      setState(() => _hasPermission = true);
    } else {
      openAppSettings();
    }
  }

  void _handleScan(String code) {
    if (_hasScanned) return;
    _hasScanned = true;

    Navigator.of(context).pop(code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _hasPermission
          ? Stack(
              children: [
                MobileScanner(
                  controller: _scannerController,
                  onDetect: (capture) {
                    final barcodes = capture.barcodes;
                    for (final barcode in barcodes) {
                      final String? code = barcode.rawValue;
                      if (code != null) {
                        _handleScan(code);
                        break;
                      }
                    }
                  },
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: Text(
                'Camera permission is required to scan QR codes.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
