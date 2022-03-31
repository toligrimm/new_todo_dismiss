import 'package:flutter/material.dart';

class Todo {
  Todo({required this.title, this.isDone = false});

  String title;
  bool isDone;
}

typedef ToggleTodoCallback = void Function(Todo, bool);

class TodoList extends StatelessWidget {
  TodoList({required this.todos, required this.onTodoToggle});

  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];


    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title,),
      onChanged: (isChecked) {
        onTodoToggle(todo, isChecked!);
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child:ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,

      ),
    );

  }
}