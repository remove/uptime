import 'package:shared_preferences/shared_preferences.dart';

class LaunchDataInitModel {
  initNewDay() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> savedDate = sharedPreferences.getStringList("savedDate");
    var date = DateTime(
      int.parse(savedDate[0]),
      int.parse(savedDate[1]),
      int.parse(savedDate[2]),
    );
    var now = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    List<String> nowDate = [
      DateTime.now().year.toString(),
      DateTime.now().month.toString(),
      DateTime.now().day.toString(),
    ];
    if (!now.isAtSameMomentAs(date)) {
      tomatoAnalysisNewDay();
      taskAnalysisNewDay();
      scheduleListNewDay();
      sharedPreferences.setStringList("savedDate", nowDate);
    }
  }

  tomatoAnalysisNewDay() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> dataList = sharedPreferences.getStringList("tomatoAnalysisList");
    dataList.removeAt(6);
    dataList.insert(0, "0");
    sharedPreferences.setStringList("tomatoAnalysisList", dataList);
  }

  taskAnalysisNewDay() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> dataList = sharedPreferences.getStringList("taskAnalysisList");
    dataList.removeAt(6);
    dataList.insert(0, "0");
    sharedPreferences.setStringList("taskAnalysisList", dataList);
  }

  scheduleListNewDay() async {
    List<List> dataList = List();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int count = sharedPreferences.getInt("taskCount");
    if (count > 0) {
      for (int i = 0; i <= count - 1; i++) {
        List scheduleList =
            sharedPreferences.getStringList("scheduleList_" + i.toString());
        dataList.add(scheduleList);
      }
    }
    for (int i = 0; i < count; i++) {
      dataList[i][0] = "0";
    }
    for (int i = 0; i < count; i++) {
      sharedPreferences.setStringList(
          "scheduleList_" + i.toString(), dataList[i]);
    }
  }
}
