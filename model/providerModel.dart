import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptime/model/taskModel.dart';

class ProviderModel with ChangeNotifier {
  List<List> _dataList;
  int _taskCount = 0;

  List<List> get dataList => _dataList;

  int get taskCount => _taskCount;

  initData() async {
    await initTaskCount();
    getDataList();
    getTaskCount();
  }

  initTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int data = sharedPreferences.getInt("taskCount");
    if (data == null) {
      TaskModel(taskCount: 0).saveTaskCount();
    }
  }

  getDataList() async {
    _dataList = List();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = sharedPreferences.getInt("taskCount");
    if (count > 0) {
      for (int i = 0; i <= count - 1; i++) {
        List datalist = sharedPreferences.getStringList(i.toString());
        _dataList.add(datalist);
      }
    }
    notifyListeners();
  }

  getTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _taskCount = sharedPreferences.getInt("taskCount");
    notifyListeners();
  }
}
