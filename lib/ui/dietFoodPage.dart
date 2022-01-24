import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/provider/foodUserInfoProvider.dart';
import 'package:provider/provider.dart';

class DietFoodPage extends StatefulWidget {
  @override
  State<DietFoodPage> createState() => _DietFoodPageState();
}

class _DietFoodPageState extends State<DietFoodPage>
    with SingleTickerProviderStateMixin {
  late Widget? myBurgerList;
  //BugerBar bugerBar = BugerBar();
  TabController? _controller;
  FoodUserInfoProvider? _foodUserInfoProvider;

  final List<Tab> foodList = [
    Tab(
      child: Text('전체보기'),
    ),
    Tab(
      child: Text('샐러드'),
    ),
    Tab(
      child: Text('가슴살'),
    ),
    Tab(
      child: Text('아몬드'),
    ),
    Tab(
      child: Text('보충제'),
    ),
    Tab(
      child: Text('비타민'),
    ),
  ];

  @override
  void initState() {
    _controller = TabController(
      length: foodList.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _foodUserInfoProvider = Provider.of<FoodUserInfoProvider>(context);
    _foodUserInfoProvider!.getUser();
    //myBurgerList = bugerBar.getBugerBar();
    return Scaffold(
      //drawer: myBurgerList,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  Container(
                    height: 100,
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
                                    if (_foodUserInfoProvider!.carbonhydrate ==
                                        0)
                                      Text(' 터치하여 입력'),
                                    if (_foodUserInfoProvider!.carbonhydrate !=
                                        null)
                                      Text(_foodUserInfoProvider!.carbonhydrate
                                          .toString()),
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
            ), //Top섹션 : 식단설계,인바디버튼
            Positioned(
              top: 50,
              left: 5,
              right: 5,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: TabBar(
                      labelColor: Colors.purple,
                      tabs: foodList,
                      controller: _controller,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey[500],
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.purple, width: 3.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        WholeTab(),
                        SaladTab(),
                        ChickenBreastTab(),
                        AlmondTab(),
                        ProteinTab(),
                        VitaminTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ), //Middle섹션 : 제품 쇼핑
          ],
        ),
      ),
    );
  }
}

class InPutPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  FoodUserInfoProvider? _foodUserInfoProvider;
  TextEditingController _proteinController = TextEditingController();
  TextEditingController _carbonhydrateController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _vitaminController = TextEditingController();
  String? _userProtein;
  String? _userCarbonhydrate;
  String? _userProvince;

  @override
  Widget build(BuildContext context) {
    _foodUserInfoProvider = Provider.of<FoodUserInfoProvider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("영양정보 입력"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Material(
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _carbonhydrateController,
                        decoration: InputDecoration(
                          labelText: '탄수화물(g) 입력',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "탄수화물(g)을 입력 해주세요.";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userCarbonhydrate = value;
                        },
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                              }
                              _foodUserInfoProvider!.setUser(
                                  carbonhydrate:
                                      int.parse(_userCarbonhydrate!));
                            },
                            child: Text('데이터 저장하기'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _foodUserInfoProvider!.removeUser();
                            },
                            child: Text('데이터 초기화'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
} //식단설계 데이터 인풋 페이지

class WholeTab extends StatelessWidget {
  const WholeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(50, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailPage(),
                ),
              );
            },
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    child: Image.asset(
                      'assets/1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      '닭가슴살 200g \n 7,000원',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Icon(Icons.check),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SaladTab extends StatelessWidget {
  const SaladTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ChickenBreastTab extends StatelessWidget {
  const ChickenBreastTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AlmondTab extends StatelessWidget {
  const AlmondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProteinTab extends StatelessWidget {
  const ProteinTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VitaminTab extends StatelessWidget {
  const VitaminTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('그릴드 닭가슴살 200g'),
      ),
    );
  }
} //디테일 페이지

