import 'dart:async'; //to Completer
// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

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
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation(); // Get current location of Sec.

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

  void _addSecurityMarker(double lat, double long) { //sec_Logo2.png
    // _marker.add(Marker(
    //   markerId: MarkerId('securityloc'), // Unique identifier for the marker
    //   position: LatLng(lat, long), // Security location
    //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    //   infoWindow: InfoWindow(
    //     title: 'Security Location !!',
    //   ),
    // ));
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(30,30)),
      'assets/iconsec.png', // 'assets/iconsec.png'
    ).then((icon) {
      setState(() {
        _marker.add(Marker(
          markerId: MarkerId('securityloc'),
          position: LatLng(lat, long),
          icon: icon,
          infoWindow: InfoWindow(
            title: 'Your Location',
          ),
        ));
      });
    });
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {

      _addSecurityMarker(position.latitude, position.longitude);
      _addPolyline(position.latitude, position.longitude, widget.lat, widget.long);
    });
  }

  void _addPolyline(double secLat, double secLong, double studentLat, double studentLong) {
    _polylines.add(Polyline(
      polylineId: PolylineId('path'),
      points: [
        LatLng(secLat, secLong), // Security location
        LatLng(studentLat, studentLong), // Student location
      ],
      color: Colors.blue,
      width: 5,
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
                markers: _marker, // Set of Pin (Marker) to be displayed on the map
                polylines: _polylines,
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