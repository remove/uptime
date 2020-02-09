import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  TaskBar({
    @required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: 30,
        minWidth: 30,
        minHeight: height*20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 7),
            child: Text(
              height.toInt().toString(),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
