import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/category/category.dart';
import 'package:donut/model/my_category/my_category.dart';
import 'package:donut/views/components/donut_appbar.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class UserCategoryPage extends StatefulWidget {
  const UserCategoryPage({Key? key}) : super(key: key);

  @override
  State<UserCategoryPage> createState() => _UserCategoryPageState();
}

class _UserCategoryPageState extends State<UserCategoryPage> {
  List<Category> notMyCategorylist = categorys.where((e) {
    bool tri=false;
    myCategorys.forEach((element) {
      if(e.id == element.categoryId)
        tri = true;
    });
    return !tri;
  }).toList();

  late Category? selectCategory;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subAppbar("관심 카테고리"),
      body: Column(
        children: [
          Text("설정된 카테고리는 꾹 누르면 삭제할 수 있어요!"),
          Expanded(
            child: GridView.builder(
              itemCount: myCategorys.length + 1,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120, mainAxisExtent: 160),
              itemBuilder: (context, index) {
                return index < myCategorys.length
                    ? _donutCategoryButton(index)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: myCategorys.length < categorys.length ? _donutAddCategoryButton(context)
                            : Container(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  InkWell _donutCategoryButton(int index) {
    return InkWell(
                      onLongPress: () {
                        setState(() {
                          notMyCategorylist.add(categorys[myCategorys[index].categoryId-1]);
                          myCategorys.removeAt(index);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: donutColorBasic),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                    "assets/categories/${category_eng[myCategorys[index].categoryId - 1]}.jpg"),
                                Text(
                                  "${categorys[myCategorys[index].categoryId - 1].name}",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
  }

  DonutButton _donutAddCategoryButton(BuildContext context) {
    return DonutButton(
                          text: "╋",
                          funPageRoute: () {
                            return showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('추가할 카테고리 선택하기'),
                                content: GroupButton(
                                  options: GroupButtonOptions(
                                      borderRadius: BorderRadius.circular(10),
                                      selectedColor: donutColorBasic),
                                  isRadio: true,
                                  onSelected: (value, index, isSelected) {
                                    selectCategory = notMyCategorylist[index];
                                  },
                                  buttons:
                                      notMyCategorylist.map((e) => e.name).toList(),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: ()
                                { selectCategory = null;
                                  return Navigator.pop(context, 'Cancel');},
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {

                                      setState(() {
                                        myCategorys.add(MyCatagory(
                                            id: 6,
                                            userId: 1,
                                            categoryId: selectCategory!.id,
                                            createdAt: DateTime.now()));
                                        notMyCategorylist
                                            .remove(selectCategory);
                                        selectCategory = null;
                                        Navigator.pop(context, 'OK');
                                      });
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          });
  }
}
