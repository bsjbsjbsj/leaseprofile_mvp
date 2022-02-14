import 'package:flutter_leaseprofile/foodPageModule/bindings.dart';
import 'package:flutter_leaseprofile/foodPageModule/controller.dart';
import 'package:flutter_leaseprofile/inbodyPageModule/inbody.dart';
import 'package:get/get.dart' as GetX;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/profilePageModule/profileView.dart';
import 'package:flutter_leaseprofile/foodPageModule/ui/foodPage.dart';
import 'package:flutter_leaseprofile/schedulePageModule/schedulePage.dart';
import 'package:flutter_leaseprofile/studioPageModule/studioShop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //플러터엔진->파이어베이스이니셜라이즈앱
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static const String _title = 'Instagram clone';
  @override
  Widget build(BuildContext context) {
    return GetX.GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetX.GetPage(
          name: '/',
          page: () => HomePage(),
          binding: FoodPageBinding(),
        ),
        GetX.GetPage(
          name: '/food',
          page: () => DietFoodPage(),
        ),
        GetX.GetPage(
          name: '/schedule',
          page: () => SchedulePage(),
        ),
        GetX.GetPage(
          name: '/studio',
          page: () => StudioShop(),
        ),
        GetX.GetPage(
          name: '/profile',
          page: () => BodyProfilePage(),
        ),
        GetX.GetPage(
          name: '/inbody',
          page: () => InbodyPage(),
        ),
      ],
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    SchedulePage(),
    DietFoodPage(),
    InbodyPage(),
    StudioShop(),
    BodyProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: new Image.asset('assets/icon/schedule.png',
                  width: 50, height: 50),
              label: 'schedule'),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/icon/diet.png',
                  width: 50, height: 50),
              label: 'diet'),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/icon/measurement.png',
                  width: 50, height: 50),
              label: 'measurement'),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/icon/filming.png',
                  width: 50, height: 50),
              label: 'filming'),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/icon/recruit.png',
                  width: 50, height: 50),
              label: 'recruit')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
