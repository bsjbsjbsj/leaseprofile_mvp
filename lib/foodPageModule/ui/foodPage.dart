import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/foodPageModule/controller.dart';
import 'package:get/get.dart' as GetX;
import 'package:intl/intl.dart';

class DietFoodPage extends StatefulWidget {
  const DietFoodPage({Key? key}) : super(key: key);

  @override
  _DietFoodPageState createState() => _DietFoodPageState();
}

class _DietFoodPageState extends State<DietFoodPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> choices = [
    Tab(child: Text('전체보기')),
    Tab(child: Text('탄수화물')),
    Tab(child: Text('단백질')),
    Tab(child: Text('지방')),
  ];
  var f = NumberFormat('###,###,###,###');
  TabController? _controller;
  final _calculatingController = GetX.Get.find<FoodCalculatingController>();

  @override
  void initState() {
    _controller = TabController(
      length: choices.length,
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
    print('시작점');
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                      '탄수화물(g) : ' +
                          '${_calculatingController.carbonhydrateTotal.toString()}',
                      style: TextStyle(fontSize: 10))),
              Container(
                  child: Text(
                      '지방(g): ' +
                          '${_calculatingController.provinceTotal.toString()}',
                      style: TextStyle(fontSize: 10))),
              Container(
                  child: Text(
                      '단백질(g): ' +
                          '${_calculatingController.proteinTotal.toString()}',
                      style: TextStyle(fontSize: 10)))
            ],
          ),
          Expanded(
              child: Container(
                  child:
                      Text('가격(원): ' + '0', style: TextStyle(fontSize: 10)))),
          Container(
              child: new Image.asset('assets/icon/shopping.png',
                  width: 50, height: 50))
        ]),
        centerTitle: false,
        toolbarHeight: 40,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar(
            labelColor: Colors.purple,
            controller: _controller,
            tabs: choices,
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
      ),
      body: TabBarView(controller: _controller, children: [
        WholeList(),
        CarbonhydrateList(),
        ProteinList(),
        ProvinceList(),
      ]),
    );
  }
}

///////////////////////////////////////////////////////////////
class WholeList extends StatefulWidget {
  const WholeList({Key? key}) : super(key: key);

  @override
  _WholeListState createState() => _WholeListState();
}

class _WholeListState extends State<WholeList> {
  var f = NumberFormat('###,###,###,###');
  final _getDataController = GetX.Get.find<FoodPageController>();
  final _calculatingController = GetX.Get.find<FoodCalculatingController>();
  @override
  Widget build(BuildContext context) {
    Widget _wholeList(int index) {
      return Row(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     height: 100,
          //     child: Image.asset(
          //       'assets/${index}.jpg',
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                "${_getDataController.productList[index].product_name} \n ${f.format(int.parse(_getDataController.productList[index].product_price.toString()))} 원",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GetX.Obx(() {
              return Checkbox(
                value: _getDataController.productList[index].product_ischecked,
                onChanged: (value) {
                  print('fq');
                  _getDataController.productList[index].product_ischecked =
                      value!;
                  if (value == false) {
                    _calculatingController.carbonhydrateSubtract(
                      double.parse(
                        "${_getDataController.productList[index].product_carbonhydrate}",
                      ),
                    );
                    _calculatingController.proteinSubtract(
                      double.parse(
                        "${_getDataController.productList[index].product_protein}",
                      ),
                    );
                    _calculatingController.provinceSubtract(
                      double.parse(
                        "${_getDataController.productList[index].product_province}",
                      ),
                    );
                  }
                  if (value == true) {
                    _calculatingController.carbonhydrateIncrement(
                      double.parse(
                        "${_getDataController.productList[index].product_carbonhydrate}",
                      ),
                    );
                    _calculatingController.proteinIncrement(
                      double.parse(
                        "${_getDataController.productList[index].product_protein}",
                      ),
                    );
                    _calculatingController.provinceIncrement(
                      double.parse(
                        "${_getDataController.productList[index].product_province}",
                      ),
                    );
                  }
                },
              );
            }),
          ),
        ],
      );
    }

    return ListView.builder(
        itemCount: _getDataController.productList.length, // 수정필요
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return _wholeList(index);
        });
  }
}

/////////////////////////////////////////////////////////////////
class CarbonhydrateList extends StatefulWidget {
  const CarbonhydrateList({Key? key}) : super(key: key);

  @override
  _CarbonhydrateListState createState() => _CarbonhydrateListState();
}

class _CarbonhydrateListState extends State<CarbonhydrateList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

///////////////////////////////////////////////////////////////
class ProteinList extends StatefulWidget {
  const ProteinList({Key? key}) : super(key: key);

  @override
  _ProteinListState createState() => _ProteinListState();
}

class _ProteinListState extends State<ProteinList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

////////////////////////////////////////////////////////////
class ProvinceList extends StatefulWidget {
  const ProvinceList({Key? key}) : super(key: key);

  @override
  _ProvinceListState createState() => _ProvinceListState();
}

class _ProvinceListState extends State<ProvinceList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
