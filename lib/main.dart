import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/home.dart';
import 'package:flutter_leaseprofile/body.dart';
import 'package:flutter_leaseprofile/fitness.dart';
import 'package:flutter_leaseprofile/food.dart';
import 'package:flutter_leaseprofile/inbody.dart';
import 'package:flutter_leaseprofile/routine.dart';
import 'package:flutter_leaseprofile/studio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
