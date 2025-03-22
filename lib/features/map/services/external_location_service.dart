import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traces/features/map/services/camera_service.dart';
import 'package:traces/shared/services/firebase_realtime_database_service.dart';

class ExternalLocationService {
  /*final FirebaseRealtimeDatabaseService _firebaseRealtimeDatabaseService =
      FirebaseRealtimeDatabaseService();
      */

  /// Fetches location data from Firebase and listens for real-time changes.
  void fetchRealtimeLocation(Function(List<Marker>) updateMarkers) {
    DatabaseReference ref =
        FirebaseRealtimeDatabaseService.listenToData('locations');

    ref.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic> locations =
            event.snapshot.value as Map<dynamic, dynamic>;

        List<Marker> markers = locations.entries.map((entry) {
          final data = entry.value;

          // update camera position
          if (CameraService.isFollowingLocation()) {
            CameraService.moveCameraTo(
                LatLng(data['latitude'], data['longitude']));
          }

          return Marker(
            markerId: MarkerId(entry.key),
            position: LatLng(data['latitude'], data['longitude']),
            infoWindow: InfoWindow(title: data['title'] ?? 'Driver Location'),
            icon: BitmapDescriptor.defaultMarker,
          );
        }).toList();

        updateMarkers(markers); // update the UI with new markers
      }
    }, onError: (error) {
      if (kDebugMode) print("Error listening to location updates: $error");
    });
  }

  Stream<LatLng> fetchRealtimeLatLng() async* {
    DatabaseReference ref =
        FirebaseRealtimeDatabaseService.listenToData('locations');

    await for (DatabaseEvent event in ref.onValue) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        final Map<dynamic, dynamic> locations =
            event.snapshot.value as Map<dynamic, dynamic>;

        // Get the first location entry (Modify logic if needed)
        final firstEntry = locations.entries.first;
        final data = firstEntry.value;

        double lat = (data['latitude'] as num).toDouble();
        double lng = (data['longitude'] as num).toDouble();

        // Move the camera if following is enabled
        if (CameraService.isFollowingLocation()) {
          CameraService.moveCameraTo(LatLng(lat, lng));
        }

        yield LatLng(lat, lng); // Emit the latest LatLng value
      }
    }
  }
}
