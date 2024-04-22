class Task {
  String? id;
  String title;
  String description;
  bool isDone;

  Task({this.id, required this.title, required this.description, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map, {String? id}) {
    return Task(
      id: id,
      title: map['title'],
      description: map['description'],
      isDone: map['isDone'],
    );
  }
}