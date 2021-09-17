import 'package:flutter/material.dart';

class UserModel {
  //backend ci bize mutlaka bir userid dönmeli
  final String userID;
  String email;

  UserModel({@required this.userID, String email});

  //sirestroe dan veri çekerkende okurkende maplaeri kullanıyoruz
  Map<String, dynamic> toMap() {
    //var olan nesneyi map e dönüştürüyuor
    return {
      "userID": userID,
      "email": email,
    };
  }
}
