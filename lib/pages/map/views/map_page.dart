import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traces/features/map/services/directions_service.dart';
import 'package:traces/features/map/services/external_location_service.dart';
import 'package:traces/features/map/services/map_service.dart';
import 'package:traces/features/map/widgets/map.dart';
import 'package:traces/features/map/widgets/title_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapService _mapService = MapService();
  final ExternalLocationService _externalLocationService =
      ExternalLocationService();

  final Set<Marker> _markers = {};
  // ignore: prefer_final_fields
  Set<Polyline> _polylines = {};
  final _markerController = StreamController<Set<Marker>>.broadcast();

  @override
  void initState() {
    super.initState();
    _mapService.init();
    testDirections();
  }

  @override
  void dispose() {
    _mapService.dispose();
    super.dispose();
  }

  /*
  void testDirections() async {
    DirectionsService directionsService = DirectionsService();

    LatLng start = LatLng(37.7749, -122.4194); // San Francisco
    LatLng end = LatLng(37.747812417842916, -122.48017761345524); // Los Angeles

    DatabaseReference ref =
        FirebaseRealtimeDatabaseService().listenToData("locations");

    ref.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final Map<dynamic, dynamic> locations =
            event.snapshot.value as Map<dynamic, dynamic>;

        List<Marker> markers = locations.entries.map((entry) {
          final data = entry.value;
        }).toList();
      }
    }, onError: (error) {
      if (kDebugMode) print("Error listening to location updates: $error");
    });

    List<LatLng> route = await directionsService.getRoutePolyline(start, end);
    setState(() {
      _polylines.add(
        Polyline(
          polylineId: PolylineId("route"),
          color: Colors.blue, // Change color as needed
          width: 6, // Change width as needed
          points: route, // Assign the list of LatLng points
          geodesic: true,
        ),
      );
    });

    print("route: $route"); // Should print a list of LatLng points
  }
  */

  void testDirections() async {
    DirectionsService directionsService = DirectionsService();
    LatLng end = LatLng(37.7749, -122.4194);

    ExternalLocationService()
        .fetchRealtimeLatLng()
        .listen((LatLng start) async {
      print("Updated Start Location: $start");

      List<LatLng> route = await directionsService.getRoutePolyline(start, end);
      setState(
        () {
          _polylines.add(
            Polyline(
              polylineId: PolylineId("route"),
              color: Colors.blue, // Change color as needed
              width: 6, // Change width as needed
              points: route, // Assign the list of LatLng points
              geodesic: true,
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const TitleBar(),
      body: StreamBuilder<Set<Marker>>(
        stream: _mapService.markerStream,
        builder: (context, snapshot) {
          return Map(
            initialPosition: _mapService.defaultCenter,
            markers: snapshot.data ?? {},
            polylines: _polylines,
            onMapCreated: _mapService.onMapCreated,
            onCameraMove: _mapService.onCameraMove,
          );
        },
      ),
    );
  }
}
