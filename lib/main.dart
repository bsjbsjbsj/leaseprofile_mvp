import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/provider/foodPostProvider.dart';
import 'package:flutter_leaseprofile/provider/foodUserInfoProvider.dart';
import 'package:flutter_leaseprofile/provider/studioPostProvier.dart';
import 'package:flutter_leaseprofile/ui/bodyProfilePage.dart';
import 'package:flutter_leaseprofile/ui/dietFoodPage.dart';
import 'package:flutter_leaseprofile/ui/schedulePage.dart';
import 'package:flutter_leaseprofile/ui/studioShop.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //플러터엔진->파이어베이스이니셜라이즈앱
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => studioPostProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodUserInfoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodPostProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // static const String _title = 'Instagram clone';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: _title,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/fitness': (context) => FitnessPage(),
      //   '/food': (context) => FoodPage(),
      //   '/inbody': (context) => InbodyPage(),
      //   '/body': (context) => BodyPage(),
      //   '/studio': (context) => StudioPage(),
      //   '/routine': (context) => RoutinePage(),
      // },
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
      home: HomePage(),
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
    Text('인바디'),
    StudioShop(),
    // Text('촬영'),
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.black),
              label: 'schedule'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_off,
                color: Colors.black,
              ),
              label: 'diet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
              label: 'inbody'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_outlined,
                color: Colors.black,
              ),
              label: 'filming'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: 'profile')
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
