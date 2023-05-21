import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../log/log_driver.dart';
import 'custom_localizations.dart';

class MainProcessingLanguage {
  var logs = CustomPrinter.logging(MainProcessingLanguage);

  MainProcessingLanguage() {
    localeResolutionCallback(locale);
  }

  // 1.国际化 - 代理绑定
  Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    // 本地化代理 - android 组件多语言
    GlobalMaterialLocalizations.delegate,
    // 本地化代理 - Widgets 组件多语言
    GlobalWidgetsLocalizations.delegate,
    // 本地化代理 - IOS 组件多语言
    GlobalCupertinoLocalizations.delegate,

    // 本地化代理 - 文本 - 自定义
    CustomLocalizations.delegate
  ];

  // 2.国际化 - 支持的语言代码
  Iterable<Locale> supportedLocales = const <Locale>[
    Locale("en", "US"),
    Locale("zh", "CN"),
    Locale("es", "ES")
  ];

  // 3.国际化 - 语言环境检查
  Locale localeResolutionCallback(locale) {
    // 7.1 打印当前语言环境 locale
    logs.i("deviceLocale -- $locale");
    logs.i("languageCode -- ${locale!.languageCode}");
    logs.i("language -- ${locale.countryCode}");

    // 7.2 检查设置的语言环境supportedLocales 是否匹配 当前的语言环境locale
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        // 7.3 如果有匹配的,则返回设置的语言
        logs.i("选择的语言是 -- ${supportedLocale.languageCode}");
        return supportedLocale;
      }
    }
    // 7.4 如果没有匹配,则返回设置的语言的第一种语言
    logs.i("选择的语言是 -- ${supportedLocales.first.languageCode}");
    return supportedLocales.first;
  }
}
