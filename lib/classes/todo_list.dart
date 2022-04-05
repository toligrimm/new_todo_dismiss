import 'package:dismiss/menu/my_profile.dart';
import 'package:dismiss/classes/todo.dart';
import 'package:flutter/material.dart';

import '../menu/my_chat.dart';
import '../menu/my_settings.dart';

class ToDoList1 extends StatefulWidget {
  static const String tag = 'todo-list-use';

  const ToDoList1({Key? key}) : super(key: key);

  @override
  _ToDoList1State createState() => _ToDoList1State();
}

class _ToDoList1State extends State<ToDoList1> {
  List<Todo1> _todoList = [];
  Map<int, Todo1> _todoMap = {};
  bool showTextFormField = false;

  void _addNewTodo() {
    setState(() {
      _todoList.add(Todo1('', 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 90,
              child: DrawerHeader(
                child: Text(
                  'Меню',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
              ),
            ),

            ListTile(
              trailing: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text('Мой профиль'),
              tileColor: Colors.lightBlueAccent,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyProfilePage()),
                );
              },
            ),

            ListTile(
              title: const Text('Чат'),
              tileColor: Colors.orange,
              textColor: Colors.white,
              trailing: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Настройки'),
              tileColor: Colors.green,
              textColor: Colors.white,
              trailing: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            )
            ],
        ),
        ),
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
}
