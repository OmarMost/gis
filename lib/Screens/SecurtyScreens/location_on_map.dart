import 'dart:async'; //to Completer
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class locationOnMap extends StatefulWidget {
  double lat, long;
  String type;
  locationOnMap({super.key, required this.lat, required this.long, required this.type});

  @override
  State<locationOnMap> createState() => _locationOnMapState();
}

class _locationOnMapState extends State<locationOnMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition MTI = CameraPosition(
      target: LatLng(29.993400, 31.311350), //MTI :: LatLng(29.993400, 31.311350),
      zoom: 19.30,
      bearing: 10.2 //To rotate the map, decreas go to the مع عقارب الساعة
  );

  //To Add Pins (Markers)
  Set<Marker> _marker = Set(); // Set to store marker

  @override
  void initState() {
    super.initState();

    if(widget.type == 'SOS') {
      _marker.add(Marker(
        markerId: MarkerId('userloc'), //identifier Marker (Unique)
        position: LatLng(widget.lat, widget.long),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), // (hueRed): Red Pin icon
        infoWindow: InfoWindow(
          title: 'Student Location !!',
        ),
      ));
    } else if(widget.type == "problem") {
        _marker.add(Marker(
          markerId: MarkerId('userloc'), //identifier Marker (Unique)
          position: LatLng(widget.lat, widget.long),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow( 
            title: 'Student Location !!',
          ),
        ));
    } else {
        _marker.add(Marker(
          markerId: MarkerId('userloc'), //identifier Marker (Unique)
          position: LatLng(widget.lat, widget.long),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen), 
          infoWindow: InfoWindow( 
            title: 'Student Location !!',
          ),
        ));
    }
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
                markers: _marker, // Set of Pin (Marker) to be displayed on the map
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