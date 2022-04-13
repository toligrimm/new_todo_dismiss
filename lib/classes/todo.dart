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

class Todo {
  String title;
  bool completed;

  Todo({
    required this.title,
    this.completed = false,
  });

  Todo.fromMap(Map map) :
        title = map['title'],
        completed = map['completed'];

  Map toMap(){
    return {
      'title': title,
      'completed': completed,
    };
  }
}