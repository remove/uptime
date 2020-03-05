import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptime/model/firstLaunchDataInitModel.dart';
import 'package:uptime/model/launchDataInitModel.dart';

class ProviderModel with ChangeNotifier {
  List<List> _dataList;
  List<String> _taskList;
  List<List> _scheduleList;
  List<String> _tomatoAnalysisList = ["0", "0", "0", "0", "0", "0", "0"];
  List<String> _taskAnalysisList = ["0", "0", "0", "0", "0", "0", "0"];
  int _todayGoalSchedule;
  int _tomatoSchedule;
  int _timingTask;
  int _todayGoal;
  int _tomatoGoal;
  int _taskCount = 0;

  ///任务数据列表
  List<List> get dataList => _dataList;

  ///任务名列表
  List<String> get taskList => _taskList;

  ///任务进度数据列表
  List<List> get scheduleList => _scheduleList;

  ///番茄数分析列表
  List<String> get tomatoAnalysisList => _tomatoAnalysisList;

  ///任务完成数分析列表
  List<String> get taskAnalysisList => _taskAnalysisList;

  ///计时器任务选定项
  int get timingTask => _timingTask;

  ///任务总数
  int get taskCount => _taskCount;

  ///当天番茄目标总数
  int get todayGoal => _todayGoal;

  ///当天完成的番茄数
  int get todayGoalSchedule => _todayGoalSchedule;

  ///总计已完成的番茄数
  int get tomatoSchedule => _tomatoSchedule;

  ///总计要完成的番茄数
  int get tomatoGoal => _tomatoGoal;

  ///初始化数据
  initData() async {
    await FirstLaunchDataInitModel().initTaskCount();
    await LaunchDataInitModel().initNewDay();
    getTomatoAnalysisList();
    getTaskAnalysisList();
    getDataList();
    getScheduleList();
    getTaskCount();
    getTaskList();
  }

  ///[index]=>选定任务索引
  setTimingTask(int index) {
    _timingTask = index;
  }

  ///获取数据列表
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

    ///生成并刷新当前目标及总计番茄数
    getTodayGoal();
    getTomatoGoal();
    notifyListeners();
  }

  ///获取完成进度数列表
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

    ///生成并刷新当天已完成的目标数及完成总数
    getTodayGoalSchedule();
    getTomatoSchedule();
    notifyListeners();
  }

  ///获取番茄统计列表
  getTomatoAnalysisList() async {
    _tomatoAnalysisList = List();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _tomatoAnalysisList = sharedPreferences.getStringList("tomatoAnalysisList");
    notifyListeners();
  }

  ///获取任务完成数统计列表
  getTaskAnalysisList() async {
    _taskAnalysisList = List();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _taskAnalysisList = sharedPreferences.getStringList("taskAnalysisList");
    notifyListeners();
  }

  ///获取任务总数
  getTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _taskCount = sharedPreferences.getInt("taskCount");
    notifyListeners();
  }

  ///获取计时任务列表
  getTaskList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _taskList = sharedPreferences.getStringList("taskList");
    _taskList.insert(0, "选择任务");
    notifyListeners();
  }

  ///生成当天完成的番茄数
  getTodayGoalSchedule() {
    int num = 0;
    for (int i = 0; i < _scheduleList.length; i++) {
      num += int.parse(_scheduleList[i][0]);
    }
    _todayGoalSchedule = num;
    notifyListeners();
  }

  ///生成当前已完成番茄总数
  getTomatoSchedule() {
    int num = 0;
    for (int i = 0; i < _scheduleList.length; i++) {
      num += int.parse(_scheduleList[i][1]);
    }
    _tomatoSchedule = num;
    notifyListeners();
  }

  ///获取今天目标总数
  getTodayGoal() {
    int num = 0;
    for (int i = 0; i < _dataList.length; i++) {
      num += int.parse(_dataList[i][1]);
    }
    _todayGoal = num;
    notifyListeners();
  }

  ///获取番茄目标总数
  getTomatoGoal() {
    int num = 0;
    for (int i = 0; i < _dataList.length; i++) {
      num += int.parse(_dataList[i][2]);
    }
    _tomatoGoal = num;
    notifyListeners();
  }
}
