import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();

}

class _ChatPageState extends State<ChatPage> {
  int _saver = 0;

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  void _loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _saver = (prefs.getInt('counter') ?? 0);
    });
  }

  void _incrementSaved() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _saver = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _saver);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('count'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_saver',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementSaved,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}