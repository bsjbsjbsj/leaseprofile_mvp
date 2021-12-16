import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/login.dart';

class BugerBar {
  Widget? getBugerBar() {
    return Builder(builder: (context) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'LOGIN\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: '로그인 후 이용해 주세요',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/pfl.png'),
                          radius: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // UserAccountsDrawerHeader(
            //   accountEmail: Text('healthchang@gmail.com'),
            //   accountName: Text('홍길동'),
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage: AssetImage('assets/pfl.png'),
            //   ),
            // ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('홈'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('피트니스'),
              onTap: () {
                Navigator.pushNamed(context, '/fitness');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('푸드'),
              onTap: () {
                Navigator.pushNamed(context, '/food');
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('인바디'),
              onTap: () {
                Navigator.pushNamed(context, '/inbody');
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('바디프로필 구경하기'),
              onTap: () {
                Navigator.pushNamed(context, '/body');
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('스튜디오 찾아보기'),
              onTap: () {
                Navigator.pushNamed(context, '/studio');
              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('루틴캘린더'),
              onTap: () {
                Navigator.pushNamed(context, '/routine');
              },
            ),
          ],
        ),
      );
    });
  }
}
