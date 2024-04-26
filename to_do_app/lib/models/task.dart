class ToDo {
  String id;
  String todoItem;
  bool isCleared;

  ToDo({
    required this.id,
    required this.todoItem,
    this.isCleared = false,
  });
}
