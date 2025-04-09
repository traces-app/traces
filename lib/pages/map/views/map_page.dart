import 'dart:async';
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
  // ignore: prefer_final_fields
  Set<Polyline> _polylines = {};

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

  void testDirections() async {
    DirectionsService directionsService = DirectionsService();
    LatLng end = LatLng(37.7749, -122.4194);

    ExternalLocationService()
        .fetchRealtimeLatLng()
        .listen((LatLng start) async {
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
