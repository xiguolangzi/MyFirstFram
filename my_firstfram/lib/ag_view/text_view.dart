import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';

class TextView extends StatelessWidget {
  const TextView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Window Management Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _toggleWindowSize();
            },
            child: Text('Toggle Window Size'),
          ),
        ),
      ),
    );
  }

  void _toggleWindowSize() async {
    if (await DesktopWindow.getFullScreen()) {
      await DesktopWindow.setFullScreen(false);
      await DesktopWindow.setWindowSize(Size(800, 600));
    } else {
      await DesktopWindow.setFullScreen(true);
    }
  }
}
