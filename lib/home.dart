import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenIndex = 0;
  List<Widget> screenList = [Home(), Text('채팅 스크린'), Text('마이 스크린')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '견적내기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '마이페이지',
          ),
        ],
        onTap: (value) {setState(() {
          screenIndex = value;
        });},
        elevation: 1.0,
      ),
      body: screenList[screenIndex],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

