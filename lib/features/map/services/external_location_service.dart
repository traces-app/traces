import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traces/shared/services/firebase_realtime_database_service.dart';

class ExternalLocationService {
  final FirebaseRealtimeDatabaseService _firebaseRealtimeDatabaseService =
      FirebaseRealtimeDatabaseService();

  /// Fetches location data from Firebase and listens for real-time changes.
  void fetchRealtimeLocation(Function(List<Marker>) updateMarkers) {
    DatabaseReference ref =
        _firebaseRealtimeDatabaseService.listenToData('locations');

    ref.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic> locations =
            event.snapshot.value as Map<dynamic, dynamic>;

        List<Marker> markers = locations.entries.map((entry) {
          final data = entry.value;

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
}
