import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class InternalLocationService {
  static Future<Position?> getInitialPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (kDebugMode) print("location services are disabled.");
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (kDebugMode) print("location permissions are denied.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (kDebugMode) print("location permissions are permanently denied.");
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      if (kDebugMode) print("error getting location: $e");
      return null;
    }
  }

  static StreamSubscription<Position> listenToLocationUpdates(
      void Function(Position) onUpdate) {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen(onUpdate);
  }
}
