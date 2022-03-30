import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoList1(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

class ToDoList1 extends StatefulWidget {
  static final String tag = 'single-list-use';

  const ToDoList1({Key? key}) : super(key: key);
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {
          if (_todoList.length != 0) {
            _todoList.forEach((student) => print(student.toString()));
          } else {
            print('map list empty');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      appBar: AppBar(
        title: Text('Single Map Use'),
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
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
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
}