import 'dart:async';
import 'dart:io';

import 'package:donut/controller/board_controller.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/category/mock_category.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_area.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/components/donut_text_title_and_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class BoardDonutWriteSecondBodyForm extends ConsumerStatefulWidget {
  File? imgFile;
  String title;
  String category;
  int onePrice;
  int qty;
  List<String> tags;
  BoardDonutWriteSecondBodyForm(
      {required this.imgFile, required this.title, required this.category, required this.onePrice, required this.qty, required this.tags, Key? key})
      : super(key: key);

  @override
  _BoardDonutWriteSecondBodyFormState createState() =>
      _BoardDonutWriteSecondBodyFormState();
}

class _BoardDonutWriteSecondBodyFormState
    extends ConsumerState<BoardDonutWriteSecondBodyForm> {
  final _contentController = TextEditingController();
  final _placeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isDirect = true;
  bool isApp = false;
  late List<bool> isSelectedPayment = [isDirect, isApp];

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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DonutTextFormFieldSlim(
                  readOnly: true,
                  hint: "지도를 클릭하면 주소가 나와요",
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
                      gestureRecognizers: <
                          Factory<OneSequenceGestureRecognizer>>{
                        Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer())},
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
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                DonutTextTitleAndContent(
                    title: "마감 시간 설정",
                    content: "마감 시간 까지 사람이 모이지 않으면 자동으로 종료됩니다."),
                Container(
                  width: getScreenWidth(context) * 0.9,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: donutColorBasic),
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
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );

                        selectedDate.then((dateTime) {
                          setState(() {
                            _selectedDate =
                                DateFormat("yyyy년 MM월 dd일").format(dateTime!);
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
                          initialEntryMode: TimePickerEntryMode.dialOnly,
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
                SizedBox(
                  height: 20,
                ),
                DonutTextTitleAndContent(
                  title: "결제 방식 설정",
                  content: "앱 결제의 경우 거래 확정 후 완료될 시 도넛마켓에 모인 돈을 주최자에게 줍니다",
                ),
                ToggleButtons(
                  fillColor: donutColor2,
                  selectedColor: donutColorBase,
                  borderRadius: BorderRadius.circular(20),
                  renderBorder: true,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          '직거래',
                          style: TextStyle(fontSize: 18),
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text('앱결제', style: TextStyle(fontSize: 18))),
                  ],
                  isSelected: isSelectedPayment,
                  onPressed: toggleSelect,
                ),
                SizedBox(height: 20,),
                DonutTextArea(
                    title: "상세 내용",
                    hint: "같이 사고 싶은 상품의 정보와 그 외의 필요 정보를 알려주세요.",
                    funValidator: validBoardContent(),
                    controller: _contentController),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: getScreenWidth(context) * 0.9,
                  child: DonutButton(
                      text: "모집 글 쓰기 완료",
                      funPageRoute: () {
                        //글쓰기 완료
                        int categoryId = 1;
                        mockCategories.forEach((element) {
                          if (element.name == widget.category) {
                            categoryId = element.id;
                          }
                        });
                        String paymentType = isDirect ? "직거래" : "앱결제";
                        if (_formKey.currentState!.validate()) {

                          String date = _selectedDate.replaceAll("년 ", "");
                          date = date.replaceAll("월 ", "");
                          date = date.replaceAll("일", "");
                          String time = _selectedTime.replaceAll("시 ", ":");
                          time = time.replaceAll("분", "");
                          // print('$date $time');
                          DateTime tm = DateTime.parse('$date $time');

                          ref.read(boardControllerProvider).savePost(
                              widget.imgFile,
                              categoryId,
                              widget.title,
                              _contentController.text,
                              _placeController.text.split(" ")[1],
                              _placeController.text.split(" ")[2],
                              _placeController.text.split(" ")[3],
                              _marker!.position.latitude,
                              _marker!.position.longitude,
                              widget.qty,
                              paymentType,
                              tm,
                              widget.onePrice,
                              widget.tags);
                        }
                      }),
                )
              ],
            ),
          ),
        ));
  }

  void toggleSelect(value) {
    if (value == 0) {
      isDirect = true;
      isApp = false;
    } else {
      isDirect = false;
      isApp = true;
    }
    setState(() {
      isSelectedPayment = [isDirect, isApp];
    });
  }

  //지도 마커
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

  //지도 현재 위치
  Future<void> _getCurrentLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: currentLatLng,
      zoom: 17,
    )));
  }

  //지도 권한
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
