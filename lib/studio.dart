import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

class StudioPage extends StatefulWidget {
  @override
  State<StudioPage> createState() => _StudioPageState();
}

class _StudioPageState extends State<StudioPage> {
  late Widget? myList;
  BugerBar bugerBar = BugerBar();
  @override
  Widget build(BuildContext context) {
    myList = bugerBar.getBugerBar();
    return Scaffold(
      appBar: AppBar(
        title: Text('스튜디오'),
      ),
      drawer: myList,
    );
  }
}
