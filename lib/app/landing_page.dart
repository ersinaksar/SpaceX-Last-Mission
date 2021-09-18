import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex/app/home_page.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/services/auth_base.dart';
import 'package:spacex/services/firebase_auth_service.dart';
import 'package:spacex/app/sign_in/sign_in_page.dart';
import 'package:spacex/viewmodels/user_view_model.dart';

//eğer kullanıcı daha çnce giriş yaptıysa dorudan signin page e yollayacak
//ilgili durumlarda ilgili kullanıcıyı güncellemek için stateful yaptık
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: true);
    // kullanıcı öncesinde giriş yaptıysa home page e yolla değilse signinpage e yolla
    if (_userViewModel.state == ViewState.Idle) {
      //ya kullanıcımız vardır yada kullanıcımız yoktu boştaysa
      if (_userViewModel.user == null) {
        return SignInPage();
      } else {
        return HomePage(
          user: _userViewModel.user,
        );
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
