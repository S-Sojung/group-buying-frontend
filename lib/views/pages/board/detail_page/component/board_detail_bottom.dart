import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/model/participant/participant.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_label_round_textbox.dart';
import 'package:donut/views/pages/board/selete_participant_page/select_participant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardDetailBottom extends StatelessWidget {

  const BoardDetailBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.05, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/images/heart_donut.svg",
                    height: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " 수량 : ${events[0].qty}",
                      style: bodyText(),
                    ),
                    Text(
                      " 개당 ${events[0].price}원",
                      style: bodyText(),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                width: 200,
                child:
                // Organizer ID를 통해서 주최자인지 확인, 혹은 내가 참여한 게시글인지 확인
                    OrganizerButton(),
                //     PurchaserButton()
                //     ParticipantButton()
                )
          ],
        ),
      ),
    );
  }
}

class OrganizerButton extends StatelessWidget {
  const OrganizerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DonutButton(
        text: "진행 단계 변경하기",
        funPageRoute: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200, // 모달 높이 크기
                decoration: const BoxDecoration(
                  color: Colors.white, // 모달 배경색
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DonutButton(text: "공동구매 마감하기", funPageRoute: () {
                        //예약자가 한 명이라고 있는데 마감하면 취소 알림보내줌
                      }),
                      DonutButton(text: "예약중으로 변경하기", funPageRoute: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SelectParticipantPage(),));
                      }),
                    ],
                  ),
                ), // 모달 내부 디자인 영역
              );
            },
          );
        });
  }
}



class PurchaserButton extends StatefulWidget {
  const PurchaserButton({
    super.key,
  });

  @override
  State<PurchaserButton> createState() => _PurchaserButtonState();
}

class _PurchaserButtonState extends State<PurchaserButton> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return DonutButton(
        text: "참가 하기",
        funPageRoute: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: getScreenHeigth(context) * 0.7,
                decoration: const BoxDecoration(
                  color: Colors.white, // 모달 배경색
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), // 모달 좌상단 라운딩 처리
                    topRight: Radius.circular(20), // 모달 우상단 라운딩 처리
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${boards[0].title}",
                      style: title1(),
                    ),
                    Text(
                      "참가 하기 전에 확인해요!",
                      style: bodyText(mColor: donutColorBasic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment(-0.7, 0),
                        child: Text("개설자가 정한 규칙이에요")),
                    DonutLabelRoundTextbox(
                      title: "결제 방식",
                      content: events[0].paymentType,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DonutLabelRoundTextbox(
                      title: "위치",
                      content: "${boards[0].city} ${boards[0].town}",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DonutLabelRoundTextbox(
                      title: "시간",
                      content: "${events[0].endAt}",
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    StatefulBuilder(
                      builder: (context, state){
                        return Column(
                          children: [
                            DonutLabelRoundTextbox(
                              title: "갯수",
                              content: "${_currentSliderValue.toInt()}",
                            ),
                            Slider(
                              activeColor: donutColorBasic,
                              value: _currentSliderValue,
                              // max: double.parse("${events[0].qty}"),
                              // divisions: events[0].qty,
                              max: 20,
                              min: 1,
                              divisions: 20,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                state((){
                                  _currentSliderValue = value;
                                });
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ],
                        );
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: getScreenWidth(context) * 0.9,
                        child: DonutButton(
                            text: "참가 신청",
                            funPageRoute: () {
                              if (_currentSliderValue > events[0].qty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("수량보다 많이 살 순 없어요")));
                                return null;
                              }
                            })),
                  ],
                ), // 모달 내부 디자인 영역
              );
            },
          );
        });
  }
}

class ParticipantButton extends StatelessWidget {
  const ParticipantButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DonutButton(
        text: "참가 중",
        funPageRoute: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: getScreenHeigth(context) * 0.7,
                decoration: const BoxDecoration(
                  color: Colors.white, // 모달 배경색
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), // 모달 좌상단 라운딩 처리
                    topRight: Radius.circular(20), // 모달 우상단 라운딩 처리
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${boards[0].title}",
                      style: title1(),
                    ),
                    Text(
                      "참가 하기 전에 확인해요!",
                      style: bodyText(mColor: donutColorBasic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment(-0.7, 0),
                        child: Text("개설자가 정한 규칙이에요")),
                    DonutLabelRoundTextbox(
                      title: "결제 방식",
                      content: events[0].paymentType,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DonutLabelRoundTextbox(
                      title: "위치",
                      content: "${boards[0].city} ${boards[0].town}",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DonutLabelRoundTextbox(
                      title: "시간",
                      content: "${events[0].endAt}",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DonutLabelRoundTextbox(
                      title: "구매 수량",
                      content: "${participants[0].qty} 개",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("페이 거래 시 구매확정을 눌리면 개설자에게 돈이 보내집니다 \n"
                        "개설자가 구매를 마감하면 5일 뒤 자동 구매 확정이 됩니다."),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: getScreenWidth(context) * 0.45,
                            child: DonutButton(
                                text: "참가 취소", funPageRoute: () {})),
                        Container(
                            width: getScreenWidth(context) * 0.45,
                            child: DonutButton(
                                text: "구매 확정",
                                funPageRoute: () {
                                  //예약자 일 경우 활성화 된다.
                                  //결제 완료된 사람이면 구매 확정 버튼 비활성화 -> 구매 확정으로 바뀜
                                  //혹은 아직 결제 전이면서 앱 결제라면  결제 창을 띄워줌.
                                })),
                      ],
                    )
                  ],
                ), // 모달 내부 디자인 영역
              );
            },
          );
        });
  }
}
