import 'package:google_maps_flutter/google_maps_flutter.dart';

class CameraService {
  static GoogleMapController? _mapController;
  static bool _shouldFollowLocation = false;

  static void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  static void togglePathFollowing() {
    _shouldFollowLocation = !_shouldFollowLocation;
  }

  static void startPathFollowing() {
    _shouldFollowLocation = true;
  }

  static void stopPathFollowing() {
    _shouldFollowLocation = false;
  }

  static bool isFollowingLocation() => _shouldFollowLocation;

  static void moveCameraTo(LatLng position, {double zoomLevel = 15.0}) {
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(position, zoomLevel),
      );
    }
  }
}
