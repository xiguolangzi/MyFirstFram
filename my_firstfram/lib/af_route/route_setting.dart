import 'package:flutter/material.dart';

import '../ag_view/login_view.dart';

class RouteSetting {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // 获取路由名称
    final String? routeName = settings.name;

    // 根据路由名称返回对应的页面组件
    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/home':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        // 处理未定义的路由
        return MaterialPageRoute(builder: (_) => const LoginView());
    }
  }

  // 添加其他需要的方法...
}
