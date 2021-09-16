import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spacex/home_page.dart';
import 'package:spacex/sign_in_page.dart';

//eğer kullanıcı daha çnce giriş yaptıysa dorudan signin page e yollayacak
//ilgili durumlarda ilgili kullanıcıyı güncellemek için stateful yaptık
class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //Bir user nesnesi oluşturuyoruz
  var currentUser = FirebaseAuth.instance.currentUser;

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
        onSignIn: (user) {
          _updateUser(user);
        },
      );
    } else {
      return HomePage(
        user: currentUser,
        onSignOut: () {
          _updateUser(null);
        },
      );
    }
  }

  //herhangi bir state management kullanmadan bu şekilde yapacağız
  Future<void> _checkUser() async {
    //o anda fiebase de oturum açmış bir kullanıcı varm ı onu kontrol ediyoruz

    var currentUser = FirebaseAuth.instance.currentUser;
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
