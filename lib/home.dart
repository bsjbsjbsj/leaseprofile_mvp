import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

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
      ),
      drawer: myList,
      body: Container(
        child: Text('hi'),
      ),
    );
  }
}