import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
