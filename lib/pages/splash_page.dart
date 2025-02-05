import 'package:flutter/material.dart';
import 'package:gasa_free_data/themes/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Image.asset(
          "images/logo2.jpeg",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}

