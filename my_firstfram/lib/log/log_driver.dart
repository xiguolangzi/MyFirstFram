import 'package:logger/logger.dart';
import 'package:date_format/date_format.dart';

class CustomPrinter extends LogPrinter {
  // 1. 传入类名
  String className;
  // 2. 实例化
  CustomPrinter(this.className);

  // 3. 外界调用的静态方法
  static Logger logging(Type className) => Logger(
        // 选择log打印方法
        printer: CustomPrinter(className.toString()),
        // 打印级别控制
        level: Level.info,
        // 过滤器：什么环境下打印日志 -- ProductionFilter 生产环境、DevelopmentFilter 开发环境
        filter: ProductionFilter(),
        // 输出日志到指定目的
        output: LogOutputFile(),
      );

  // 4. 实现抽象方法 -- 参考 PrettyPrinter
  @override
  List<String> log(LogEvent event) {
    // 4.1 日志颜色
    final colors = levelColors[event.level];
    // final emoji = PrettyPrinter.levelEmojis[event.level];
    // 4.2 日志标识
    final emoji = levelEmojis[event.level];
    // 4.3 日志返回信息
    final message = event.message;

    // 4.4 日志时间格式
    final dayTime = DateTime.now();
    final dayTimes = formatDate(
        dayTime, [yyyy, "-", mm, "-", dd, " ", HH, ":", nn, ":", ss]);

    // 4.5 输出的日志格式
    return [
      colors!("$dayTimes  [ className: $className ] [ $emoji ] : $message "),
    ];
  }

  // 5. 自定义 日志颜色
  static final levelColors = {
    Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: AnsiColor.fg(50),
    Level.info: AnsiColor.fg(12),
    Level.warning: AnsiColor.fg(220), //208
    Level.error: AnsiColor.fg(196),
    Level.wtf: AnsiColor.fg(200),
  };

  // 6. 自定义 日志标识
  static final levelEmojis = {
    Level.verbose: 'verbose',
    Level.debug: 'debug',
    Level.info: 'info',
    Level.warning: 'warning',
    Level.error: 'error',
    Level.wtf: 'wtf',
  };
}
