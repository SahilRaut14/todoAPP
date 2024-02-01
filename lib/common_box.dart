import 'package:flutter/material.dart';
import 'package:todoeyapp/task.dart';

class CommonBox extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Buy Milk"),
    Task(name: "Buy Eggs"),
    Task(name: "Buy Bread"),
    Task(name: "Buy Pudina"),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask( String newTaskTitle){

    final task = Task(name: newTaskTitle);
    tasks.add(task);
    notifyListeners();
  }
   }
