import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePagetwo extends StatefulWidget {
  const MyHomePagetwo({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagetwo> {
  // Google Maps controller
  late GoogleMapController mapController;

  // Initial camera position (you can set your preferred location)
  final LatLng _initialCameraPosition = const LatLng(37.7749, -122.4194);

  // Completer to handle the initialization of Google Maps
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
      ),
      body: GoogleMap(
       
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        
        initialCameraPosition: CameraPosition(
          target: _initialCameraPosition,
          zoom: 10.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic for the floating action button
          // For example, you can zoom to a specific location
          _goToLocation();
        },
        child: const Icon(Icons.map_rounded),
      ),
    );
  }

  // Function to move the camera to a specific location
  Future<void> _goToLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(_initialCameraPosition));
  }
}
