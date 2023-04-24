import 'dart:async';

import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class BoardDonutWriteSecondBodyForm extends StatefulWidget {
  const BoardDonutWriteSecondBodyForm({Key? key}) : super(key: key);

  @override
  State<BoardDonutWriteSecondBodyForm> createState() =>
      _BoardDonutWriteSecondBodyFormState();
}

class _BoardDonutWriteSecondBodyFormState
    extends State<BoardDonutWriteSecondBodyForm> {
  final _placeController = TextEditingController();
  final _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late LatLng currentLatLng = LatLng(37.33500926, -122.03272188);
  Marker? _marker;
  bool isInitialized = false;
  bool isPermission = false;

  String _selectedDate = DateFormat("yyyy년 MM월 dd일").format(DateTime.now());
  String _selectedTime = DateFormat("HH시 mm분").format(DateTime.now());

  final Completer<GoogleMapController> _mapController = Completer();

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
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
        body: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              DonutTextFormFieldSlim(
                title: "거래 희망 장소",
                funValidator: validateTitle(),
                controller: _placeController,
              ),
              Container(
                  width: getScreenWidth(context) * 0.9,
                  height: getScreenWidth(context) * 0.9,
                  decoration:
                      BoxDecoration(border: Border.all(color: donutColorBasic)),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: currentLatLng,
                      zoom: 17,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        _mapController.complete(controller);
                      });
                    },
                    markers: _marker != null ? Set.of([_marker!]) : Set(),
                    onTap: _onMapTapped,
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: getScreenWidth(context)*0.9,
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: donutColorBasic),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$_selectedDate'),
                    SizedBox(
                      width: 20,
                    ),
                    Text('$_selectedTime'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DonutRoundButton(
                    text: '날짜 설정',
                    funPageRoute: () {
                      Future<DateTime?> selectedDate = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2030),
                      );

                      selectedDate.then((dateTime) {
                        setState(() {
                          _selectedDate = DateFormat("yyyy년 MM월 dd일").format(dateTime!);
                        });
                      });
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DonutRoundButton(
                    funPageRoute: () {
                      Future<TimeOfDay?> selectedTime = showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      selectedTime.then((timeOfDay) {
                        setState(() {
                          _selectedTime =
                              '${timeOfDay!.hour}시 ${timeOfDay.minute}분';
                        });
                      });
                    },
                    text: '시간 설정',
                  ),
                ],
              ),
            ],
          )),
    ));
  }

  Future<void> _onMapTapped(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark placemark = placemarks.first;

    String address = "${placemark.street!.replaceFirst("대한민국", "")}";
    //  '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';

    setState(() {
      _placeController.text = address;
      // print(address);
      _marker = Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
      );
    });
  }

  Future<void> _getCurrentLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: currentLatLng,
      zoom: 17,
    )));
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
      return Future.error('위치 권한이 영구적으로 거부되었습니다. 권한을 요청할 수 없습니다.');
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
}
