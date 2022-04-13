import 'package:dismiss/classes/todo.dart';
import 'package:flutter/material.dart';


class NewTodoView extends StatefulWidget {
  final Todo item;

  const NewTodoView({Key? key,  required this.item }) : super(key: key);

  @override
  _NewTodoViewState createState() => _NewTodoViewState();
}

class _NewTodoViewState extends State<NewTodoView> {
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
        text: widget.item != null ? widget.item.title : null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item != null ? 'Edit todo' : 'New todo',
          key: const Key('new-item-title'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
              autofocus: true,
              onSubmitted: (value) => submit(),
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 14.0,),
            ElevatedButton(
              child: const Text(
                'Save',
                style: TextStyle(
                  color: Colors.pink,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () => submit(),
            )
          ],
        ),
      ),
    );
  }

  void submit(){
    Navigator.of(context).pop(titleController.text);
  }
}