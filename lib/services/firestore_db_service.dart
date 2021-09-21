import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spacex/models/user_model.dart';
import 'package:spacex/services/database_base.dart';

class FireStoreDBService implements DBBase {
  final Firestore _firebaseDB = Firestore.instance;

  @override
  Future<bool> saveUser(UserModel user) async {
    /*Map _eklenecekUserMap = user.toMap();
    _eklenecekUserMap['createdAt'] = FieldValue.serverTimestamp();
    _eklenecekUserMap['updatedAt'] = FieldValue.serverTimestamp();
 _eklenecekUserMap.addAll(<String, dynamic>{
   "yeniAlan" : "yeni alan",
 });*/
    await _firebaseDB
        .collection("users")
        .document(user.userID)
        .setData(user.toMap());

    DocumentSnapshot _okunanUser =
        await Firestore.instance.document("users/${user.userID}").get();

    Map _okunanUserBilgileriMap = _okunanUser.data;
    UserModel _okunanUserBilgileriNesne =
        UserModel.fromMap(_okunanUserBilgileriMap);
    print("--------------------------");
    print("FireStoreDBService > saveUser ");
    print("Okunan user nesnesi : " + _okunanUserBilgileriNesne.toString());
    print("--------------------------");
    return true;
  }

  @override
  Future<UserModel> readUser(String userID) {}
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
