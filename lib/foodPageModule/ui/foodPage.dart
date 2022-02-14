import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/foodPageModule/controller.dart';
import 'package:get/get.dart' as GetX;

class DietFoodPage extends StatefulWidget {
  const DietFoodPage({Key? key}) : super(key: key);

  @override
  _DietFoodPageState createState() => _DietFoodPageState();
}

class _DietFoodPageState extends State<DietFoodPage> {
  final choices = ['전체보기', '샐러드', '가슴살', '아몬드', '보충제', '비타민'];
  double a = 1.0;
  final _controller = GetX.Get.find<FoodPageController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Text('탄수화물(g) : ' + '$a',
                        style: TextStyle(fontSize: 10))),
                Container(
                    child:
                        Text('지방(g): ' + '$a', style: TextStyle(fontSize: 10))),
                Container(
                    child:
                        Text('단백질(g): ' + '$a', style: TextStyle(fontSize: 10)))
              ],
            ),
            Expanded(
                child: Container(
                    child: Text('가격(원): ' + '$a',
                        style: TextStyle(fontSize: 10)))),
            Container(
                child: new Image.asset('assets/icon/shopping.png',
                    width: 50, height: 50))
          ]),
          centerTitle: false,
          toolbarHeight: 40,
          bottom: TabBar(
            // map 함수는 리스트의 요소를 하나씩 전달한 결과로
            // Iterable 객체를 생성하기 때문에 toList 함수로 변환
            tabs: choices.map((String choice) {
              // text는 탭바에 표시할 내용. 지금은 아이콘 없이 문자열만 사용.
              return Tab(text: choice);
            }).toList(),
            isScrollable: true, // 많으면 자동 스크롤
            labelColor: Colors.black,
          ),
        ),
        // 탭바와 연결된 탣바뷰 생성.
        // 탭바 코드와 똑같이 map 함수로 리스트 생성

        body: TabBarView(
          children: choices.map((String choice) {
            Widget Widget_Result = Row();
            if (choice == '전체보기') {
              Widget_Result = Container(
                  child: GetX.Obx(() => Text(_controller
                      .productList[0].product_carbonhydrate
                      .toString())));
            }

            return Widget_Result;
          }).toList(),
        ),
      ),
    );
  }
}
