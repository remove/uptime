import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskModel {
  TaskModel({
    @required this.index,
    this.title,
    this.flag,
    this.done,
    this.notification,
    this.endDate,
    this.note,
  });

  final int index;
  final String title;
  final String flag;
  final String done;
  final String notification;
  final String endDate;
  final String note;

  saveData() async {
    List<String> data = [title, flag, done, notification, endDate, note];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("$index", data);
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = sharedPreferences.getStringList("$index");
    return data;
  }
}