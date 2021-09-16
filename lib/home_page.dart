import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//sadece oturum açmış kullanıcıların göreceği sayfa
class HomePage extends StatelessWidget {
  final User user;
  final VoidCallback onSignOut;

  const HomePage({Key key, this.user, @required this.onSignOut})
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
        child: Text("Welcome to infinity ${user.uid}"),
      ),
    );
  }

  Future<void> _logOut() async {
    await FirebaseAuth.instance.signOut();
    onSignOut();
  }
}
