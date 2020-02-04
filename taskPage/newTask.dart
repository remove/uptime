import 'package:flutter/material.dart';
import 'package:uptime/model/taskModel.dart';

class NewTask extends StatefulWidget {
  NewTask({
    @required this.callback,
  });

  final callback;

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  int _taskCount;

  @override
  void initState() {
    TaskModel().getTaskCount().then((data) {
      setState(() {
        _taskCount = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback(_taskCount,true);
      },
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
