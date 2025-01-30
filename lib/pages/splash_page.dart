import 'package:flutter/material.dart';
import 'package:gasa_free_data/themes/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Spacer(),
            Icon(Icons.wifi, color: Colors.white, size: 80,),
            Text("Gasa Free Data",
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

