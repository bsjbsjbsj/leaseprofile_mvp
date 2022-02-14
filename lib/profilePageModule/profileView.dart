import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_leaseprofile/bugerbar.dart';

class BodyProfilePage extends StatefulWidget {
  //const BodyPage({Key? key}) : super(key: key);

  @override
  _BodyProfilePageState createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage>
    with SingleTickerProviderStateMixin {
  late Widget? myBurgerList;
  //BugerBar bugerBar = BugerBar();
  TabController? _tabController;

  final List<Tab> tabList = [
    Tab(
      icon: Text('모두'),
    ),
    Tab(
      icon: Text('남자'),
    ),
    Tab(
      icon: Text('여자'),
    ),
  ];

  @override
  void initState() {
    //myBurgerList = bugerBar.getBugerBar();

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
      //drawer: myBurgerList,

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: TabBar(
                tabs: tabList,
                controller: _tabController,
                labelColor: Colors.black,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.grey[600],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height-170,
              child: TabBarView(
                controller: _tabController,
                children: [
                  WholeTab(),
                  FemaleTab(),
                  MaleTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WholeTab extends StatelessWidget {
  const WholeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(50, (index) {
          return Container(
            margin: EdgeInsets.all(1),
            child: Image.asset(
              'assets/1.jpg',
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );
  }
}

class FemaleTab extends StatelessWidget {
  const FemaleTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(50, (index) {
          return Container(
            margin: EdgeInsets.all(1),
            child: Image.asset(
              'assets/2.jpg',
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );
  }
}

class MaleTab extends StatelessWidget {
  const MaleTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(50, (index) {
          return Container(
            margin: EdgeInsets.all(1),
            child: Image.asset(
              'assets/3.jpg',
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );
  }
}
