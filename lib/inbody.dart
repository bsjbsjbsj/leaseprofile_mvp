import 'package:flutter/material.dart';

class InbodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인바디'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('healthchang@gmail.com'),
              accountName: Text('홍길동'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/pfl.png'),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bodyimage.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('홈'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/'
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('피트니스'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/fitness'
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('푸드'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/food'
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('인바디'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/inbody'
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('바디프로필 구경하기'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/body'
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('스튜디오 찾아보기'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/studio'
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('루틴캘린더'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/routine'
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}