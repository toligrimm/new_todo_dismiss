import 'dart:convert';

import 'package:dismiss/menu/my_profile.dart';
import 'package:dismiss/classes/todo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/my_chat.dart';
import '../menu/my_settings.dart';


class ToDoList1 extends StatefulWidget {


  const ToDoList1({Key? key}) : super(key: key);

  @override
  _ToDoList1State createState() => _ToDoList1State();
}

class _ToDoList1State extends State<ToDoList1> {
  late SharedPreferences sharedPreferences;
  final List<Todo1> _todoList = [];
  Map<int, Todo1> _todoMap = {};
  bool showTextFormField = false;

  void _addNewTodo() {
    setState(() {
      _todoList.add(Todo1('', 1));
    });
  }

  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
  }

  void loadSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  TextEditingController controller = TextEditingController();

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTodo();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: Container(
        child: Builder(
          builder: (context) {
            print("List : ${_todoList.toString()}");
            _todoMap = _todoList.asMap();
            print("MAP : ${_todoMap.toString()}"); //не удалять
            return Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: _todoMap.length,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 3, 3, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Введите значение',
                              hintStyle: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.pink,
                          ),
                          onPressed: () {
                            setState(() {
                              _todoList.removeAt(position);
                            });
                          },
                        ),
                        // IconButton(onPressed: () {
                        //   setState(() {
                        //
                        //   });
                        //   saveMapToSP({
                        //     'Введите текст':controller.text,
                        //   },
                        //   'jsonData');
                        // },
                        //     icon: const Icon(Icons.done,),
                        // ),
                        // const Divider(),
                        // IconButton(onPressed: () => loadData(), icon: Icon(Icons.visibility,),),
                        // Text(text),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void loadData() {
    Map data = getMapFromSP('jsonData');
    setState(() {
      controller.text = data['Значение'];
    });
  }

  void saveStringToSP(String key, String value){
    if(value.isNotEmpty && key.isNotEmpty) {
      sharedPreferences.setString(key, value);
    }

  }
  String getStringFromSP(String key){
    if(key.isNotEmpty){
      String? value = sharedPreferences.getString(key);
      if(value != null) {
        return value;
      } else {
        return '';
      }
    }else{
      return '';
    }
  }

  void saveMapToSP(Map map, String key){
    String jsonString = jsonEncode(map);
    saveStringToSP(key, jsonString);
  }

  Map getMapFromSP(String key){
    String string = getStringFromSP(key);
    if(string != null && string.isNotEmpty) {
      return jsonDecode(string);
    } else {
      return {};
    }
  }
}
