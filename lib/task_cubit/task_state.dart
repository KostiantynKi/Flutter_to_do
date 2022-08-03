import 'package:flutter/material.dart';
import 'package:my_to_do/models/to_do_text_params.dart';

@immutable
class TaskState {
  final List<ToDoTextParams>? myTestList; // taskList
  TaskState({this.myTestList});
  TaskState copyWith({List<ToDoTextParams>? myTestList}) {
    return TaskState(myTestList: myTestList ?? this.myTestList);
  }
}

class EmptyListState extends TaskState {
  EmptyListState() : super(myTestList: []);
}
