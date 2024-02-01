import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required  this.taskTitle, required this.isChecked});

final String taskTitle;
 final  bool isChecked;

  @override
  Widget build(BuildContext context) {
    return ListTile( 
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: (value) {
          
        },
          value: isChecked,
          fillColor: const MaterialStatePropertyAll(Colors.lightBlueAccent),
          checkColor: Colors.white,
          ),
    );
  }
}

//Lifting the stateup!
//