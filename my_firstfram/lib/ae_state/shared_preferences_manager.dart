import 'package:my_firstfram/ab_log/log_driver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  var logs = CustomPrinter.logging(SharedPreferencesManager);
  // 定义私有
  static late SharedPreferences _preferences;

  // 初始main执行
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // 设置 字符串
  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
    logs.i("缓存数据库 设置 - $key : $value");
  }

  // 获取 字符串 默认"null" 调用时需要给出空值对应的默认值
  String? getString(String key) {
    logs.i("缓存数据库 获取 $key 的值");
    return _preferences.getString(key);
  }

  // 设置 布尔值
  Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
    logs.i("缓存数据库 设置 - $key : $value");
  }

  // 获取 布尔值 - 默认 false
  bool getBool(String key) {
    logs.i("缓存数据库 获取 $key 的值");
    return _preferences.getBool(key) ?? false;
  }

  // 设置 整形
  Future<void> setInt(String key, int value) async {
    await _preferences.setInt(key, value);
    logs.i("缓存数据库 设置 - $key : $value");
  }

  // 获取 整形 - 默认 0
  int getInt(String key) {
    logs.i("缓存数据库 获取 $key 的值");
    return _preferences.getInt(key) ?? 0;
  }

  // 设置 浮点型
  Future<void> setDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
    logs.i("缓存数据库 设置 - $key : $value");
  }

  // 获取 浮点型 - 默认 0.0
  double getDouble(String key) {
    logs.i("缓存数据库 获取 $key 的值");
    return _preferences.getDouble(key) ?? 0.0;
  }

  // 设置字符列表
  Future<void> setStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
    logs.i("缓存数据库 设置 - $key : $value");
  }

  // 获取字符列表 - 默认空列表 []
  List<String> getStringList(String key) {
    logs.i("缓存数据库 获取 $key 的值");
    return _preferences.getStringList(key) ?? [];
  }

  // 移除指定键值对
  Future<void> remove(String key) async {
    await _preferences.remove(key);
    logs.i("缓存数据库 清除 - $key ");
  }

  // 清除所有数据
  Future<void> clear() async {
    await _preferences.clear();
    logs.i("缓存数据库 清空所有数据");
  }
}
