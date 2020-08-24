import 'package:shared_preferences/shared_preferences.dart';

class DataModel {
  ///自增当天番茄完成数柱形图
  saveTomatoAnalysisList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> dataList =
        sharedPreferences.getStringList("tomatoAnalysisList");
    int i = int.parse(dataList[0]);
    i++;
    dataList[0] = i.toString();
    sharedPreferences.setStringList("tomatoAnalysisList", dataList);
  }

  ///自增当天任务完成数柱形图
  saveTaskAnalysisList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> dataList = sharedPreferences.getStringList("taskAnalysisList");
    int i = int.parse(dataList[0]);
    i++;
    dataList[0] = i.toString();
    sharedPreferences.setStringList("taskAnalysisList", dataList);
  }

  ///保存任务数据
  ///[dataList]=>任务数据列表 List[ 标题, 今天目标, 总计目标, 重复提醒, 结束日期]
  ///[index]=>任务索引
  saveData(List<String> dataList, int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("data_$index", dataList);
  }

  ///保存任务总数 [taskCount]
  saveTaskCount(int taskCount) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("taskCount", taskCount);
  }

  ///保存任务完成进度数
  ///[index]=>任务索引
  ///[list]=>进度数列表List[String 今天完成数,String 总计完成数]
  saveScheduleList(int index, List<String> list) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> scheduleList = list;
    sharedPreferences.setStringList("scheduleList_$index", scheduleList);
  }

  ///获取任务数据[index]=>任务索引
  getData(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = sharedPreferences.getStringList("data_$index");
    return data;
  }

  ///获取任务进度数据[index]=>任务索引
  getScheduleList(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> data = sharedPreferences.getStringList("scheduleList_$index");
    return data;
  }

  ///自增任务进度数据[index]=>任务索引
  updateScheduleList(int index) async {
    DataModel().getScheduleList(index).then((list) {
      int i = int.parse(list[0]);
      int j = int.parse(list[1]);
      i++;
      j++;
      List<String> done = [i.toString(), j.toString()];
      DataModel().saveScheduleList(index, done);
    });
  }

  ///判断任务是否完成当天目标[index]=>任务索引
  decisionTaskAnalysisListUpdate(int index) async {
    int count;
    int now;

    ///获取任务当天目标总数
    await getData(index).then((list) {
      count = int.parse(list[1]);
    });

    ///获取当前完成目标数
    await getScheduleList(index).then((list) {
      now = int.parse(list[0]);
    });

    ///当前任务完成数达到当天目标数则自增任务完成数柱形图
    if (now == count) {
      saveTaskAnalysisList();
    }
  }

  ///保存计时任务列表[task]=>添加的任务名
  saveTask(String task) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List taskList = sharedPreferences.getStringList("taskList");
    taskList.add(task);
    sharedPreferences.setStringList("taskList", taskList);
  }

  ///编辑计时任务列表[index]=>任务在列表的索引 [task]=>新任务名
  editTask(int index, String task) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List taskList = sharedPreferences.getStringList("taskList");
    taskList[index] = task;
    sharedPreferences.setStringList("taskList", taskList);
  }

  ///删除计时任务列表项 [index]=>任务项索引
  delTask(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List taskList = sharedPreferences.getStringList("taskList");
    taskList.removeAt(index);
    sharedPreferences.setStringList("taskList", taskList);
  }
}
