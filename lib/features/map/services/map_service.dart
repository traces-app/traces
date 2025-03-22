import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traces/features/map/services/camera_service.dart';
import 'package:traces/features/map/services/internal_location_service.dart';
import 'package:traces/features/map/services/external_location_service.dart';
import 'package:traces/features/map/widgets/marker_icon.dart';
import 'package:traces/shared/services/firebase_service.dart';
import 'package:flutter/services.dart';

class MapService {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final _markerController = StreamController<Set<Marker>>.broadcast();

  final FirebaseService _firebaseService = FirebaseService();
  final InternalLocationService _internalLocationService =
      InternalLocationService();
  final ExternalLocationService _externalLocationService =
      ExternalLocationService();

  // final LatLng defaultCenter = const LatLng(7.8216, 80.4062);
  final LatLng defaultCenter = const LatLng(37.72172341, -122.44799741);

  Stream<Set<Marker>> get markerStream => _markerController.stream;

  void init() {
    // TODO: remove this later after implementing global authentication
    _firebaseService.signIn("testuser@example.com", "testpassword");
    _externalLocationService.fetchRealtimeLocation(_updateMarkers);
    _loadMarkers();
  }

  void _loadMarkers() async {
    BitmapDescriptor customIcon = await MarkerIcon.major();
    BitmapDescriptor addressIcon = await MarkerIcon.address();

    _markers.addAll([
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(6.9271, 79.8612),
        infoWindow: const InfoWindow(title: "Colombo"),
        icon: customIcon,
      ),
      Marker(
        markerId: const MarkerId("4"),
        position: LatLng(7.8216, 80.4062),
        infoWindow: const InfoWindow(title: "Polpithigama"),
        icon: addressIcon,
      ),
    ]);

    _markerController.add(_markers);
  }

  void _updateMarkers(List<Marker> newMarkers) {
    _markers.addAll(newMarkers);
    _markerController.add(_markers);
  }

  void onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    CameraService.setMapController(controller);

    // set the map theme
    try {
      String styleJson = await rootBundle.loadString('assets/map/styles.json');
      _mapController?.setMapStyle(styleJson);
    } catch (e) {
      if (kDebugMode) print("error loading map style: $e");
    }
  }

  void onCameraMove(CameraPosition position) {}

  void dispose() {}
}
