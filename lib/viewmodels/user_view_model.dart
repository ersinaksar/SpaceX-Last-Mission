import 'package:flutter/cupertino.dart';
import 'package:spacex/locator.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/repository/user_repository.dart';
import 'package:spacex/services/auth_base.dart';
import 'package:spacex/viewmodels/spacex_view_model.dart';

enum ViewState { Idle, Busy }

class UserViewModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  UserModel _user;
  String emailHataMesaji;
  String sifreHataMesaji;

  UserModel get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    //SpaceXViewModel _sapacexstate = locator<SpaceXViewModel>();
    //_sapacexstate.state;
    notifyListeners(); //arayüze bilgi verdik
  }

  //buradan ne zaman bir nesne üretilirse current useri çağırıp acaba kullanıcı var  mı yok mu onun kontrolünü yapabiliyoruz
  UserViewModel() {
    currentUser();
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("View modeldeki current user da hata" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel> signInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("View modeldeki signInAnonymously da hata" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user =
          null; //ilgili user a null değerini atıyoruz ki arayüzümüz güncellensin
      return sonuc;
    } catch (e) {
      debugPrint("View modeldeki signOut  da hata" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      if (_user != null)
        return _user;
      else
        return null;
    } catch (e) {
      debugPrint("View modeldeki signInWithGoogle da hata" + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel> signInWithEmailandPassword(
      String email, String sifre) async {
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user = await _userRepository.signInWithEmailandPassword(email, sifre);
        return _user;
      } else
        return null;
    } catch (e) {
      debugPrint(
          "user_view_model signInWithEmailandPassword hata: " + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  bool _emailSifreKontrol(String email, String sifre) {
    var sonuc = true;

    if (sifre.length < 6) {
      sifreHataMesaji = "En az 6 karakter olmalı";
      sonuc = false;
    } else
      sifreHataMesaji = null;
    if (!email.contains("@")) {
      emailHataMesaji = "Geçersiz email adresi";
      sonuc = false;
    } else
      emailHataMesaji = null;

    return sonuc;
  }

  @override
  Future<UserModel> createUserWithEmailandPassword(
      String email, String sifre) async {
    try {
      if (_emailSifreKontrol(email, sifre)) {
        state = ViewState.Busy;
        _user =
            await _userRepository.createUserWithEmailandPassword(email, sifre);

        return _user;
      } else
        return null;
    } catch (e) {
      debugPrint("user_view_model createUserWithEmailandPassword hata: " +
          e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }
}
