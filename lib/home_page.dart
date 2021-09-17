import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/services/auth_base.dart';

//sadece oturum açmış kullanıcıların göreceği sayfa
class HomePage extends StatelessWidget {
  final User user;
  final VoidCallback onSignOut;

  final AuthBase authService; //2. yol dependency injection
  final UserModel user2; //2. yol dependency injection

  const HomePage(
      {Key key,
      this.user,
      @required this.onSignOut,
      @required this.authService,
      @required this.user2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: _logOut,
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Welcome to infinity ${user.uid}"), //user2.userID
      ),
    );
  }

  Future<void> _logOut() async {
    await FirebaseAuth.instance.signOut();
    bool result = await authService
        .signOut(); // 2. yol dependency injection sonrasında fonksiyonun geri dönüşünü bool yap sonre geri döndür
    onSignOut();
  }
}
