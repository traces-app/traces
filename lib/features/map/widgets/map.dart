/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  final LatLng initialPosition;
  final void Function(GoogleMapController) onMapCreated;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final double zoom;
  final Function(CameraPosition)? onCameraMove;

  const Map({
    super.key,
    required this.initialPosition,
    required this.onMapCreated,
    this.markers = const {},
    this.polylines = const {},
    this.zoom = 15.0,
    this.onCameraMove,
  });

  @override
  State<Map> createState() => _MapState();

  void forEach(Null Function(dynamic key, dynamic value) param0) {}
}

class _MapState extends State<Map> {
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: widget.initialPosition,
              zoom: widget.zoom,
            ),
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            markers: widget.markers,
            polylines: widget.polylines,
            onCameraMove: widget.onCameraMove,
          ),
        ),
      ],
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    widget.onMapCreated(controller);

    try {
      String styleJson = await rootBundle.loadString('assets/map/styles.json');
      _controller?.setMapStyle(styleJson);
    } catch (e) {
      if (kDebugMode) print("error loading map style: $e");
    }
  }
}
*/

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatelessWidget {
  final LatLng initialPosition;
  final Set<Marker> markers;
  final Function(GoogleMapController) onMapCreated;
  final Function(CameraPosition) onCameraMove;

  const Map({
    super.key,
    required this.initialPosition,
    required this.markers,
    required this.onMapCreated,
    required this.onCameraMove,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: initialPosition, zoom: 10),
      markers: markers,
      onMapCreated: onMapCreated,
      onCameraMove: onCameraMove,
    );
  }
}
