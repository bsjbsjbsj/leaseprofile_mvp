import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/provider/foodCalculatingProvider.dart';
import 'package:flutter_leaseprofile/provider/foodPostProvider.dart';
import 'package:flutter_leaseprofile/provider/foodUserInfoProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DietFoodPage extends StatefulWidget {
  @override
  State<DietFoodPage> createState() => _DietFoodPageState();
}

class _DietFoodPageState extends State<DietFoodPage>
    with SingleTickerProviderStateMixin {
  // late Widget? myBurgerList;
  // //BugerBar bugerBar = BugerBar();
  TabController? _controller;
  FoodUserInfoProvider? _foodUserInfoProvider;
  FoodCalculatingProvider? _foodCalculatingProvider;

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
    _foodUserInfoProvider!.getUserCarbonhydrate();
    _foodUserInfoProvider!.getUserProtein();
    _foodUserInfoProvider!.getUserProvince();
    _foodUserInfoProvider!.getUserVitamin();
    _foodCalculatingProvider = Provider.of<FoodCalculatingProvider>(context);

    //myBurgerList = bugerBar.getBugerBar();
    return Scaffold(
      //drawer: myBurgerList,
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('탄수화물 :'),
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
                              if (_foodUserInfoProvider!.userCarbonhydrate ==
                                  null)
                                Text(' 터치하여 입력'),
                              if (_foodUserInfoProvider!.userCarbonhydrate !=
                                  null)
                                Text("${_foodCalculatingProvider!.carbonhydrateTotal}/" +
                                    "${_foodUserInfoProvider!.userCarbonhydrate}" +
                                    "(g)"),
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('단백질 :'),
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
                              if (_foodUserInfoProvider!.userProtein == null)
                                Text(' 터치하여 입력'),
                              if (_foodUserInfoProvider!.userProtein != null)
                                Text("${_foodCalculatingProvider!.proteinTotal}/" +
                                    "${_foodUserInfoProvider!.userProtein}" +
                                    "(g)"),
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('지방 :'),
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
                              if (_foodUserInfoProvider!.userProvince == null)
                                Text(' 터치하여 입력'),
                              if (_foodUserInfoProvider!.userProvince != null)
                                Text("${_foodCalculatingProvider!.provinceTotal}/" +
                                    "${_foodUserInfoProvider!.userProvince}" +
                                    "(g)"),
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('비타민 :'),
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
                              if (_foodUserInfoProvider!.userVitamin == null)
                                Text(' 터치하여 입력'),
                              if (_foodUserInfoProvider!.userVitamin != null)
                                Text("${_foodCalculatingProvider!.vitaminTotal}/" +
                                    "${_foodUserInfoProvider!.userVitamin}" +
                                    "(g)"),
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
            SizedBox(
              height: 30,
            ),
            Column(
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
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 400, //여기 컨테이너 사이즈 고려좀 해봐야 함
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
  String? _userVitamin;

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
                        key: ValueKey('carbonhydrate'),
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
                      TextFormField(
                        key: ValueKey('protein'),
                        controller: _proteinController,
                        decoration: InputDecoration(
                          labelText: '단백질(g) 입력',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "단백질(g)을 입력 해주세요.";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userProtein = value;
                        },
                      ),
                      TextFormField(
                        key: ValueKey('province'),
                        controller: _provinceController,
                        decoration: InputDecoration(
                          labelText: '지방(g) 입력',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "지방(g)을 입력 해주세요.";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userProvince = value;
                        },
                      ),
                      TextFormField(
                        key: ValueKey('vitamin'),
                        controller: _vitaminController,
                        decoration: InputDecoration(
                          labelText: '비타민(g) 입력',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "비타민(g)을 입력 해주세요.";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userVitamin = value;
                        },
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _foodUserInfoProvider!.setUserCarbonhydrate(
                                    userCarbonhydrate:
                                        int.parse("${_userCarbonhydrate}"));
                                _foodUserInfoProvider!.setUserProtein(
                                    userProtein: int.parse("${_userProtein}"));
                                _foodUserInfoProvider!.setUserProvince(
                                    userProvince:
                                        int.parse("${_userProvince}"));
                                _foodUserInfoProvider!.setUserVitamin(
                                    userVitamin: int.parse("${_userVitamin}"));
                              }
                            },
                            child: Text('데이터 저장하기'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _foodUserInfoProvider!.removeUserCarbonhydrate();
                              _foodUserInfoProvider!.removeUserProtein();
                              _foodUserInfoProvider!.removeUserProvince();
                              _foodUserInfoProvider!.removeUserVitamin();
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

class WholeTab extends StatefulWidget {
  @override
  State<WholeTab> createState() => _WholeTabState();
}

class _WholeTabState extends State<WholeTab> {
  var f = NumberFormat('###,###,###,###');
  late FoodPostProvider _foodPostProvider;
  late FoodCalculatingProvider _foodCalculatingProvider;

  @override
  void didChangeDependencies() {
    _foodPostProvider = Provider.of<FoodPostProvider>(context, listen: false);
    _foodPostProvider.getParsed();
    _foodCalculatingProvider =
        Provider.of<FoodCalculatingProvider>(context, listen: false);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget _foodlist(int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(index: index),
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
                  _foodPostProvider.foodShops[index].images!.mainImage
                      .toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  "${_foodPostProvider.foodShops[index].shopName} \n ${f.format(int.parse(_foodPostProvider.foodShops[index].price!.p1.toString()))} 원",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Checkbox(
                  value: _foodPostProvider.foodShops[index].isChecked,
                  onChanged: (value) {
                    _foodPostProvider.foodShops[index].isChecked = value!;
                    if (value == false) {
                      _foodCalculatingProvider.carbonhydrateSubtract(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.carbonhydrate}",
                        ),
                      );
                      _foodCalculatingProvider.proteinSubtract(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.protein}",
                        ),
                      );
                      _foodCalculatingProvider.provinceSubtract(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.province}",
                        ),
                      );
                      _foodCalculatingProvider.vitaminSubtract(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.vitamin}",
                        ),
                      );
                    }
                    if (value == true) {
                      _foodCalculatingProvider.carbonhydrateIncrement(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.carbonhydrate}",
                        ),
                      );
                      _foodCalculatingProvider.proteinIncrement(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.protein}",
                        ),
                      );
                      _foodCalculatingProvider.provinceIncrement(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.province}",
                        ),
                      );
                      _foodCalculatingProvider.vitaminIncrement(
                        int.parse(
                          "${_foodPostProvider.foodShops[index].nutrients!.vitamin}",
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            _foodlist(index),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
      itemCount: _foodPostProvider.foodShops.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
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

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, @required this.index}) : super(key: key);
  int? index;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var f = NumberFormat('###,###,###,###');
  late FoodPostProvider _foodPostProvider;
  @override
  void didChangeDependencies() {
    _foodPostProvider = Provider.of<FoodPostProvider>(context, listen: false);
    _foodPostProvider.getParsed();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    int? index = widget.index;
    return Scaffold(
        appBar: AppBar(
          title: Text("${_foodPostProvider.foodShops[index!].shopName}"),
        ),
        body: Column(
          children: [
            Image.asset(_foodPostProvider.foodShops[index].images!.mainImage
                .toString()),
            Text("${_foodPostProvider.foodShops[index].shopName}"),
            Text("${_foodPostProvider.foodShops[index].desc!.hash}"),
            Text("${f.format(int.parse(
              _foodPostProvider.foodShops[index].price!.p1.toString(),
            ))} 원"),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('구매하기'),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
