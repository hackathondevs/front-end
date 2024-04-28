import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchToiletPage extends StatefulWidget {
  const SearchToiletPage({super.key});

  @override
  State<SearchToiletPage> createState() => _SearchToiletPageState();
}

class _SearchToiletPageState extends State<SearchToiletPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(-7.295787661660789, 112.73627214158793), zoom: 16);
  @override
  Widget build(BuildContext context) {
    var markers = {
      const Marker(
          markerId: MarkerId('1'),
          position: LatLng(-7.294057310422421, 112.7364722707601)),
      const Marker(
          markerId: MarkerId('2'),
          position: LatLng(-7.296760373854246, 112.73532964972408)),
      const Marker(
          markerId: MarkerId('3'),
          position: LatLng(-7.296193689672815, 112.73546845403692)),
      const Marker(
          markerId: MarkerId('4'),
          position: LatLng(-7.295108801985716, 112.7367426002107)),
      const Marker(
          markerId: MarkerId('5'),
          position: LatLng(-7.2970399436861335, 112.73717326789125)),
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
