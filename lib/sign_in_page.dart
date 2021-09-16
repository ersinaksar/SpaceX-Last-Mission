import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spacex/common_widgets/social_log_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key, @required this.onSignIn}) : super(key: key);
  //state management ya da bloc kullanmıyorsak geriye bilgi göndermek için callback i kullanıyoruz, ve aslında signinpage den bir nesne ürettiğimizde geriye yollamak istediğimiz olayı belirtiyoruz
  final Function(User) onSignIn;

  void _anonymousSignIn() async {
    UserCredential result = await FirebaseAuth.instance.signInAnonymously();
    onSignIn(result.user);
    print("Logining User ID: " + result.user.uid);
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
          RaisedButton(
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
          ),
          SocialLoginButton(
            onPressed: _anonymousSignIn,
            butonColor: Colors.teal,
            butonText: "Anonymous",
            butonIcon: Icon(Icons.supervised_user_circle),
          )
        ],
      ),
    );
  }
}
