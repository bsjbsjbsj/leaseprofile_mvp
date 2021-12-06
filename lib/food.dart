import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

class FoodPage extends StatelessWidget {
  late Widget? myBurgerList;
  BugerBar bugerBar = BugerBar();

  @override
  Widget build(BuildContext context) {
    myBurgerList = bugerBar.getBugerBar();

    return Scaffold(
      appBar: AppBar(
        title: Text('푸드'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: FoodTopMiddleBottom(),
      drawer: myBurgerList,
    );
  }
}


class FoodTopMiddleBottom extends StatefulWidget {
  const FoodTopMiddleBottom({Key? key}) : super(key: key);

  @override
  _FoodTopMiddleBottomState createState() => _FoodTopMiddleBottomState();
}

class _FoodTopMiddleBottomState extends State<FoodTopMiddleBottom> {
  bool isInputMessage = false;
  bool isEntireScreen = true;
  bool isChickenScreen = false;
  bool isSerialScreen = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Text('탄수화물(g) :'),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InPutPage(),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Text(' 터치하여 입력'),
                                  Container(
                                    color: Colors.black,
                                    height: 0.5,
                                    width: 100,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ), //탄수화물
                    ],
                  ),
                ),
              ],
            ),
          ),  //Top섹션 : 식단설계,인바디버튼
          Positioned(
            top: 250,
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEntireScreen = true;
                              isChickenScreen = false;
                              isSerialScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                '전체보기',
                                style: TextStyle(
                                    color: !isEntireScreen
                                        ? Colors.grey
                                        : Colors.purple),
                              ),
                              if (isEntireScreen)
                                Container(
                                  width: 50,
                                  height: 2,
                                  color: Colors.purple,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEntireScreen = false;
                              isChickenScreen = true;
                              isSerialScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                '닭가슴살',
                                style: TextStyle(
                                    color: !isChickenScreen
                                        ? Colors.grey
                                        : Colors.purple),
                              ),
                              if (isChickenScreen)
                                Container(
                                  width: 50,
                                  height: 2,
                                  color: Colors.purple,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEntireScreen = false;
                              isChickenScreen = false;
                              isSerialScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                '시리얼',
                                style: TextStyle(
                                    color: !isSerialScreen
                                        ? Colors.grey
                                        : Colors.purple),
                              ),
                              if (isSerialScreen)
                                Container(
                                  width: 50,
                                  height: 2,
                                  color: Colors.purple,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ), //가로 스크롤 (선택바 전체보기,닭가슴살,시리얼....)
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        if (isEntireScreen) //전체보기 페이지
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Gril()),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/cb1.jpg',
                                        fit: BoxFit.fitHeight,
                                      ),
                                      Column(
                                        children: [
                                          Text('그릴드 닭가슴살 120g'),
                                          Text('7800원'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),  //그릴드 닭가슴살
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Oreo()),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/se2.jpg',
                                        fit: BoxFit.fitHeight,
                                      ),
                                      Column(
                                        children: [
                                          Text('오레오 200g'),
                                          Text('6800원'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),  //오레오
                            ],
                          ),
                        if (isChickenScreen) //닭가슴살 페이지
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gril()),
                              );
                            },
                            child: Container(
                              height: 100,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/cb1.jpg',
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Column(
                                    children: [
                                      Text('그릴드 닭가슴살 120g'),
                                      Text('7800원'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),  //그릴드 닭가슴살
                        if (isSerialScreen) //시리얼 페이지
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Oreo()),
                              );
                            },
                            child: Container(
                              height: 100,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/se2.jpg',
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Column(
                                    children: [
                                      Text('오레오 200g'),
                                      Text('6800원'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),  //오레오
                      ],
                    ),
                  ), //세로 스크롤 (상품 리스트)
                ],
              ),
            ),
          ),  //Middle섹션 : 제품
          Positioned(child: Container()),   //Bottom섹션 : 장바구니 담기, 운동 식단 인바디 촬영 바디프로필
        ],
      ),
    );
  }
}



class InPutPage extends StatelessWidget {
  const InPutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('정보 입력'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Material(
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '단백질(g) 입력',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('데이터 저장하기'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
} //식단설계 데이터 인풋 페이지


class Gril extends StatelessWidget {
  const Gril({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('그릴드 닭가슴살 200g'),
      ),
    );
  }
} //그릴닭가슴살 페이지

class Oreo extends StatelessWidget {
  const Oreo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오레오 200g'),
      ),
    );
  }
} //오레오 페이지
