import 'package:flutter/material.dart';
import 'package:task/common/style/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextStyle.reusableText16(text: "Home View"),
      ),
    );
  }
}
