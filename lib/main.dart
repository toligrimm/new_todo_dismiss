import 'package:flutter/material.dart';
import 'classes/mainpaige.dart';



void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

