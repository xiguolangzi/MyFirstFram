import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:my_firstfram/ad_theme/custom_theme.dart';
import 'package:my_firstfram/af_route/route_setting.dart';
import 'ac_language/language_setting.dart';
import 'ab_log/log_driver.dart';
import 'ab_log/main_processing_log.dart';
import 'dart:async';
import 'ac_language/select_language.dart';
import 'ae_state/shared_preferences_manager.dart';

void main() {
  SharedPreferencesManager.init();
  MainProcessingLog();
  // 异步日志获取
  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    var log = CustomPrinter.logging(FlutterError);
    // 日志处理逻辑
    log.e('Caught error: $error\n$stack');
  });

  // windows 窗体设置
  doWhenWindowReady(() {
    // 初始化窗口属性
    var initialSize = const Size(600, 450);
    // appWindow.size = initialSize;
    // 设置最小屏幕尺寸
    appWindow.minSize = initialSize;
    // appWindow.maxSize = initialSize;
    appWindow.show();
    // 托盘提示名字
    appWindow.title = "good";
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var logs = CustomPrinter.logging(_MyAppState);
  late String kTheme;
  late ThemeData vTheme;

  @override
  Widget build(BuildContext context) {
    kTheme = SharedPreferencesManager().getString("theme") ?? "darkTheme";
    if (kTheme == "darkTheme") {
      vTheme = darkTheme;
    } else {
      vTheme = myTheme;
    }

    return MaterialApp(
      // 1. 基础配置 ------
      title: "flutter first frame",
      debugShowCheckedModeBanner: false,

      // 2. 国际化 - 语言环境 ------
      localizationsDelegates: localizationsDelegate, // 2.1 国际化 - 代理绑定
      supportedLocales: supportedLocale, // 2.2 国际化 - 支持的语言环境
      localeResolutionCallback: SelectLanguage.checkLocale, // 2.3 国际化 - 选择语言环境

      // 3. 主题 ------
      theme: vTheme,

      // 4. 路由 ------
      onGenerateRoute: RouteSetting.generateRoute,
    );
  }
}
