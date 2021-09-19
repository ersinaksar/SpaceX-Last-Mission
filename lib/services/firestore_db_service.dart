import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/services/database_base.dart';

class FireStoreDBService implements DBBase {
  final Firestore _firebaseDB = Firestore.instance;

  @override
  Future<bool> saveUser(UserModel user) async {
    await _firebaseDB
        .collection("users")
        .document(user.userID)
        .setData(user.toMap());
    return true;
  }

  @override
  Future<UserModel> readUser(String userID) {
    // TODO: implement readUser
    throw UnimplementedError();
  }
/*
  @override
  Future<UserModel> readUser(String userID) async {
    DocumentSnapshot _okunanUser =
        await _firebaseDB.collection("users").document(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap = _okunanUser.data;

    UserModel _okunanUserNesnesi = UserModel.fromMap(_okunanUserBilgileriMap);
    print("okunan user nesnesi : " + _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }*/
}
