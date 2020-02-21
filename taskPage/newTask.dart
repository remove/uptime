import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptime/model/taskModel.dart';

class NewTask extends StatelessWidget {
  NewTask({@required this.callback});

  final callback;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, TaskModel taskModel, child) => GestureDetector(
        onTap: () {
          callback(taskModel.pGetTaskCount, true);
        },
        child: child,
      ),
      child: Container(
        margin: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.add_circle,
            color: Colors.black54,
            size: 65,
          ),
        ),
      ),
    );
  }
}
