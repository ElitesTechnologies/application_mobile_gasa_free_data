import 'package:flutter/material.dart';
import 'package:gasa_free_data/pages/welcome_page.dart';

import '../pages/login_page.dart';
import '../pages/splash_page.dart';
import 'shared_prefs.dart';

class Wrapper extends StatelessWidget {

  bool isFirst = false;

  Future<bool> checkFirstUse() async {
    await Future.delayed(const Duration(seconds: 3));
    await SharedPrefs().removeUser();
    var first = await SharedPrefs().getFirst();
    if(isFirst == null){
      isFirst = true;
    }
    return isFirst;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: checkFirstUse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashPage();
          } else if (snapshot.hasError || !snapshot.data!) {
            return LoginPage();
          } else {
            return WelcomePage();
          }
        },
      ),
    );
  }
}