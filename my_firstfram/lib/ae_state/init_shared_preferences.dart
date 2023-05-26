import 'package:shared_preferences/shared_preferences.dart';

class InitSharedPreferences {
  void initDatas() async {
    try {
      // 获取保存实例
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String myTheme = (preferences.getString("theme") ?? "myTheme");
      await preferences.setString("theme", myTheme);
    } catch (E) {
      print(E);
    }
  }

  static getData() {
    try {} catch (e) {}
  }

  static setData() {}
}
