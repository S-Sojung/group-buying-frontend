import 'package:donut/core/constants/size.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/components/board_list.dart';
import 'package:donut/views/components/donut_appbar.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/board/search_page/board_search_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardSearchPage extends ConsumerStatefulWidget {
  const BoardSearchPage({Key? key}) : super(key: key);

  @override
  _BoardSearchPageState createState() => _BoardSearchPageState();
}

class _BoardSearchPageState extends ConsumerState<BoardSearchPage> {
  final _searchController = TextEditingController();
  String word = "";
  List<Board> boardlist = [];
  @override
  Widget build(BuildContext context) {
    BoardSearchPageModel? model = ref.watch(boardSearchPageProvider(word));
    boardlist = [];
    if (model != null) {
      model!.boards.forEach((element) {
        Board board = Board(id:element.id,
            title: element.title,
            img: element.img,
            state: element.state,
            city: element.city,
            town: element.town,
            price: element.event.price,
            qty: element.event.qty,
            latitude: element.event.latitude,
            longtitude: element.event.longtitude,
            paymentType: element.event.paymentType,
            recommend: element.recommend,
            endAt: element.event.endAt);
        boardlist.add(board);
      });
    }

    return Scaffold(
      appBar: subAppbar("검색하기"),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
          child: Column(
            children: [
              Form(
                child: Row(
                  children: [
                    Container(
                        width: getScreenWidth(context) * 0.75,
                        child: DonutTextFormFieldSlim(
                            title: "",
                            controller: _searchController,
                            funValidator: validateTitle())),
                    Container(
                      width: getScreenWidth(context) * 0.2,
                      child: DonutButton(
                          text: "검색",
                          funPageRoute: () {
                            if (_searchController.text.trim().length > 0) {
                              setState(() {
                                word = _searchController.text.trim();
                              });
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
          boardlist.length == 0 ?
          SliverToBoxAdapter(
              child: Container(
                height: getScreenHeigth(context) * 0.6,
                alignment: Alignment.center,
                child: Text("검색 결과가 없습니다."),
              )) :
          BoardList(boards: boardlist, listSize: 0.75),
        ]
      ),
    );
  }
}
