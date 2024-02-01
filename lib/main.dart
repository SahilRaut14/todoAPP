import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/common_box.dart';
import 'package:todoeyapp/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CommonBox();
      },
      child: MaterialApp(
        title: 'To-Do App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: const TaskScreen(),
      ),
    );
  }
}
