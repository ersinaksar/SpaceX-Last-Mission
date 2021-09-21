import 'package:spacex/locator.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/services/auth_base.dart';
import 'package:spacex/services/firebase_auth_service.dart';
import 'package:spacex/services/firestore_db_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FireStoreDBService _firestoreDBService = locator<FireStoreDBService>();

  AppMode appMode = AppMode.RELEASE;
  @override
  Future<UserModel> currentUser() async {
    if (appMode == AppMode.RELEASE) {
      UserModel _user = await _firebaseAuthService.currentUser();
      return _user;
    } else {
      return null;
    }
  }

  @override
  Future<UserModel> signInAnonymously() async {
    if (appMode == AppMode.RELEASE) {
      return await _firebaseAuthService.signInAnonymously();
    } else {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      //return await _fakeAuthenticationService.signOut();
      return null;
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    if (appMode == AppMode.RELEASE) {
      UserModel _user = await _firebaseAuthService.signInWithGoogle();
      bool _sonuc = await _firestoreDBService.saveUser(_user);
      if (_sonuc) {
        return _user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<UserModel> signInWithEmailandPassword(
      String email, String sifre) async {
    if (appMode == AppMode.DEBUG) {
      return null;
    } else {
      UserModel _user =
          await _firebaseAuthService.signInWithEmailandPassword(email, sifre);

      return await _firestoreDBService.readUser(_user.userID);
    }
  }

  @override
  Future<UserModel> createUserWithEmailandPassword(
      String email, String sifre) async {
    UserModel _user =
        await _firebaseAuthService.createUserWithEmailandPassword(email, sifre);
    bool _sonuc = await _firestoreDBService.saveUser(_user);
    if (_sonuc) {
      return _user;
    } else {
      return null;
    }
  }
}
