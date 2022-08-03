import 'package:flutter/material.dart';
import 'package:my_to_do/models/to_do_text_params.dart';
import 'package:my_to_do/task_cubit/task_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTextField extends StatelessWidget {
  final myController = TextEditingController();

  MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskCubit taskCubit = context.read<TaskCubit>();

    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  hintText: 'Введите новое задание',
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              taskCubit.addNewItem(ToDoTextParams(
                isDone: false,
                theTask: myController.text,
              ));
              myController.text = '';
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
