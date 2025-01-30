import 'package:flutter/material.dart';
import 'package:gasa_free_data/controllers/init_password_controller.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../components/j_input.dart';
import '../themes/theme.dart';

class InitPasswordPage extends StatelessWidget {
  final initPasswordController = Get.put(InitPasswordController());
  InitPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                const Text("Réinitialiser le mot de passe",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10,),
                const Text("Veuillez définir un nouveau mot de passe.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30,),
                JInput(
                    name: "Nouveau mot de passe",
                    passwordInput: true,
                    controller: initPasswordController.passwordController,
                ),
                const SizedBox(height: 15,),
                JInput(
                    name: "Confirmer le mot de passe",
                    passwordInput: true,
                    controller: initPasswordController.confirmController,
                ),
                const SizedBox(height: 30,),
                Container(
                  height: 55,
                  width: Get.width,
                  child: JButton(
                      onPressed: () => initPasswordController.initPassword(context),
                      fg: Colors.white,
                      bg: primaryColor,
                      child: const Text("Valider")
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
