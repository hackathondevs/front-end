import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchAnimalPage extends StatefulWidget {
  const SearchAnimalPage({super.key});

  @override
  State<SearchAnimalPage> createState() => _SearchToiletPageState();
}

class _SearchToiletPageState extends State<SearchAnimalPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(-7.295787661660789, 112.73627214158793), zoom: 16);
  @override
  Widget build(BuildContext context) {
    var markers = {
      const Marker(
          markerId: MarkerId('1'),
          position: LatLng(-7.296691437475779, 112.73602656088153)),
      const Marker(
          markerId: MarkerId('2'),
          position: LatLng(-7.296760373854246, 112.73602656088132)),
      const Marker(
          markerId: MarkerId('3'),
          position: LatLng(-7.296193689672815, 112.73546845403692)),
      const Marker(
          markerId: MarkerId('4'),
          position: LatLng(-7.2954757792118, 112.73601487915549)),
      const Marker(
          markerId: MarkerId('5'),
          position: LatLng(-7.2945247329773295, 112.73625766419416)),
      const Marker(
          markerId: MarkerId('6'),
          position: LatLng(-7.295066684146763, 112.73455057372487)),
      const Marker(
          markerId: MarkerId('7'),
          position: LatLng(-7.296657952848132, 112.73825671724784)),
      const Marker(
          markerId: MarkerId('8'),
          position: LatLng(-7.295633694165194, 112.73516670048272)),
    };
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),
    );
  }
}
