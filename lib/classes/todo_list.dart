import 'package:dismiss/classes/todo.dart';
import 'package:flutter/material.dart';

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
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 90,
              child: DrawerHeader(
                child: Text(
                  'Меню',
                  style: TextStyle(
                  color: Colors.white,
                ),),
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
              ),
            ),
            ListTile(
              title: const Text('Мой профиль'),
              onTap: () {
                // Navigator.pop(context);
              },
              tileColor: Colors.lightBlueAccent,
              textColor: Colors.white,
              trailing: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            ListTile(
              title: const Text('Settings'),
              tileColor: Colors.orange,
              onTap: () {},
              trailing: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTodo();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('ToDo List'),
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
                padding: EdgeInsets.only(top: 10),
                itemCount: _todoMap.length,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 3, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Введите значение',
                              hintStyle: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.pink,
                          ),
                          onPressed: () {
                            setState(() {
                              _todoList.removeAt(position);
                            });
                          },
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.edit),
                        //   onPressed: (){
                        //     setState(() {
                        //       _todoList.
                        //     });
                        //   },)
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
