import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';

class FitnessPage extends StatefulWidget {

  @override
  State<FitnessPage> createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  late Widget? myList;
  BugerBar bugerBar = BugerBar();

  @override
  Widget build(BuildContext context) {
    myList = bugerBar.getBugerBar();
    return Scaffold(
      appBar: AppBar(
        title: Text('피트니스'),
      ),
      drawer: myList,
    );
  }
}