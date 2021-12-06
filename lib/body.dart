import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage>
    with SingleTickerProviderStateMixin {
  late Widget? myBurgerList;
  BugerBar bugerBar = BugerBar();
  TabController? _tabController;
  int? selectedTabIndex = 0;

  final List<Tab> tabList = [
    Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home),
          SizedBox(
            height: 1,
          ),
          Text('전체'),
        ],
      ),
    ),
    Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home),
          SizedBox(
            height: 1,
          ),
          Text('남자'),
        ],
      ),
    ),
    Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home),
          SizedBox(
            height: 1,
          ),
          Text('여자'),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    myBurgerList = bugerBar.getBugerBar();

    _tabController = TabController(
      length: tabList.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myBurgerList,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '바디프로필',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 60,
              width: double.infinity,
              child: TabBar(
                overlayColor: MaterialStateProperty.resolveWith((states){
                  if (states.contains(MaterialState.hovered)) return Colors.black.withOpacity(0.04);
                  if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) return Colors.black.withOpacity(0.12);
                  return null;
                }),
                tabs: tabList,
                controller: _tabController,
                labelColor: Colors.black,
                indicator: BoxDecoration(color: Colors.amberAccent),
                indicatorSize: TabBarIndicatorSize.tab,
                onTap: (int currentTab) {
                  setState(() {
                    selectedTabIndex = currentTab;
                  },);
                },
              ),
            ),
            if(selectedTabIndex==0)
            Container(
              width: double.infinity,
              height: 100,
              child: TabBarView(
                  controller: _tabController,
                  children:
                  tabList.map((Tab tab) {
                    return Container(color: Colors.blue,);
                  }).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
