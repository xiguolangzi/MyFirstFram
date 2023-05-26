import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'log_clear.dart';
import 'log_driver.dart';

class MainProcessingLog {
  MainProcessingLog() {
    // 1.清除日志
    DeleteLogFiles(logPath: "logs", saveDays: 3).deleteNotLogFiles();
    // 2.系统日志写入
    FlutterError.onError = (FlutterErrorDetails details) {
      var log = CustomPrinter.logging(FlutterError);
      log.e('Caught error: ${details.exception}\n${details.stack}');
    };
  }
}
