import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'custom_localizations_delegate.dart';

class CustomLocalizations {
  Locale locale;
  CustomLocalizations(this.locale);

  late Map<String, String> _localiztedValue;

  // 3.1 给 _localiztedValue 异步加载赋值
  Future<bool> loadJson() async {
    // 3.1.1 rootBundle 根目录资源包的加载
    String jsonString = await rootBundle.loadString(
        "lib/ac_language/language_pages/${locale.languageCode}.json");
    // 3.1.2 json 解析
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    // 3.1.3 解析后的 json 赋值 - 通过.map((key, value){ return MapEntry(key,value)}) 赋值
    _localiztedValue = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    // 3.1.4 返回bool类型
    return true;
  }

  // 4. 声明翻译方法
  String? t(String key) {
    // _localiztedValue["zh"]["首页"]
    // return _localiztedValue[locale.languageCode]![key];
    return _localiztedValue[key];
  }

  // 7. 封装调用
  static setLanguage(context, key) {
    return Localizations.of(context, CustomLocalizations).t(key);
  }

  // 6. 声明 自定义代理
  static CustomLocaliztionsDelegate delegate = CustomLocaliztionsDelegate();
}
