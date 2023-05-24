import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import '../ah_template/login_left_template.dart';
import '../ai_widgets/login_images.dart';
import '../ai_widgets/login_swiper.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int currentIndex = 0;
  final List<String> images = imageUrls;

  @override
  Widget build(BuildContext context) {
    // 控制窗口
    DesktopWindow.setFullScreen(false);
    DesktopWindow.setWindowSize(const Size(750, 550));

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: LoginTemplate(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
