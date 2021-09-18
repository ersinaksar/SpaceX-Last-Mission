import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/viewmodels/user_view_model.dart';

//sadece oturum açmış kullanıcıların göreceği sayfa
class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({@required this.user}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () => _logOut(context),
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text(
            "Welcome to infinity ${user.userID.toString()}"), //user2.userID
      ),
    );
  }

  Future<bool> _logOut(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    bool resut = await _userViewModel.signOut();
    return resut;
  }
}
