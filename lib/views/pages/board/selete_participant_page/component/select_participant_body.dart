import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/model/participant/participant.dart';
import 'package:donut/model/user/donutuser.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/pages/board/selete_participant_page/select_account_page.dart';
import 'package:flutter/material.dart';

class SelectParticipantBody extends StatefulWidget {
  const SelectParticipantBody({Key? key}) : super(key: key);

  @override
  State<SelectParticipantBody> createState() => _SelectParticipantBodyState();
}

class _SelectParticipantBodyState extends State<SelectParticipantBody> {
  List<Participant> partics = participants; // 이 게시글의 신청자들 이때, 취소한 사람은 여기서 걸러내도록 하거나 서버측에서 걸러서 와주겟지
  int selected = 0;


  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.05, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${selected}/${events[0].qty} 갯수", style: headLine()),
            Container(
              width: double.infinity,
              height: 450,
              child: ListView.builder(
                itemCount: partics.length, // 선택한 게시글 갯수
                itemBuilder: (context, index) {
                  //게시글 넘겨주기
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: partics[index].statusCode==302 ? donutColorBasic : Colors.transparent , width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        onTap: () {

                          setState(() {
                            if(partics[index].statusCode==302){
                              selected -= partics[index].qty;
                              partics[index].statusCode = 300 ;
                            }else{
                              if(selected >= events[0].qty){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("갯수보다 더 많은 인원을 선택할 수 없습니다.")));
                              }else{
                                selected += partics[index].qty;
                                partics[index].statusCode = 302;
                              }
                            }
                            //선택 후, 302가 아닌 참여자는 모두 301로 변경.
                          });
                        },
                        leading: CircleAvatar(
                            backgroundColor: donutColor1,
                            child: Icon(
                              Icons.circle_outlined,
                              color: donutColorBasic,
                            )),
                        title: Text(
                            "${users[partics[index].userId].name}   ${partics[index].qty} 개"),
                        subtitle: Text(
                          "${partics[index].createdAt}",
                          style: caption1(mColor: donutColor2),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //앱결제인지 직거래인지에 따라서 변경
            //
            DonutButton(text: "계좌 확인하기", funPageRoute: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => SelectAccountPage(),));
            } ),
            DonutButton(text: "예약중으로 변경하고 채팅하기", funPageRoute: (){}),
            
          ],
        ),
      ),
    );
  }
}
