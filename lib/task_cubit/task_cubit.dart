import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/models/to_do_text_params.dart';
import 'package:my_to_do/task_cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(EmptyListState());

  void addNewItem(ToDoTextParams item) {
    // addNewTask   -   task
    List<ToDoTextParams> list = state.myTestList!;
    list.add(item);

    emit(state.copyWith(myTestList: list));
    // copyWith значит копируем состояние(со всеми параметрами)
    // а в скобках указываем какие параметры нам надо заменить
  }

  void deleteItem(ToDoTextParams item) {
    // deleteTask   -   task
    List<ToDoTextParams> list = state.myTestList!;
    list.remove(item);

    emit(state.copyWith(myTestList: list));
  }

  void clearList() {
    emit(EmptyListState());
  }

  void isDone(int index) {
    state.myTestList![index].isDone = !state.myTestList![index].isDone!;

    emit(state.copyWith());
  }
}
