import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptime/model/dataModel.dart';

class ProviderModel with ChangeNotifier {
  List<List> _dataList;
  List<String> _taskList;
  List<List> _scheduleList;
  int _todayGoalSchedule;
  int _tomatoSchedule;
  int _timingTask;
  int _todayGoal;
  int _tomatoGoal;
  int _taskCount = 0;

  //任务数据列表
  List<List> get dataList => _dataList;

  //任务名列表
  List<String> get taskList => _taskList;

  //任务进度数据列表
  List<List> get scheduleList => _scheduleList;

  //选择的任务
  int get timingTask => _timingTask;

  //任务总数
  int get taskCount => _taskCount;

  //今天完成的番茄数
  int get todayGoalSchedule => _todayGoalSchedule;

  //总计完成的番茄数
  int get tomatoSchedule => _tomatoSchedule;

  //总计今天番茄目标数
  int get todayGoal => _todayGoal;

  //总计的番茄数
  int get tomatoGoal => _tomatoGoal;

  initData() async {
    await DataModel().initTaskCount();
    getDataList();
    getScheduleList();
    getTaskCount();
    getTaskList();
  }

  setTimingTask(int index) {
    _timingTask = index;
  }

  getDataList() async {
    _dataList = List();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = sharedPreferences.getInt("taskCount");
    if (count > 0) {
      for (int i = 0; i <= count - 1; i++) {
        List datalist = sharedPreferences.getStringList("data_" + i.toString());
        _dataList.add(datalist);
      }
    }
    getTodayGoal();
    getTomatoGoal();
    notifyListeners();
  }

  getScheduleList() async {
    _scheduleList = List();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = sharedPreferences.getInt("taskCount");
    if (count > 0) {
      for (int i = 0; i <= count - 1; i++) {
        List scheduleList =
            sharedPreferences.getStringList("scheduleList_" + i.toString());
        _scheduleList.add(scheduleList);
      }
    }
    getTodayGoalSchedule();
    getTomatoSchedule();
    notifyListeners();
  }

  getTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _taskCount = sharedPreferences.getInt("taskCount");
    notifyListeners();
  }

  getTaskList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _taskList = sharedPreferences.getStringList("taskList");
    _taskList.insert(0, "选择任务");
    notifyListeners();
  }

  getTodayGoalSchedule() {
    int num = 0;
    for (int i = 0; i < _scheduleList.length; i++) {
      num += int.parse(_scheduleList[i][0]);
    }
    _todayGoalSchedule = num;
    notifyListeners();
  }

  getTomatoSchedule() {
    int num = 0;
    for (int i = 0; i < _scheduleList.length; i++) {
      num += int.parse(_scheduleList[i][1]);
    }
    _tomatoSchedule = num;
    notifyListeners();
  }

  getTodayGoal() {
    int num = 0;
    for (int i = 0; i < _dataList.length; i++) {
      num += int.parse(_dataList[i][1]);
    }
    _todayGoal = num;
    notifyListeners();
  }

  getTomatoGoal() {
    int num = 0;
    for (int i = 0; i < _dataList.length; i++) {
      num += int.parse(_dataList[i][2]);
    }
    _tomatoGoal = num;
    notifyListeners();
  }
}
