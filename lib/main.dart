import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/body.dart';
import 'package:flutter_leaseprofile/fitness.dart';
import 'package:flutter_leaseprofile/food.dart';
import 'package:flutter_leaseprofile/inbody.dart';
import 'package:flutter_leaseprofile/routine.dart';
import 'package:flutter_leaseprofile/studio.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/fitness': (context) => FitnessPage(),
        '/food': (context) => FoodPage(),
        '/inbody': (context) => InbodyPage(),
        '/body': (context) => BodyPage(),
        '/studio': (context) => StudioPage(),
        '/routine': (context) => RoutinePage(),
      },
    );
  }
}

//홈페이지
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget? myList;
  BugerBar bugerBar = BugerBar();

  @override
  Widget build(BuildContext context) {
    myList = bugerBar.getBugerBar();

    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: myList,
      body: Container(
        child: Text('hi'),
      ),
    );
  }
}
