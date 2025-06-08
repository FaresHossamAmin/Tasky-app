enum TaskItemActionsEnum {
  markAsDone(name: "Check | Uncheck"),
  edit(name: "Edit"),
  delete(name: "Delete"),
  ;

  final String name;

  const TaskItemActionsEnum({required this.name});
}
