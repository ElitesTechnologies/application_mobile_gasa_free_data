import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_button.dart';
import 'package:gasa_free_data/pages/login_page.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:gasa_free_data/utils/shared_prefs.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Spacer(),
              Image.asset("images/welcome.png"),
              Spacer(),
              const Text("Profiter de l'internet au maximun et à moindre coût",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),
              const Text("Rechargez vos forfaits internet en quelques clics. Simple, rapide et fait pour vous !",
                style: TextStyle(
                    fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50,),
              Spacer(),
              Container(
                height: 55,
                width: double.infinity,
                child: JButton(
                    child: const Text("Commencer"),
                    onPressed: () async {
                      await SharedPrefs().storeFirst('oui');
                      Get.to(LoginPage());
                    },
                    fg: Colors.white,
                    bg: primaryColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
