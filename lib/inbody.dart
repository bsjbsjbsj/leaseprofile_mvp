import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

class InbodyPage extends StatefulWidget {
  @override
  State<InbodyPage> createState() => _InbodyPageState();
}

class _InbodyPageState extends State<InbodyPage> {
  late Widget? myList;
  BugerBar bugerBar = BugerBar();
  @override
  Widget build(BuildContext context) {
    myList = bugerBar.getBugerBar();
    return Scaffold(
      appBar: AppBar(
        title: Text('인바디'),
      ),
      drawer: myList,
    );
  }
}