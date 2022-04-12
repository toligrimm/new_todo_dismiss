import 'package:dismiss/menu/my_profile.dart';
import 'package:dismiss/classes/todo.dart';
import 'package:flutter/material.dart';
import '../menu/my_chat.dart';
import '../menu/my_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ToDoList1 extends StatefulWidget {

  static const String tag = 'todo-list-use';

  const ToDoList1({Key? key}) : super(key: key);

  @override
  _ToDoList1State createState() => _ToDoList1State();

}

class _ToDoList1State extends State<ToDoList1> {

  final List<Todo1> _todoList = [];
  Map<int, Todo1> _todoMap = {};
  bool showTextFormField = false;
  int _selectedIndex = 0;
  int _saver = 0;
  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    void _addNewTodo() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        _todoList.add(Todo1('', 1, ));
        _saver = (prefs.getInt('saver') ?? 0);
      });
    }
  @override
  void initState() {
    super.initState();
    _addNewTodo();
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
                trailing: const Icon(
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
                trailing: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
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
              // _widgetOptions.elementAt(_selectedIndex);
              print("List : ${_todoList.toString()}");
              _todoMap = _todoList.asMap();
              print("MAP : '${_todoMap.toString()}"); //не удалять
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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      );
    }
  }
