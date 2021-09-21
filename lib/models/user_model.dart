import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  //backend ci bize mutlaka bir userid dönmeli
  final String userID;
  String email;
  String userName;
  String profilURL;
  DateTime createdAt;
  DateTime updatedAt;
  int seviye;

  UserModel({@required this.userID, @required this.email});

  //sirestroe dan veri çekerkende okurkende maplaeri kullanıyoruz
  Map<String, dynamic> toMap() {
    //var olan nesneyi map e dönüştürüyuor
    return {
      'userID': userID,
      'email': email,
      'userName': userName ?? '',
      'profilURL': profilURL ??
          'https://www.flyingintellectual.com/wp-content/uploads/2021/06/logo-1.png',
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'seviye': seviye ?? 1,
    };
  }

  //buradaki isimlendirilmiş constructuremız da  bir nesne döndürecek. Firebaseden gelen map yapısını usermodel nesnemiz olarak döndüreceğiz
  //Our named constructure here will also rotate an object. We will return the map structure from the firebase as our usermodel object
  UserModel.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        profilURL = map['profilURL'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate(),
        seviye = map['seviye'];

  @override
  String toString() {
    return 'UserModel{userID: $userID, email: $email, userName: $userName, profilURL: $profilURL, createdAt: $createdAt, updatedAt: $updatedAt, seviye: $seviye}';
  }
}
