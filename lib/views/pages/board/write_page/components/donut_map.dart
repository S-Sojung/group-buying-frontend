import 'dart:async';

import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DonutMap extends StatefulWidget {
  const DonutMap({super.key});

  @override
  State<DonutMap> createState() => _DonutMapState();
}

class _DonutMapState extends State<DonutMap> {
  final _placeController = TextEditingController();
  late LatLng currentLatLng = LatLng(37.33500926, -122.03272188);
  bool isInitialized = false;
  bool isPermission = false;

  late Position _currentPosition;
  Set<Marker> _markers = {};

  final Completer<GoogleMapController> _mapController = Completer();
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
      return Future.error('위치 서비스를 사용할 수 없습니다.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('위치 권한이 거부되었습니다');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          '위치 권한이 영구적으로 거부되었습니다. 권한을 요청할 수 없습니다.');
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
          child: Text('이 페이지를 보려면 위치 권한이 필요합니다'),
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          DonutTextFormFieldSlim(title: "거래 희망 장소", funValidator: validateTitle(),controller: _placeController,),

        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: currentLatLng,
      zoom: 17,
    )));
  }
}