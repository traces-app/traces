/*
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:traces/features/map/services/internal_location_service.dart';
import 'package:traces/features/map/widgets/map.dart';
import 'package:traces/features/map/widgets/marker_icon.dart';
import 'package:traces/features/map/widgets/title_bar.dart';
import 'package:traces/shared/services/firebase_realtime_database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  StreamSubscription? _locationSubscription;
  StreamSubscription? _firebaseLocationSubscription;
  Set<Marker> myMarkers = {};

  LatLng? _currentPosition;
  double? _currentZoom = 0.0;
  final LatLng _defaultCenter =
      const LatLng(7.821603639133135, 80.406256487888);

  /*
      LatLng(6.9271, 79.8612), // Colombo
      LatLng(7.5620, 79.8017), // Halawatha
      LatLng(7.4818, 80.3609), // Kurunegala
      LatLng(7.8216, 80.4062), // Polpithigama
  */

  Future<void> _loadMarkers() async {
    BitmapDescriptor customIcon = await MarkerIcon.major();
    BitmapDescriptor addressIcon = await MarkerIcon.address();

    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(6.9271, 79.8612),
        infoWindow: const InfoWindow(title: "Colombo"),
        icon: customIcon, // Now we can use the custom icon
      ),
      Marker(
        markerId: const MarkerId("3"),
        position: LatLng(7.4818, 80.3609),
        infoWindow: const InfoWindow(title: "Kurunegala"),
        icon: customIcon, // Now we can use the custom icon
      ),
      Marker(
        markerId: const MarkerId("4"),
        position: LatLng(7.821603639133135, 80.406256487888),
        infoWindow: const InfoWindow(title: "Polpithigama"),
        icon: addressIcon, // Now we can use the custom icon
      ),
    };

    setState(() {
      myMarkers = markers;
    });
  }

  void _listenToLocationChanges() {
    // Get the DatabaseReference for the 'locations' path
    DatabaseReference locationsRef = databaseService.listenToData('locations');

    // Listen to real-time changes
    locationsRef.onValue.listen((DatabaseEvent event) {
      final dynamic data = event.snapshot.value;
      if (data != null) {
        // Iterate over the locations (assuming it's a Map-like structure)
        data.forEach((key, value) {
          // Access latitude, longitude, and title dynamically
          double latitude = value['latitude'] as double;
          double longitude = value['longitude'] as double;
          String title = value['title'] as String? ?? 'Driver Location';

          LatLng latLng = LatLng(latitude, longitude);
          _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));

          // add marker to show the location
          myMarkers.add(
            Marker(
              markerId: MarkerId(key.toString()),
              position: LatLng(latitude, longitude),
              infoWindow: InfoWindow(title: title),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );

          print(
              "it works!: " + latitude.toString() + " " + longitude.toString());
        });
      }
    });
  }

  Future<void> _signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "testuser@example.com",
        password: "testpassword",
      );
      print(userCredential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print("Wrong password provided for that user.");
      } else {
        print(e.message);
      }
    }
  }

  final FirebaseRealtimeDatabaseService databaseService =
      FirebaseRealtimeDatabaseService();

  Future<void> _fetchDataFromFirebase() async {
    try {
      DataSnapshot snapshot = await databaseService.readData('locations');
      if (snapshot.value != null) {
        // Use dynamic typing to avoid explicit Map usage
        final dynamic locations = snapshot.value;
        Set<Marker> markers = {};

        // Iterate over the locations (assuming it's a Map-like structure)
        locations.forEach((key, value) {
          // Access latitude, longitude, and title dynamically
          double latitude = value['latitude'] as double;
          double longitude = value['longitude'] as double;
          String title = value['title'] as String? ?? 'Driver Location';
          print(
              "it works!: " + latitude.toString() + " " + longitude.toString());

          markers.add(
            Marker(
              markerId: MarkerId(key.toString()),
              position: LatLng(latitude, longitude),
              infoWindow: InfoWindow(title: title),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );
        });

        setState(() {
          myMarkers.addAll(markers);
        });
      }
    } catch (e) {
      print("Failed to fetch data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    // _setupLocationTracking();
    // _dbRef = FirebaseDatabase.instance.ref();
    // _signInAndFetchData();
    _signIn();
    _fetchDataFromFirebase();
    _listenToLocationChanges();
    _loadMarkers();
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _setupLocationTracking() async {
    Position? position = await LocationService.getInitialPosition();
    if (position != null) {
      setState(
        () {
          _currentPosition = LatLng(position.latitude, position.longitude);
        },
      );
    } else {
      setState(
        () {
          _currentPosition = _defaultCenter;
        },
      );
    }

    _locationSubscription = LocationService.listenToLocationUpdates(
      (Position pos) {
        LatLng newPosition = LatLng(pos.latitude, pos.longitude);

        setState(
          () {
            _currentPosition = newPosition;
          },
        );

        /*
        _dbRef?.child("locations/nFcPC2FWpjNcyfAhGWgvEkszWBX2").set({
          "latitude": pos.latitude,
          "longitude": pos.longitude,
          "timestamp": ServerValue.timestamp,
        });
        print("sending locaiton info");
        */

        /*
        _mapController?.animateCamera(CameraUpdate.newLatLng(newPosition));
        */
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: TitleBar(),
      body: Map(
        initialPosition: _currentPosition ?? _defaultCenter,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        markers: myMarkers,
        onCameraMove: (CameraPosition position) {
          setState(() {
            _currentZoom = position.zoom;
          });
        },
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traces/features/map/services/camera_service.dart';
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

  @override
  void initState() {
    super.initState();
    _mapService.init();
  }

  @override
  void dispose() {
    _mapService.dispose();
    super.dispose();
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
            onMapCreated: _mapService.onMapCreated,
            onCameraMove: _mapService.onCameraMove,
          );
        },
      ),
    );
  }
}
