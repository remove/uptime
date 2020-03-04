import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  TaskBar({
    @required this.height,
  });

  final int height;

  @override
  Widget build(BuildContext context) {
    return bar();
  }

  Widget bar() {
    if (height > 0) {
      return Container(
        width: 30,
        height: height * 10.toDouble(),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        constraints: BoxConstraints(
          maxHeight: 160,
          minHeight: 30,
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
    return Container(
      width: 30,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}
