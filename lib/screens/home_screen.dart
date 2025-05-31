import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _mapController;
  LatLng _initialPosition = LatLng(37.7749, -122.4194); // Default to SF
  LocationData? _currentLocation;
  final Location _location = Location();

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  void _requestLocationPermission() async {
    final hasPermission = await _location.requestPermission();
    if (hasPermission == PermissionStatus.granted) {
      final loc = await _location.getLocation();
      setState(() {
        _currentLocation = loc;
        _initialPosition = LatLng(loc.latitude!, loc.longitude!);
      });
    }
  }

  void _requestRide() {
    FirebaseFirestore.instance.collection('rides').add({
      'userLocation': {
        'lat': _currentLocation?.latitude,
        'lng': _currentLocation?.longitude,
      },
      'status': 'requested',
      'timestamp': Timestamp.now(),
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Ride requested!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyRide Home")),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => _mapController = controller,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 14,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: _requestRide,
              child: Text("Request Ride"),
            ),
          ),
        ],
      ),
    );
  }
}
