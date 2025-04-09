import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traces/pages/shipment/views/edit/edit_shipping_info_view.dart';
import 'package:traces/pages/shipment/views/edit/view_addresses_view.dart';
import 'package:traces/shared/widgets/modal_bottom_sheet.dart';
import 'package:traces/features/shipment/widgets/custom_elevated_button.dart';
import 'package:traces/features/shipment/widgets/circular_icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

class PinLocationView extends StatefulWidget {
  const PinLocationView({super.key});

  @override
  State<PinLocationView> createState() => _PinLocationViewState();
}

class _PinLocationViewState extends State<PinLocationView> {
  GoogleMapController? _mapController;
  LatLng _mapCenter = const LatLng(7.849688523291539, 80.3526523330999);
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    final style = await rootBundle.loadString('assets/map/styles.json');
    _mapStyle = style;
    // Only set the map style if the controller is initialized
    if (_mapController != null) {
      _mapController!.setMapStyle(_mapStyle);
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    // Set the style immediately if it's already loaded
    if (_mapStyle != null) {
      _mapController!.setMapStyle(_mapStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalBottomSheet(
      showCloseButton: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pin Your Address",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: "SF Pro Text",
                    ),
                  ),
                  CircularIconButton(
                    icon: CupertinoIcons.arrow_uturn_left,
                    iconColor: const Color(0xFF8E8E93),
                    backgroundColor: const Color(0xFF1C1C1E),
                    onPressed: () {
                      final modal = context
                          .findAncestorStateOfType<ModalBottomSheetState>();
                      modal?.navigateTo(EditShippingInformationView());
                    },
                  ),
                ],
              ),
            ),

            /// Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Make sure your pinned location is accurate and within the service area.",
                style: TextStyle(
                  fontSize: 15.3,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.6),
                  fontFamily: "SF Pro Text",
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            /// Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                cursorColor: Colors.white70,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(118, 118, 128, 0.24),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 6.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search Location",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    letterSpacing: -0.408,
                    color: Color.fromRGBO(235, 235, 245, 0.60),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 5.0),
                    child: Icon(
                      CupertinoIcons.search,
                      color: Color.fromRGBO(235, 235, 245, 0.60),
                      size: 20,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  letterSpacing: -0.408,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            /// Map with fixed marker
            SizedBox(
              height: 400.0,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _mapCenter,
                      zoom: 10.0,
                    ),
                    onCameraMove: (CameraPosition position) {
                      _mapCenter = position.target;
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    gestureRecognizers: {
                      Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer()),
                    },
                  ),
                  IgnorePointer(
                    child: Icon(
                      CupertinoIcons.map_pin,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15.0),

            /// Save button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomElevatedButton(
                text: "Save Changes",
                onPressed: () {
                  final modal =
                      context.findAncestorStateOfType<ModalBottomSheetState>();
                  modal?.navigateTo(ViewAddressesView());
                  debugPrint(
                      "Pinned Location: ${_mapCenter.latitude}, ${_mapCenter.longitude}");
                },
              ),
            ),

            /// Bottom safe space
            SizedBox(
              height: MediaQuery.of(context).padding.bottom > 0
                  ? MediaQuery.of(context).padding.bottom
                  : 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
