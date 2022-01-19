import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/model/fakeModel.dart';
import 'package:flutter_leaseprofile/repository/fetchData.dart';
import 'package:flutter_leaseprofile/ui/calendar.dart';
import 'package:flutter_leaseprofile/ui/estimate.dart';
import 'package:flutter_leaseprofile/ui/login.dart';
import 'package:flutter_leaseprofile/ui/mypage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenIndex = 0;
  List<Widget> screenList = [
    Home(),
    EstimatePage(),
    Calendar(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('leaseprofile'),
      ),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: screenList[screenIndex]),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Widget> tabList = [
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
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? wholeHeight = MediaQuery.of(context).size.height;
    double? wholeWidth = MediaQuery.of(context).size.width;
    return Column(
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
    );
  }
}

class StudioTab extends StatefulWidget {
  const StudioTab({Key? key}) : super(key: key);

  @override
  State<StudioTab> createState() => _StudioTabState();
}

class _StudioTabState extends State<StudioTab> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> studioList = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            AspectRatio(
              aspectRatio: 9 / 11,
              child: Image.asset(
                'assets/1.jpg',
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
                '#모던한 #차가운',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            AspectRatio(
              aspectRatio: 9 / 11,
              child: Image.asset(
                'assets/4.jpg',
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
                '#강렬한 #공사장 분위기 #조명 연출',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            AspectRatio(
              aspectRatio: 9 / 11,
              child: Image.asset(
                'assets/3.jpg',
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
                '#모던한 #집 같은',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
        ],
      ),
    ];
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '총 ${studioList.length}개',
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
        GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 6.5 / 9.0,
          children: studioList,
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
