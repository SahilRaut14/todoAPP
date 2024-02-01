import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/common_box.dart';

    String? newTaskTitle = '';


class BottomSheetScreen extends StatelessWidget {
   const BottomSheetScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.deepPurple, fontSize: 30.0),
          ),
           TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            cursorColor: Colors.deepPurple,
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),),),
                    onChanged: (value){
                      newTaskTitle = value;

                    },
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.deepPurpleAccent)),
            onPressed: () {

              Provider.
              of<CommonBox>(context, listen: false).addTask(newTaskTitle!);
            Navigator.pop(context);
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
