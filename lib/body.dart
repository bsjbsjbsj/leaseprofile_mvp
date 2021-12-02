import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

class BodyPage extends StatelessWidget {

  late Widget? myList;
  BugerBar bugerBar = BugerBar();

  @override
  Widget build(BuildContext context) {

    myList = bugerBar.getBugerBar();

    return Scaffold(
      appBar: AppBar(
        title: Text('바디프로필'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: myList
    );
  }
}