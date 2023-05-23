import 'package:flutter/material.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Text("shop界面 - id = $id");
  }
}
