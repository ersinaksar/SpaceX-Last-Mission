//authentication ile ilgili kısımlar burada olacak.
//backend cinin bize vereceği sınıflar içerisinde mutlaka buradaki metotlar olacak

import 'package:spacex/models/user_model.dart';

abstract class AuthBase {
  //backendcinin kodundan yada apisinden dönen değer içerisinde bizim currentuser i alabileceğimiz bir metot olacak. Bu metot uzun süreceği için future yaptık. Yani backendcinin yaptığı currentuser metodunu çağırdığımızda bize User türünde bir veri verecek. Bu veriyi de tutmak için modeller paketimizde user modelini oluşturuyoruz.
  Future<UserModel> currentUser();
  Future<UserModel> signInAnonymously();
  Future<bool> signOut();
}
