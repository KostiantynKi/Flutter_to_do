import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/task_list.dart';
// my castum type data for myTestList
import 'package:my_to_do/task_cubit/task_cubit.dart';
import 'package:my_to_do/task_cubit/task_state.dart';
import 'my_text_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final TaskCubit taskCubit = context.read<TaskCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Мой список дел',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.checklist_rtl,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          body: Container(
            color: Colors.deepPurpleAccent,
            child: Column(
              children: [
                MyTextField(),
                TaskList(),
                FloatingActionButton(
                  onPressed: () {
                    taskCubit.clearList();
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
