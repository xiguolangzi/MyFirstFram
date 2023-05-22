import 'package:flutter/material.dart';
import 'ac_language/language_setting.dart';
import 'ab_log/log_driver.dart';
import 'ab_log/main_processing_log.dart';
import 'dart:async';

import 'af_view/home.dart';

void main() {
  MainProcessingLog();
  // 异步日志获取
  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    var log = CustomPrinter.logging(FlutterError);
    // 日志处理逻辑
    log.e('Caught error: $error\n$stack');
  });
}

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   var logs = CustomPrinter.logging(MyApp);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // 1. 基础配置 ---------------------
//       title: "flutter first frame",
//       debugShowCheckedModeBanner: false,

//       // 2. 国际化 - 多语言处理 ------------------------
//       localizationsDelegates: localizationsDelegate, // 国际化 - 代理绑定
//       supportedLocales: supportedLocale, // 国际化 - 支持的语言代码
//       // 3. 语言环境检查
//       localeResolutionCallback: (locale, supportedLocales) {
//         logs.i("deviceLocale -- $locale");
//         logs.i("languageCode -- ${locale!.languageCode}");
//         logs.i("language -- ${locale.countryCode}");
//         // 3.1 检查设置的语言环境supportedLocales 是否匹配 当前的语言环境locale
//         for (var supportedLocale in supportedLocales) {
//           if (supportedLocale.languageCode == locale.languageCode &&
//               supportedLocale.countryCode == locale.countryCode) {
//             // 3.2 如果有匹配的,则返回设置的语言
//             return supportedLocale;
//           }
//         }
//         // 3.3  如果没有匹配,则返回设置的语言的第一种语言
//         return supportedLocales.first;
//       },

//       theme: ThemeData(
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             foregroundColor: Colors.pink,
//             textStyle: const TextStyle(
//               fontSize: 20,
//             ),
//           ),
//         ),
//       ),

//       home: const Home(),
//     );
//   }
// }

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
      // 1. 基础配置 ---------------------
      title: "flutter first frame",
      debugShowCheckedModeBanner: false,

      // 2. 国际化 - 多语言处理 ------------------------
      localizationsDelegates: localizationsDelegate, // 国际化 - 代理绑定
      supportedLocales: supportedLocale, // 国际化 - 支持的语言代码
      // 3. 语言环境检查
      localeResolutionCallback: (locale, supportedLocales) {
        logs.i("deviceLocale -- $locale");
        logs.i("languageCode -- ${locale!.languageCode}");
        logs.i("language -- ${locale.countryCode}");
        // 3.1 检查设置的语言环境supportedLocales 是否匹配 当前的语言环境locale
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            // 3.2 如果有匹配的,则返回设置的语言
            return supportedLocale;
          }
        }
        // 3.3  如果没有匹配,则返回设置的语言的第一种语言
        return supportedLocales.first;
      },

      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.pink,
            textStyle: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),

      home: const Home(),
    );
  }
}
