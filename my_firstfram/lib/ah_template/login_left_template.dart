import 'package:flutter/material.dart';

import '../ai_widgets/login_swiper.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: Text("预留")),
        Expanded(
          flex: 3,
          child: LoginSwiper(),
        ),
        Expanded(child: Text("预留")),
      ],
    );
  }
}
