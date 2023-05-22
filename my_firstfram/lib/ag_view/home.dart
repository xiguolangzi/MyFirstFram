import 'package:flutter/material.dart';
import 'login_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(),
    );
  }
}
