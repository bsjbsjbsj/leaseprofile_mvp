import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/bugerbar.dart';
import 'django.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget? myList;
  BugerBar bugerBar = BugerBar();
  Post Data = Post();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async{
    var Post = await fetchPost();
    setState(() {
      Data = Post;
    });
  }

  @override
  Widget build(BuildContext context) {
    myList = bugerBar.getBugerBar();

    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
      ),
      drawer: myList,
      body: Center(
        child: Text('${Data.name}'),
      ),
    );
  }
}
