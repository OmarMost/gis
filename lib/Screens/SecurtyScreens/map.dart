import 'dart:async';
import 'dart:typed_data'; //Uint8List
import 'dart:ui'; //pictureRecorder
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MTIMAP extends StatefulWidget {
  const MTIMAP({super.key});
  @override
  State<MTIMAP> createState() => _MTIMAPState();
}

class _MTIMAPState extends State<MTIMAP> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition MTI = CameraPosition(
      //_kGooglePlex موقع شركة جوجل محطوط افتراضي
      target: LatLng(29.993400, 31.311350), //MTI :: LatLng(29.993400, 31.311350),
      zoom: 19.30,
      bearing: 10.2 //To rotate the map, decreas go to the مع عقارب الساعة
  );

  //To Add Pins (Markers)
  Set<Marker> _markers = Set(); // Set to store markers

  @override
  void initState() {
    super.initState();

    _markers.add(Marker(
      markerId: MarkerId('cafe1'), //identifier Marker (Unique)
      position: LatLng(29.993490, 31.311200),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Cafe 1',
      ),
    ));
    _markers.add(Marker(
      markerId: MarkerId('cafe2'), //identifier Marker (Unique)
      position: LatLng(29.993250, 31.311150),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Cafe 2',
      ),
    ));
    _markers.add(Marker(
      markerId: MarkerId('cafe3'), //identifier Marker (Unique)
      position: LatLng(29.993445, 31.311500),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Cafe 3',
      ),
    ));
    _markers.add(Marker(
      markerId: MarkerId('cafe4'), //identifier Marker (Unique)
      position: LatLng(29.993200, 31.311450),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Cafe 4',
      ),
    ));
    _markers.add(Marker(
      markerId: MarkerId('lectures'), //identifier Marker (Unique)
      position: LatLng(29.993745, 31.311430),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Lectures Building',
      ),
    ));
    _markers.add(Marker(
      markerId: MarkerId('mamagement'), //identifier Marker (Unique)
      position: LatLng(29.992830, 31.311240),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Mamagement Building',
      ),
    ));
    _markers.add(Marker(
      markerId: MarkerId('sections'), //identifier Marker (Unique)
      position: LatLng(29.993380, 31.311000),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Sections Building',
      ),
    ));
    _markers.add(Marker(
      markerId: MarkerId('labs'), //identifier Marker (Unique)
      position: LatLng(29.993277, 31.311650),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
      infoWindow: InfoWindow( // Optional, adds a pop-up window when the marker is tapped
        title: 'Labs Building',
      ),
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromARGB(137, 105, 68, 68),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.satellite, //put "hybrid" to show details
                initialCameraPosition: MTI,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: _markers, // Set of Pins (Markers) to be displayed on the map
                myLocationEnabled: true,
                myLocationButtonEnabled: true, // Enable my location button
              ),
            )
          ],
        ),
      ),
    );
  }
}
