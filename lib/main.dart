import 'package:flutter/material.dart';
import 'classes/todo_list.dart';


void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ToDoList1(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

