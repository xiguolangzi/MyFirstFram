import 'package:flutter/cupertino.dart';
import 'package:my_firstfram/ac_language/custom_localizations.dart';

class CustomLocaliztionsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  // 1.抽象方法 - 支持的语言
  @override
  bool isSupported(Locale locale) {
    return ["en", "zh", "es"].contains(locale.languageCode);
  }

  // 2.抽象方法 - 加载数据
  @override
  Future<CustomLocalizations> load(Locale locale) async {
    // 实例化
    CustomLocalizations localizations = CustomLocalizations(locale);
    // CustomLocalizations 异步加载
    await localizations.loadJson();
    // 返回数据
    return localizations;
  }

  // 3.抽象方法 - 更新加载
  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomLocalizations> old) {
    // 不希望频繁的更新 false
    return false;
  }
}
