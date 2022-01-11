import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_leaseprofile/ui/login.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool isLogined = false;
  @override
  void initState() {
    if (isLogined == false) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
