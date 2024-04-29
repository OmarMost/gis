import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MTIMAP extends StatefulWidget {
  const MTIMAP({super.key});

  @override
  State<MTIMAP> createState() => _MTIMAPState();
}

class _MTIMAPState extends State<MTIMAP> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition MTI = CameraPosition( //_kGooglePlex موقع شركة جوجل محطوط افتراضي
    target: LatLng(29.993400, 31.311350),
    zoom: 19.30,
    bearing: 10.2 //To rotate the map, decreas go to the مع عقارب الساعة
  );

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
        child: Column(children: [
          Expanded(child: GoogleMap(
            mapType: MapType.satellite, //put "hybrid" to show details
            initialCameraPosition: MTI,
            onMapCreated: (GoogleMapController controller) {
             _controller.complete(controller);
            },
          ))
        ],),
      )
    );
  }
}