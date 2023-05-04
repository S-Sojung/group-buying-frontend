import 'dart:async';

import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoardMapPage extends StatelessWidget {
  final _placeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final mapController;
  bool isInitialized;
  bool isPermission;
  List<Marker> markers ;
  LatLng currentLatLng ;
  BoardMapPage(
      {
        required this.markers,
        required this.mapController,
        required this.isPermission,
        required this.isInitialized,
        required this.currentLatLng,
      Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      if (isPermission) {
        return const CircularProgressIndicator();
      }
      return const Text('이 페이지를 보려면 위치 권한이 필요합니다');
    }
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DonutTextFormFieldSlim(
              hint: "지도를 클릭하면 주소가 나와요",
              title: "거래 희망 장소",
              funValidator: validateTitle(),
              controller: _placeController,
            ),
            Container(
              padding: EdgeInsets.all(20),
                height: getScreenHeigth(context) * 0.7,
                child: GoogleMap(
                  gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                    Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer())
                  },
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: currentLatLng,
                    zoom: 17,
                  ),
                  markers: Set.of(markers),

                )),
          ],
        ),
      ),
    );
  }
}
