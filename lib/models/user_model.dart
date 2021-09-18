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

  UserModel({@required this.userID, String email});

  //sirestroe dan veri çekerkende okurkende maplaeri kullanıyoruz
  Map<String, dynamic> toMap() {
    //var olan nesneyi map e dönüştürüyuor
    return {
      "userID": userID,
      "email": email,
      "userName": userName ??
          email.substring(0, email.indexOf("@")) +
              randomSayiUret(), //eğer null değilse kullan nulsa buunu kullan
      "profilURL": profilURL ??
          "https://image.freepik.com/free-vector/salmon-sushi-with-chopstick-plate-cartoon-icon-illustration-japanese-food-icon-concept-isolated-flat-cartoon-style_138676-1727.jpg", //'https://emrealtunbilek.com/wp-content/uploads/2016/10/apple-icon-72x72.png',
      "createdAt": createdAt ?? FieldValue.serverTimestamp(),
      "updatedAt": updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  //isimlendirilmiş constructor bize user nesenesi döndürüyor
  UserModel.fromMap(Map<String, dynamic> map)
      : userID = map["userID"],
        email = map["email"],
        userName = map["userName"],
        profilURL = map["profilURL"],
        createdAt = (map["createdAt"] as Timestamp).toDate(),
        updatedAt = (map["updatedAt"] as Timestamp).toDate();

  //Yine isimlendirilmiş bir constructor tanımlıyruz mekanlar_page içinde menu widgetinden çağırabişmek için
  UserModel.idveResim({@required this.userID, @required this.profilURL});

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, userName: $userName, profilURL: $profilURL, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999);
    return rastgeleSayi.toString();
  }
}
