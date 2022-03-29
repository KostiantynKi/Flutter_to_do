import 'package:flutter/material.dart';
import 'package:my_to_do/taskList.dart';
import 'package:my_to_do/toDoTextParams.dart'; // my castum type data for _myTestList
import 'myTextField_v3.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myController = TextEditingController();
  final List<ToDoTextParams> _myTestList = [];

  void _addTextToList() => setState(() {
        _myTestList.add(ToDoTextParams(
          isDone: false,
          theTask: _myController.text,
        ));
        _myController.text = '';
      });

  void _deleteListItem(int index) => setState(() {
        _myTestList.remove(_myTestList[index]);
      });

  void _doDidButton(int index) => setState(() {
        _myTestList[index].isDone = !_myTestList[index].isDone!;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          MyTextField(
            myController: _myController,
            myTestList: _myTestList,
            addTextToList: _addTextToList,
          ),
          TaskList(
            deleteListItem: _deleteListItem,
            doDidButton: _doDidButton,
            myController: _myController,
            myTestList: _myTestList,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _myTestList.clear();
              });
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
