import 'package:flutter/material.dart';
import 'package:my_to_do/models/to_do_text_params.dart';

class TheTaskOne extends StatelessWidget {
  final ToDoTextParams task;
  final Function deleteItem;
  final Function isDone;

  const TheTaskOne(
      {Key? key,
      required this.task,
      required this.deleteItem,
      required this.isDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Text(
                task.theTask!,
                style: TextStyle(
                  decoration: task.isDone! ? TextDecoration.lineThrough : null,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
                // side: BorderSide(color: Colors.red),
              ))),
          onPressed: () {
            deleteItem();
            // taskCubit.deleteItem(task);
          },
          child: const Icon(
            Icons.delete,
            size: 20,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
                // side: BorderSide(color: Colors.red),
              ))),
          // shape: StadiumBorder(),
          // highlightedBorderColor: Colors.black,
          // borderSide: BorderSide(width: 2, color: Colors.green),
          onPressed: () {
            isDone();
            // taskCubit.doDidIndicate(index); // markItemByIndex()
          },
          child: const Icon(
            Icons.done,
            color: Colors.greenAccent,
          ),
        ),
      ],
    );
  }
}
