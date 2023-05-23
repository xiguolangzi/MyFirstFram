import 'package:flutter/material.dart';
import 'package:my_firstfram/ab_log/log_driver.dart';

class SelectLanguage {
  static Locale? checkLocale(
      Locale? locale, Iterable<Locale> supportedLocales) {
    var logs = CustomPrinter.logging(SelectLanguage);

    logs.i("系统本地语言 $locale");
    logs.i("语言代码 ${locale!.languageCode}");
    logs.i("国家代码 ${locale.countryCode}");

    // 根据系统设备语言设置选择合适的本地化资源
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        // 3.2 如果有匹配的,则返回设置的语言
        logs.i("选择的语言是 -- ${supportedLocale.languageCode}");
        return supportedLocale;
      }
    }
    // 3.3  如果没有匹配,则返回设置的语言的第一种语言
    logs.i("选择的语言是 -- ${supportedLocales.first.languageCode}");
    return supportedLocales.first;
  }
}
