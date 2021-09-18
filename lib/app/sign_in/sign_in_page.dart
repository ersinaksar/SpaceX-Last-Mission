import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/app/sign_in/email_and_password_login_page.dart';
import 'package:spacex/common_widgets/social_log_in_button.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/services/auth_base.dart';
import 'package:spacex/viewmodels/user_view_model.dart';

class SignInPage extends StatelessWidget {
  void _anonymousSignIn(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    //UserCredential result = await FirebaseAuth.instance.signInAnonymously();
    //print("Logining User ID: " + result.user.uid);
    UserModel _user = await _userViewModel.signInAnonymously();

    print("Logining User ID: " + _user.userID.toString());
  }

  void _googleIleGiris(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    UserModel _user = await _userViewModel.signInWithGoogle();
    if (_user != null) print("Oturm açan user id: " + _user.userID.toString());
  }

  void _emailAndPasswordLogin(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true, //tam sayfa aşağıdan yukarı açılıyor
        builder: (context) => EmailAndPasswordLoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          /*RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              "Login with Google",
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.deepPurple,
          ),*/
          SocialLoginButton(
            butonText: "Gmail ile Giriş Yap",
            textColor: Colors.black87,
            butonColor: Colors.white,
            butonIcon: Image.asset("images/google-logo.png"),
            onPressed: () => _googleIleGiris(context),
          ),
          SocialLoginButton(
            onPressed: () => _anonymousSignIn(context),
            butonColor: Colors.teal,
            butonText: "Anonymous",
            butonIcon: Icon(Icons.supervised_user_circle),
          ),
          SocialLoginButton(
            onPressed: () => _emailAndPasswordLogin(context),
            butonIcon: Icon(
              Icons.email,
              color: Colors.white,
              size: 32,
            ),
            butonText: "Email ve Şifre ile Giriş yap",
          ),
        ],
      ),
    );
  }
}
