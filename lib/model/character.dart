import 'package:flutter/material.dart';

class Character with ChangeNotifier{
  int id;
  String name;
  String image;
  String gender;

  Character.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        image = map["image"],
        gender = map["gender"];
}
