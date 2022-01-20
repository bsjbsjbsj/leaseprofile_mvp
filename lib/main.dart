import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_leaseprofile/model/fakeModel.dart';
import 'package:flutter_leaseprofile/provider/postProvier.dart';
import 'package:flutter_leaseprofile/repository/fetchData.dart';
import 'package:flutter_leaseprofile/ui/home.dart';
import 'package:provider/provider.dart';
import 'ui/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //플러터엔진->파이어베이스이니셜라이즈앱
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
