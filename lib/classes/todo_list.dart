import 'package:flutter/material.dart';


class ToDoList1 extends StatefulWidget {
  static final String tag = 'todo-list-use';
  final List<String> _todoList1 = [];
  final TextEditingController _textFieldController = TextEditingController();

  ToDoList1({Key? key}) : super(key: key);
  @override
  _ToDoList1State createState() => _ToDoList1State();

}

class Todo1 {
  String _name;
  int _sessionId;

  Todo1(this._name, this._sessionId);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get sessionId => _sessionId;

  set sessionId(int value) {
    _sessionId = value;
  }

  @override
  String toString() {
    return 'todo $_name from session $_sessionId';
  }
}

class _ToDoList1State extends State<ToDoList1> {
  List<Todo1> _todoList = [];
  Map<int, Todo1> _todoMap = {};

  void _addNewStudent() {
    setState(() {
      _todoList.add(Todo1('', 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   floatingActionButton: FloatingActionButton(
      //   elevation: 10,
      //   // onPressed: () => _displayDialog(context),
      //   tooltip: 'Добавить задачу',
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {
          if (_todoList.length != 0) {
            _todoList.forEach((todos) => print(todos.toString()));
          } else {
            print('map list empty');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('ToDo List'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _addNewStudent();
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Builder(
          builder: (context) {
            print("List : ${_todoList.toString()}");
            _todoMap = _todoList.asMap();
            print("MAP : ${_todoMap.toString()}");
            return ListView.builder(
              itemCount: _todoMap.length,
              itemBuilder: (context, position) {
                print('Item Position $position');
                return Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          initialValue: _todoMap[position]!.name.length != 0
                              ? _todoMap[position]!.name
                              : '',
                          onFieldSubmitted: (name) {
                            setState(() {
                              _todoList[position].name = name;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'enter student name',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            _todoList.removeAt(position);
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
  // Future<Future> _displayDialog(BuildContext context) async {
  //   return showDialog(
  //       barrierColor: Colors.pink.shade50,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Добавить задачу в список'),
  //           content: TextField(
  //             autofocus: true,
  //             // enabled: editable,
  //             controller: _textFieldController,
  //             decoration: const InputDecoration(
  //               hintText: 'Ввести здесь',
  //               errorText: 'Не должно быть пустым',
  //             ),
  //             onEditingComplete: (){
  //               // After editing is complete, make the editable false
  //               setState(() {
  //               });
  //             },
  //           ),
  //           actions: <Widget>[
  //             TextButton(
  //                 autofocus: true,
  //                 child: const Text('Добавить'),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                   _addTodoItem(_textFieldController.text);
  //                 }
  //             ),
  //             TextButton(
  //               child: const Text('Отменить'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }
}