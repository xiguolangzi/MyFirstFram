import 'package:flutter/material.dart';
import 'package:my_firstfram/ad_theme/custom_theme.dart';
import 'package:my_firstfram/af_route/route_setting.dart';
import 'ac_language/language_setting.dart';
import 'ab_log/log_driver.dart';
import 'ab_log/main_processing_log.dart';
import 'dart:async';
import 'ac_language/select_language.dart';
import 'ag_view/unknown_view.dart';

void main() {
  MainProcessingLog();
  // 异步日志获取
  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    var log = CustomPrinter.logging(FlutterError);
    // 日志处理逻辑
    log.e('Caught error: $error\n$stack');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var logs = CustomPrinter.logging(_MyAppState);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. 基础配置 ------
      title: "flutter first frame",
      debugShowCheckedModeBanner: false,

      // 2. 国际化 - 语言环境 ------
      localizationsDelegates: localizationsDelegate, // 2.1 国际化 - 代理绑定
      supportedLocales: supportedLocale, // 2.2 国际化 - 支持的语言环境
      localeResolutionCallback: SelectLanguage.checkLocale, // 2.3 国际化 - 选择语言环境

      // 3. 主题 ------
      theme: myTheme,

      // 4. 路由 ------
      onGenerateRoute: RouteSetting.generateRoute,
    );
  }
}
