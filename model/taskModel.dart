import 'package:shared_preferences/shared_preferences.dart';

class TaskModel {
  TaskModel({this.index, this.dataList, this.taskCount});

  final int index;
  final List<String> dataList;
  final int taskCount;

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
