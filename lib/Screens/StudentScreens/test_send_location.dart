import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class sendLocation extends StatelessWidget {
  // const sendLocation({super.key});
  final double latitude;
  final double longitude;

  sendLocation({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 15
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Report Details'),
      ),
      body: GoogleMap(
        initialCameraPosition: initialLocation,
        markers: {
          Marker(
            markerId: MarkerId('ReportLocation'),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(
              title: 'Report Location',
              snippet: 'This is where the report was created.',
            )
          )
        },
      ),
    );
  }
}