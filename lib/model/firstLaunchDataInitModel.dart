import 'package:shared_preferences/shared_preferences.dart';

class FirstLaunchDataInitModel {
  initTaskCount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getInt("taskCount") == null) {
      sharedPreferences.setInt("taskCount", 0);
      sharedPreferences.setStringList("taskList", []);
      initTomatoAnalysisList();
      initTaskAnalysisList();
      initDateTime();
    }
  }

  initTomatoAnalysisList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List dataList = List<String>.generate(7, (index) {
      return "0";
    });
    sharedPreferences.setStringList("tomatoAnalysisList", dataList);
  }

  initTaskAnalysisList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List dataList = List<String>.generate(7, (index) {
      return "0";
    });
    sharedPreferences.setStringList("taskAnalysisList", dataList);
  }

  initDateTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> date = [
      DateTime.now().year.toString(),
      DateTime.now().month.toString(),
      DateTime.now().day.toString(),
    ];
    sharedPreferences.setStringList("savedDate", date);
  }
}
