import 'package:flutter/material.dart';
import 'package:littledecisive/model/providerModel.dart';
import 'package:provider/provider.dart';

class NewTask extends StatelessWidget {
  NewTask({@required this.callback});

  final callback;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ProviderModel providerModel, child) => GestureDetector(
        onTap: () {
          callback(providerModel.taskCount, true);
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
