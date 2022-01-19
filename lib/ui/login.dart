import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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
          SizedBox(
            width: 50,
          ),
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
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: signInWithFacebook,
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
          SizedBox(
            width: 50,
          ),
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
  static final FlutterKakaoLogin kakaoSignIn = FlutterKakaoLogin();
  bool _isLogined = false;
  String _accessToken = '';
  String _refreshToken = '';
  String _accountInfo = '';
  String _loginMessage = 'Not Logged In';

  @override
  void initState() {
    super.initState();
    loadKakao();
  }

  void loadKakao() async {
    // 카카오에서 받은 native app key
    await kakaoSignIn.init('6e6467fb906d5bb6a92b875965b0e046');

    // for 안드로이드
    final hashKey = await kakaoSignIn.hashKey;
    print('hashKey: $hashKey');
  }

  Future<void> flutterKakaoLogin() async {
    try {
      final logInResult = await kakaoSignIn.logIn();
      _processLoginResult(logInResult);
    } on PlatformException catch (e) {
      print("${e.code} ${e.message}");
    }
  }

  void _updateAccessToken(String accessToken) {
    setState(() {
      _accessToken = accessToken;
    });
  }

  void _updateRefreshToken(String refreshToken) {
    setState(() {
      _refreshToken = refreshToken;
    });
  }

  void _updateAccountMessage(String message) {
    setState(() {
      _accountInfo = message;
    });
  }

  void _updateStateLogin(bool isLogined, KakaoLoginResult result) {
    setState(() {
      _isLogined = isLogined;
    });
    if (!isLogined) {
      _updateAccessToken('');
      _updateRefreshToken('');
      _updateAccountMessage('');
    } else {
      if (result.token != null && result.token!.accessToken != null) {
        _updateAccessToken(result.token!.accessToken!);
        _updateRefreshToken(result.token!.refreshToken!);
      }
    }
  }

  void _updateLoginMessage(String message) {
    setState(() {
      _loginMessage = message;
    });
  }

  void _processLoginResult(KakaoLoginResult result) {
    switch (result.status) {
      case KakaoLoginStatus.loggedIn:
        _updateLoginMessage('Logged In by the user.');
        _updateStateLogin(true, result);
        break;
      case KakaoLoginStatus.loggedOut:
        _updateLoginMessage('Logged In by the user.');
        _updateStateLogin(false, result);
        break;
      case KakaoLoginStatus.unlinked:
        _updateLoginMessage('Unlinked by the user');
        _updateStateLogin(false, result);
        break;
    }
  }

  Future<void> _unlink() async {
    try {
      final result = await kakaoSignIn.unlink();
      _processLoginResult(result);
    } on PlatformException catch (e) {
      _updateLoginMessage('${e.code}: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => flutterKakaoLogin(),
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
          SizedBox(
            width: 50,
          ),
          Container(
            child: Text('카카오톡 계정으로 로그인'),
          ),
        ],
      ),
    );
  }
}
//카카오톡 로그인 상태 확인방법
// children: [
//               Row(
//                 children: [
//                   ElevatedButton(
//                     child: Text('LogIn'),
//                     onPressed: () {
//                       flutterKakaoLogin();
//                     },
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         _unlink();
//                       },
//                       child: Text('Log Out'))
//                 ],
//               ),
//               _isLogined
//                   ? Text(
//                       '로그인 되었습니다.',
//                       style: TextStyle(fontSize: 18.0, color: Colors.black),
//                     )
//                   : Text('로그아웃 상태 ',
//                       style: TextStyle(fontSize: 18.0, color: Colors.black)),
//               Text(
//                 'access_token: $_accessToken',
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//               Text(
//                 'refresh_token: $_refreshToken',
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//               Text(
//                 'accountInfo: $_accountInfo',
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//               Text('loginMessage: $_loginMessage',
//                   style: TextStyle(fontSize: 18.0, color: Colors.black)),
//             ],
