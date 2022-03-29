import 'package:flutter/material.dart';
import 'package:my_to_do/toDoTextParams.dart';

class MyTextField extends StatelessWidget {
  final myController;
  var myTestList;
  final addTextToList;

  MyTextField(
      {Key? key,
      required this.myController,
      required this.myTestList,
      this.addTextToList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите новое задание',
                hintStyle: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            addTextToList();
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
