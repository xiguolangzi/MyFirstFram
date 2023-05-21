// 4.日志文件输出
import 'dart:io';
import 'package:date_format/date_format.dart';
import 'package:logger/logger.dart';

class LogOutputFile extends LogOutput {
  final String _logPath = "logs";

  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      // 控制台打印
      print(line);
      // 文件写入 --- 待开发
      LogOutText(line, _logPath);
    }
  }
}

class LogOutText {
  // var log = MyselfPrinter.logger(LogOutText);
  final String logPath;
  String logInformation;

  LogOutText(this.logInformation, this.logPath) {
    appendTextToFile();
  }

  final dayTimes = formatDate(
    DateTime.now(),
    [
      yyyy,
      "-",
      mm,
      "-",
      dd,
    ],
  );
  //判断文件是否存在
  // bool isFileExist(String filePath) {
  //   File file = File(filePath);
  //   return file.existsSync();
  // }

  // 创建日志文件
  Future<File> creatLogFiles() async {
    // 检查日志路径
    Directory directory = Directory(logPath);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    // 创建日志文件
    final filePath = "$logPath/$dayTimes.log";
    return File(filePath);
  }

  // 文件追加写入，如果没有文件 新建后追加信息
  Future<void> appendTextToFile() async {
    // final filePath = "$path/$dayTimes.text";
    File file = await creatLogFiles();
    // 删除掉文本中的终端控制码
    RegExp exp = RegExp(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]');
    logInformation = logInformation.replaceAll(exp, '');

    file.writeAsStringSync('$logInformation;\n', mode: FileMode.append);
  }
}
