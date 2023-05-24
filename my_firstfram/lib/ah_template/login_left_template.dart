import 'package:flutter/material.dart';

import '../ai_widgets/login_swiper.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        LoginSwiper(),
        const SizedBox(height: 20),
      ],
    );
  }
}
