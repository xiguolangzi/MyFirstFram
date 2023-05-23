import 'package:flutter/material.dart';
import '../ac_language/custom_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(CustomLocalizations.setLanguage(context, "首页")),
    ]);
  }
}
