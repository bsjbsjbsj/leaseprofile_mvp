import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/studioPageModule/model/studioPageModel.dart';

class StudioShop extends StatefulWidget {
  const StudioShop({Key? key}) : super(key: key);

  @override
  _StudioShopState createState() => _StudioShopState();
}

class _StudioShopState extends State<StudioShop> {
  final choices = ['스튜디오', '사진작가', '의상', '메이크업', '왁싱', '태닝'];
  double a = 1.0;

  @override
  Widget build(BuildContext context) {
    // 가장 간단하고 쉽게 사용할 수 있는 기본 탭바 컨트롤러. 탭바와 탭바뷰 연결.
    return DefaultTabController(
        length: choices.length,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: Row(
                  children: <Widget>[
                    Flexible(
                        child: SizedBox(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Search',
                                hintText: '유명한 스튜디오',
                                labelStyle: TextStyle(color: Colors.redAccent),

                                //focusedBorder: OutlineInputBorder(
                                //  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                //  borderSide:
                                //  BorderSide(width: 1, color: Colors.redAccent),
                                //),
                                //enabledBorder: OutlineInputBorder(
                                //  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                //  borderSide:
                                //  BorderSide(width: 1, color: Colors.redAccent),
                                //),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ))),
                    InkWell(
                        onTap: () {},
                        child: new Image.asset('assets/icon/setting.png',
                            width: 30, height: 30))
                  ],
                ),
                centerTitle: false,
                toolbarHeight: 50,
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
                  if (choice == '스튜디오') {
                    Widget_Result = Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 100,
                          child: Image.asset(
                            'assets/1.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            '닭가슴살 200g \n 7,000원',
                            textAlign: TextAlign.center,
                          ),
                        )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              a++;
                            });
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.centerRight,
                            child: new Image.asset('assets/icon/shopping.png',
                                width: 50, height: 50),
                          ),
                        ),
                      ],
                    );
                  }

                  return Widget_Result;
                }).toList(),
              ),
            ),
            Visibility(
                visible: false,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 80, 30, 30),
                    child: Container(
                      color: Colors.red,
                      child: GridView.extent(
                        primary: false,
                        padding: const EdgeInsets.all(20.0),
                        maxCrossAxisExtent: 100,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        children: <Widget>[
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                          Container(color: Colors.green),
                        ],
                      ),
                    )))
          ],
        ));
  }
}
