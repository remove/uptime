import 'package:shared_preferences/shared_preferences.dart';

class DataModel {
  initTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getInt("taskCount") == null) {
      sharedPreferences.setInt("taskCount", 0);
      sharedPreferences.setStringList("taskList", []);
    }
  }

  saveData(List<String> dataList, int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("data_$index", dataList);
  }

  getData(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = sharedPreferences.getStringList("data_$index");
    return data;
  }

  getScheduleList(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = sharedPreferences.getStringList("scheduleList_$index");
    return data;
  }

  saveTaskCount(int taskCount) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("taskCount", taskCount);
  }

  saveScheduleList(int index, List<String> list) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> scheduleList = list;
    sharedPreferences.setStringList("scheduleList_$index", scheduleList);
  }

  newTask(String task) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List taskList = sharedPreferences.getStringList("taskList");
    taskList.add(task);
    sharedPreferences.setStringList("taskList", taskList);
  }

  editTask(int index, String task) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List taskList = sharedPreferences.getStringList("taskList");
    taskList[index] = task;
    sharedPreferences.setStringList("taskList", taskList);
  }

  delTask(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List taskList = sharedPreferences.getStringList("taskList");
    taskList.removeAt(index);
    sharedPreferences.setStringList("taskList", taskList);
  }
}
