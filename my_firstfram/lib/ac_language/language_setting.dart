import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'custom_localizations.dart';

// 1.国际化 - 代理绑定
Iterable<LocalizationsDelegate<dynamic>> localizationsDelegate = [
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
Iterable<Locale> supportedLocale = const <Locale>[
  Locale("en", "US"),
  Locale("zh", "CN"),
  Locale("es", "ES")
];
