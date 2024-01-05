import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/view/main_page.dart';
import 'package:rick_and_morty/view_model/main_view_model.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => MainViewModel(),
        child: MainPage(),
      ),
    );
  }
}