import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomWindows extends StatelessWidget {
  CustomWindows({super.key, required this.child, required this.titalBarColor});
  Widget child;
  Color titalBarColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // windows窗口边框
        child: WindowBorder(
          width: 0.2,
          color: titalBarColor,
          child: Column(
            children: [
              // winodws 标题栏
              WindowTitleBarBox(
                child: Row(
                  children: [
                    // 空白区域 可以 鼠标拖动
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: titalBarColor),
                        child: MoveWindow(),
                      ),
                    ),
                    // 标题栏 图标
                    WindowButtons(titalBarColor: titalBarColor),
                  ],
                ),
              ),
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 自定义图标颜色
var buttonColors = WindowButtonColors(
  iconNormal: const Color(0xFF805306),
  mouseOver: const Color(0xFFF6A00C),
  mouseDown: const Color(0xFF805306),
  iconMouseOver: const Color(0xFF805306),
  iconMouseDown: const Color(0xFFFFD500),
);

// ignore: must_be_immutable
class WindowButtons extends StatelessWidget {
  WindowButtons({super.key, required this.titalBarColor});
  Color titalBarColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: titalBarColor,
      ),
      child: Row(
        children: [
          // 可以选择自定义的图片颜色
          // MinimizeWindowButton(),
          // MaximizeWindowButton(),
          CloseWindowButton(),
        ],
      ),
    );
  }
}
