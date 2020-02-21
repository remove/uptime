import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskModel with ChangeNotifier {
  TaskModel({this.index, this.dataList, this.taskCount});

  final int index;
  final List<String> dataList;
  List<List> _pGetDataList;
  int _pGetTaskCount = 0;

  List<List> get pGetDataList => _pGetDataList;

  int get pGetTaskCount => _pGetTaskCount;

  final int taskCount;

  providerInitData() async {
    await initTaskCount();
    providerGetDataList();
    providerGetTaskCount();
  }

  initTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int data = sharedPreferences.getInt("taskCount");
    if (data == null) {
      TaskModel(taskCount: 0).saveTaskCount();
    }
  }

  providerGetDataList() async {
    _pGetDataList = List();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = sharedPreferences.getInt("taskCount");
    if (count > 0) {
      for (int i = 0; i <= count - 1; i++) {
        List datalist = sharedPreferences.getStringList(i.toString());
        _pGetDataList.add(datalist);
      }
    }
    notifyListeners();
  }

  providerGetTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _pGetTaskCount = sharedPreferences.getInt("taskCount");
    notifyListeners();
  }

  saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("$index", dataList);
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = sharedPreferences.getStringList("$index");
    return data;
  }

  delData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("$index");
  }

  saveTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("taskCount", taskCount);
  }
}
