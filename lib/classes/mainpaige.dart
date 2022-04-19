import 'package:dismiss/classes/todo_list.dart';
import 'package:flutter/material.dart';

import '../menu/my_chat.dart';
import '../menu/my_profile.dart';
import '../menu/my_settings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('toligrimm.kz'),
        backgroundColor: Colors.yellow,
      ),
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
              title: const Text('ToDo'),
              tileColor: Colors.cyan,
              textColor: Colors.white,
              trailing: const Icon(
                Icons.done_outline_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ToDoList1()),
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
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            )
          ],
        ),
      ),
      body: Scrollbar(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            
            ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const MyProfilePage()),);},
              icon: Image.asset('assets/images/cat1.jpg'),
              label: const Text('profile'),
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(100, 100),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ToDoList1()),);},
                icon: Image.asset('assets/images/fatty.jpg'),
                label: const Text('todo'),
            ),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const ChatPage()),);},
              icon: Image.asset('assets/images/lovely.jpg'),
              label: const Text('chat'),
            ),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsPage()),);},
              icon: Image.asset('assets/images/peach.jpg'),
              label: const Text('settings'),
            ),
          ],
        ),
      )
    );
  }
}
