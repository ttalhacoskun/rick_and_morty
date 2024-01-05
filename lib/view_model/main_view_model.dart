import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/model/character.dart';

class MainViewModel with ChangeNotifier {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";

  List<Character> _characters = [];


  List<Character> get characters => _characters;

  MainViewModel(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCharacters();
    });
  }

  void _getCharacters() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    Map<String, dynamic> responseMap = jsonDecode(response.body);
    List<dynamic> characterList = responseMap["results"] ?? [];

    for (Map<String, dynamic> characterMap in characterList) {
      Character character = Character.fromMap(characterMap);
      _characters.add(character);
    }
    notifyListeners();
  }
}
