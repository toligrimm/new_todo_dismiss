import 'package:flutter/material.dart';

class ToDoList1 extends StatefulWidget {
  static const String tag = 'todo-list-use';

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
  bool showTextFormField = false;

  void _addNewTodo() {
    setState(() {
      _todoList.add(Todo1('', 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
