import 'package:flutter/material.dart';


class ToDoList1 extends StatefulWidget {
  static final String tag = 'todo-list-use';
  // final List<String> _todoList1 = [];
  // final TextEditingController _textFieldController = TextEditingController();

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
  final TextEditingController _textController = TextEditingController();

  void _addNewTodo() {
    setState(() {
      _todoList.add(Todo1('', 1));
    });
  }
  void clearText() {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _addNewTodo();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('ToDo List'),
      ),

      body: Scrollbar(
        child: Builder(
          builder: (context) {
            return ListView.builder(
              itemCount: _todoMap.length,
              itemBuilder: (context, position) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: 'Ввести новое значение',
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black26,
                            ),
                          ),
                          onChanged: (text){
                            setState(() {
                              print(text);
                            });
                          },

                        ),
                      ),
                      _textController.text.length>0?new IconButton(icon: new Icon (Icons.clear, color: Colors.pinkAccent,), onPressed: (){
                        setState(() {
                          _textController.clear();
                        });

                      }, )
                      :IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.pinkAccent,
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