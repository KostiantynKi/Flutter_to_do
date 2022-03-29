import 'package:flutter/material.dart';
import 'package:my_to_do/toDoTextParams.dart'; // as customParams;

class TaskList extends StatelessWidget {
  final TextEditingController myController;
  final List<ToDoTextParams> myTestList;
  final Function deleteListItem;
  final Function doDidButton;

  const TaskList(
      {Key? key,
      required this.myController,
      required this.myTestList,
      required this.deleteListItem,
      required this.doDidButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: myTestList.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.grey[300],
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      myTestList[index].theTask!,
                      style: TextStyle(
                        decoration: myTestList[index].isDone!
                            ? TextDecoration.lineThrough
                            : null,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                OutlineButton(
                  shape: const StadiumBorder(),
                  highlightedBorderColor: Colors.black,
                  borderSide: BorderSide(width: 3, color: Colors.red),
                  onPressed: () {
                    deleteListItem(index);
                  },
                  //child: Text('Delete'),
                  child: Icon(Icons.delete),
                ),
                OutlineButton(
                  shape: StadiumBorder(),
                  highlightedBorderColor: Colors.black,
                  borderSide: BorderSide(width: 3, color: Colors.green),
                  onPressed: () {
                    doDidButton(index);
                  },
                  child: Icon(Icons.done),
                ),
              ],
            );
          }),
    );
  }
}
