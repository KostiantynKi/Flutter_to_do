import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_to_do/home_page.dart';
import 'package:my_to_do/task_cubit/task_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OwnToDoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TaskCubit>(
        create: (context) => TaskCubit(),
        child: HomePage(),
      ),
    );
  }
}
