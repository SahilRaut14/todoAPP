import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyapp/BottonScreen.dart';
import 'package:todoeyapp/common_box.dart';
import 'package:todoeyapp/task_tile.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: BottomSheetScreen());
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 30.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlue,
                    size: 40.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'To Doey!',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text('${Provider.of<CommonBox>(context).taskCount} Tasks',
                    style:
                        const TextStyle(color: Colors.white, fontSize: 18.0)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final taskTrueContext = Provider.of<CommonBox>(context);
        final taskFalseContext = Provider.of<CommonBox>(context, listen: false);

        return TaskTile(
          taskTitle: taskTrueContext.tasks[index].name,
          isChecked: taskTrueContext.tasks[index].isDone,
          checkBoxCallBack: (checkBoxState) {
            taskFalseContext.updateTask(taskFalseContext.tasks[index]);
          },
          longPressCallBack: () {
            taskFalseContext.deleteTask(taskFalseContext.tasks[index]);
          },
        );
      },
      itemCount: Provider.of<CommonBox>(context).taskCount,
    );
  }
}
