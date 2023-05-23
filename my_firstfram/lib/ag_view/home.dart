import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ae_state/menu_drower_controller.dart';
import 'login_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 全局状态管理----
    return MultiProvider(
      providers: [
        // 抽屉菜单状态
        ChangeNotifierProvider(create: (context) => MenuDrowerController()),
        // 其他状态.....
      ],
      child: const Scaffold(
        body: LoginView(),
      ),
    );
  }
}
