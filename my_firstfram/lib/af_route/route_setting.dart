import 'package:flutter/material.dart';
import 'package:my_firstfram/ab_log/log_driver.dart';
import '../ag_view/home.dart';
import '../ag_view/login_view.dart';
import '../ag_view/shop_view.dart';
import '../ag_view/unknown_view.dart';

class RouteSetting {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var logs = CustomPrinter.logging(RouteSetting);

    String? routeName = settings.name;
    logs.i("routeName = $routeName");

    // 根据路由名称返回对应的页面组件
    switch (routeName) {
      case '/':
        logs.i("调用 Home()");
        return MaterialPageRoute(builder: (_) => const Home());
      case '/Login':
        logs.i("调用 LoginView()");
        return MaterialPageRoute(builder: (_) => const LoginView());

      default:
        // 解析路由
        Uri uri = Uri.parse(settings.name.toString());
        logs.i("路由 -- $uri");
        List ruoteDetail = uri.pathSegments;
        logs.i("路由解析 -- $ruoteDetail");

        // 传参路由处理
        if (ruoteDetail.length == 2 && ruoteDetail.first == "product") {
          var id = ruoteDetail[2];
          logs.i("调用 LoginView() ,且 传参ID = $id");
          return MaterialPageRoute(builder: (_) => ShopView(id: id));
        }
        return MaterialPageRoute(builder: (context) => const UnknownView());
    }
  }

  // 添加其他需要的方法...
}
