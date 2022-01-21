import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/model/fakeModel.dart';
import 'package:flutter_leaseprofile/provider/postProvier.dart';
import 'package:provider/provider.dart';

class StudioShop extends StatefulWidget {
  const StudioShop({Key? key}) : super(key: key);

  @override
  _StudioShopState createState() => _StudioShopState();
}

class _StudioShopState extends State<StudioShop>
    with SingleTickerProviderStateMixin {
  List<Widget> screenList = [
    Page1(),
    Text("g241"),
    Text("g242141"),
    Text("g2441412121"),
  ];
  int screenIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: screenList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? wholeHeight = MediaQuery.of(context).size.height;
    double? wholeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
              ),
              label: '견적내기',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: '일정확인',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: '마이페이지',
            ),
          ],
          onTap: (value) {
            setState(() {
              screenIndex = value;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
        ),
        body: screenList[screenIndex]);
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Widget> tabList = [
    Column(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Image.asset(
              'assets/googleLogo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(flex: 2, child: Text('스튜디오 예약'))
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              'assets/googleLogo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(flex: 2, child: Text('메이크업 예약'))
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              'assets/googleLogo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(flex: 2, child: Text('사진사 예약'))
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              'assets/googleLogo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(flex: 2, child: Text('왁싱 예약'))
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              'assets/googleLogo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(flex: 2, child: Text('태닝 예약'))
      ],
    ),
    Column(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              'assets/googleLogo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(flex: 2, child: Text('패키지 예약'))
      ],
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabList.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? wholeHeight = MediaQuery.of(context).size.height;
    double? wholeWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: wholeWidth - 20,
              height: wholeHeight * 0.07,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      // onChanged: (text){
                      //   _streamSearch.add(text);
                      // },
                      decoration: InputDecoration(
                          hintText: '유명한 스튜디오',
                          border: InputBorder.none,
                          icon: Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Icon(Icons.search))),
                    ),
                  ),
                  Expanded(flex: 2, child: Icon(Icons.cancel)),
                ],
              ),
            ),
            Container(
                width: wholeWidth - 20,
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: wholeHeight * 0.12,
                child: TabBar(
                  tabs: tabList,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  labelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                )),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Container(
              height: wholeHeight,
              child: TabBarView(
                controller: _tabController,
                children: [
                  StudioTab(),
                  MakeupTab(),
                  PhotographerTab(),
                  WaxingTab(),
                  TanningTab(),
                  PackageTab(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StudioTab extends StatefulWidget {
  const StudioTab({Key? key}) : super(key: key);

  @override
  State<StudioTab> createState() => _StudioTabState();
}

class _StudioTabState extends State<StudioTab> {
  late PostProvider _postProvider;
  Widget _studiolist(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          AspectRatio(
            aspectRatio: 9 / 11,
            child: Image.asset(
              _postProvider.shops[index].images!.mainImage.toString(),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ),
        ]),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.0,
            ),
            Text(
              _postProvider.shops[index].shopName.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              _postProvider.shops[index].desc!.hash.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              _postProvider.shops[index].price!.p1.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _postProvider = Provider.of<PostProvider>(context, listen: false);
    _postProvider.getParsed();
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '총 ${_postProvider.shops.length}개',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              '최신순',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5 / 9.0,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: _postProvider.shops.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _studiolist(index);
          },
        ),
      ],
    );
  }
}

class MakeupTab extends StatelessWidget {
  const MakeupTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PhotographerTab extends StatelessWidget {
  const PhotographerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WaxingTab extends StatelessWidget {
  const WaxingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TanningTab extends StatelessWidget {
  const TanningTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PackageTab extends StatelessWidget {
  const PackageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
