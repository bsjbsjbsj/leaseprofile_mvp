import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_leaseprofile/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 100,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    child: GoogleButton(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    child: FaceBookButton(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    child: KakaoTalkButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//구글로그인 버튼 + 기능
class GoogleButton extends StatefulWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: signInWithGoogle,
      style: OutlinedButton.styleFrom(
        elevation: 1.0,
        primary: Colors.black,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            child: Image.asset(
              'assets/googleLogo.png',
            ),
          ),
          SizedBox(width: 50,),
          Container(
            child: Text('Google 계정으로 로그인'),
          ),
        ],
      ),
    );
  }
}

//페이스북로그인 버튼 + 기능
class FaceBookButton extends StatefulWidget {
  const FaceBookButton({Key? key}) : super(key: key);

  @override
  _FaceBookButtonState createState() => _FaceBookButtonState();
}

class _FaceBookButtonState extends State<FaceBookButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        elevation: 1.0,
        primary: Colors.black,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            child: Image.asset(
              'assets/FacebookLogo.png',
            ),
          ),
          SizedBox(width: 50,),
          Container(
            child: Text('페이스북 계정으로 로그인'),
          ),
        ],
      ),
    );
  }
}

//카카오톡 버튼+로그인 기능
class KakaoTalkButton extends StatefulWidget {
  const KakaoTalkButton({Key? key}) : super(key: key);

  @override
  _KakaoTalkButtonState createState() => _KakaoTalkButtonState();
}

class _KakaoTalkButtonState extends State<KakaoTalkButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        elevation: 1.0,
        primary: Colors.black,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            child: Image.asset(
              'assets/KakaotalkLogo.png',
            ),
          ),
          SizedBox(width: 50,),
          Container(
            child: Text('카카오톡 계정으로 로그인'),
          ),
        ],
      ),
    );
  }
}

