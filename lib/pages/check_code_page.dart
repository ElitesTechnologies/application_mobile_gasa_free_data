import 'package:flutter/material.dart';
import 'package:gasa_free_data/controllers/init_password_controller.dart';
import 'package:gasa_free_data/pages/init_password_page.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../components/j_input.dart';
import '../themes/theme.dart';

class CheckCodePage extends StatelessWidget {
  final initPasswordController = Get.put(InitPasswordController());
  CheckCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text("Vérification de l'email",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10,),
              const Text("Veuillez entrer le code envoyé sur votre email.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30,),
              JInput(
                name: "Code",
                keyboardType: TextInputType.number,
                passwordInput: false,
                controller: initPasswordController.codeController,
              ),
              const SizedBox(height: 30,),
              Container(
                height: 55,
                width: Get.width,
                child: JButton(
                    onPressed: () {
                      initPasswordController.verifyCode(context);
                    },
                    fg: Colors.white,
                    bg: primaryColor,
                    child: const Text("Valider")
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
