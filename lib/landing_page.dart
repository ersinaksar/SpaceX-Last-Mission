import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spacex/home_page.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/services/auth_base.dart';
import 'package:spacex/services/firebase_auth_service.dart';
import 'package:spacex/sign_in_page.dart';

//eğer kullanıcı daha çnce giriş yaptıysa dorudan signin page e yollayacak
//ilgili durumlarda ilgili kullanıcıyı güncellemek için stateful yaptık
class LandingPage extends StatefulWidget {
  const LandingPage({Key key, @required this.authService}) : super(key: key);

  //dependency injection yapmak için, AuthBase ortak bir çatı altında topladığından kodlar içerisinden firebase i kaldırmış oluruz.
  final AuthBase authService; //2. yol dependency injection

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //Bir user nesnesi oluşturuyoruz
  var currentUser = FirebaseAuth.instance.currentUser;

  UserModel currentuser2; //2. yol dependency injection

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //initstate fonk sync olamıyor ve geriye bir değer döndüremiyor o yüzden init içinde yapmak istediklerimi ayrı bir fonksiyona alıyoruz. Init çalışacak ardından hemen build tetiklenecek init içerisindeki fonksiyonun çalışmasını tamamlanmasını beklemeyecek build fonksiyonu
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    // kullanıcı öncesinde giriş yaptıysa home page e yolla değilse signinpage e yolla
    if (currentUser == null) {
      return SignInPage(
        authService: widget.authService,
        onSignIn: (user) {
          _updateUser(user);
        },
      );
    } else {
      return HomePage(
        user: currentUser,
        user2: currentuser2,
        authService: widget.authService,
        onSignOut: () {
          _updateUser(null);
        },
      );
    }
  }

  //herhangi bir state management kullanmadan bu şekilde yapacağız
  Future<void> _checkUser() async {
    //o anda fiebase de oturum açmış bir kullanıcı varm ı onu kontrol ediyoruz

    var currentUser = FirebaseAuth.instance.currentUser; //1. yol
    var currentUser2 =
        await widget.authService.currentUser(); // 2. yol dependency injection
    if (currentUser != null) {
      print(currentUser.uid);
    }
  }

  void _updateUser(User user) {
    setState(() {
      currentUser = user;
    });
  }
}
