import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/task_cubit/task_cubit.dart';
import 'package:my_to_do/task_cubit/task_state.dart';
import 'package:my_to_do/the_task_one.dart'; // as customParams;

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
      final TaskCubit taskCubit = context.read<TaskCubit>();

      return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.myTestList!.length,
            itemBuilder: (BuildContext context, int index) {
              return TheTaskOne(
                task: state.myTestList![index],
                deleteItem: () {
                  taskCubit.deleteItem(state.myTestList![index]);
                },
                isDone: () {
                  taskCubit.isDone(index);
                },
              );
            }),
      );
    });
  }
}
