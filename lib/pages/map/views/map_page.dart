import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  bool _isMapReady = false;

  LatLng? _currentPosition;
  StreamSubscription<Position>? _positionStream;

  final LatLng _defaultCenter =
      const LatLng(7.821603639133135, 80.406256487888);

  @override
  void initState() {
    super.initState();
    _initializeLocationTracking();
  }

  @override
  void dispose() {
    _positionStream?.cancel(); // Cancel location updates when disposed
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _isMapReady = true;

    // Load and apply custom map style
    try {
      String styleJson = await rootBundle.loadString('assets/map/styles.json');
      _mapController?.setMapStyle(styleJson);
    } catch (e) {
      print("❌ Error loading map style: $e");
    }

    // Move to current location if already available
    if (_currentPosition != null) {
      _moveCamera(_currentPosition!);
    }
  }

  Future<void> _initializeLocationTracking() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("⚠️ Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("❌ Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("❌ Location permissions are permanently denied.");
      return;
    }

    try {
      // Get initial position
      Position initialPosition = await Geolocator.getCurrentPosition();
      _updateLocation(initialPosition);

      // Start listening to location updates
      _positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 5,
        ),
      ).listen(_updateLocation);
    } catch (e) {
      print("❌ Error getting location: $e");
    }
  }

  void _updateLocation(Position position) {
    final newLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _currentPosition = newLatLng;
    });

    // Move camera only when map is ready
    if (_isMapReady) {
      _moveCamera(newLatLng);
    }
  }

  void _moveCamera(LatLng position) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        backgroundColor: Colors.black,
        middle: const Text(
          "Map View",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        leading: Navigator.of(context).canPop()
            ? CupertinoNavigationBarBackButton(
                color: const Color(0xFF0A84FF),
                previousPageTitle: "Back",
                onPressed: () => Navigator.pop(context),
              )
            : null,
        trailing: IconButton(
          onPressed: () {
            // You can define search action here
          },
          icon: const Icon(
            CupertinoIcons.search,
            size: 24.0,
            color: Color(0xFF0A84FF),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentPosition ?? _defaultCenter,
                zoom: 15.0,
              ),
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
