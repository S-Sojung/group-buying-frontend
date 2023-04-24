import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DonutMap extends StatefulWidget {
  const DonutMap({super.key});

  @override
  State<DonutMap> createState() => _DonutMapState();
}

class _DonutMapState extends State<DonutMap> {
  late LatLng currentLatLng = LatLng(37.33500926, -122.03272188);
  bool isInitialized = false;
  bool isPermission = false;
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }


  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    setState(() {
      isPermission = true;
    });
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLatLng = LatLng(position.latitude, position.longitude);
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      if (isPermission) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return const Scaffold(
        body: Center(
          child: Text('You need location permission to view this page'),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(
              target: currentLatLng,
              zoom: 17,
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller.complete(controller);
              });
            },
            // markers: <Marker>{
            //   Marker(
            //     markerId: const MarkerId("1"),
            //     position: currentLatLng,
            //     icon: BitmapDescriptor.defaultMarker,
            //     infoWindow: const InfoWindow(
            //       title: "My Location",
            //     ),
            //   ),
            //   Marker(
            //     markerId: const MarkerId("2"),
            //     position: destinationLatLng,
            //     icon: BitmapDescriptor.defaultMarker,
            //     infoWindow: const InfoWindow(
            //       title: "Destination",
            //     ),
            //   ),
            // },
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: currentLatLng,
      zoom: 17,
    )));
  }
}