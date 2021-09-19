import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  //backend ci bize mutlaka bir userid dönmeli
  final String userID;

  UserModel({@required this.userID});

  //sirestroe dan veri çekerkende okurkende maplaeri kullanıyoruz
  Map<String, dynamic> toMap() {
    //var olan nesneyi map e dönüştürüyuor
    return {
      "userID": userID,
    };
  }
}
