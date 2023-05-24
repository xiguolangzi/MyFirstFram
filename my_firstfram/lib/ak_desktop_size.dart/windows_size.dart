import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

class WindowsSize {
  static toggleWindowSize() async {
    if (await DesktopWindow.getFullScreen()) {
      await DesktopWindow.setFullScreen(false);
      await DesktopWindow.setWindowSize(const Size(800, 600));
    } else {
      await DesktopWindow.setFullScreen(true);
    }
  }
}
