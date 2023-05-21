import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'language/custom_localizations.dart';
import 'language/main_processing_language.dart';
import 'log/log_driver.dart';
import 'log/main_processing_log.dart';
import 'dart:async';

void main() {
  MainProcessingLog();
  // 2. 异步日志获取
  runZonedGuarded(() => runApp(MyApp()), (error, stack) {
    var log = CustomPrinter.logging(FlutterError);
    // 异步日志处理逻辑
    log.e('Caught error: $error\n$stack');
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var logs = CustomPrinter.logging(MyApp);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "flutter first frame",
      debugShowCheckedModeBanner: false,
      
      // 国际化 - 代理绑定
      localizationsDelegates: [
        // 本地化代理 - android 组件多语言
        GlobalMaterialLocalizations.delegate,
        // 本地化代理 - Widgets 组件多语言
        GlobalWidgetsLocalizations.delegate,
        // 本地化代理 - IOS 组件多语言
        GlobalCupertinoLocalizations.delegate,

        // 本地化代理 - 文本 - 自定义
        // CustomLocalizations.delegate,
        CustomLocalizations.delegate
      ],

      // 国际化 - 支持的语言代码
      supportedLocales:const [
        Locale("en", "US"),
        Locale("zh", "CN"),
        Locale("es", "ES")
      ],

      MainProcessingLanguage().localeResolutionCallback();
      theme: ThemeData(),

      home: ,

    );
  }
}
