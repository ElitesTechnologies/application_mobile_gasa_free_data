import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../components/j_input.dart';
import '../controllers/register_controller.dart';
import '../themes/theme.dart';

class CreatePasswordPage extends StatelessWidget {
  final registerController = Get.put(RegisterController());
  CreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Définir un mot de passe",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            const Text("Veuillez définir un mot de passe pour l'authentification.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30,),
            JInput(
                name: "Mot de passe",
                passwordInput: true,
                controller: registerController.passwordController,
            ),
            const SizedBox(height: 15,),
            JInput(
                name: "Comfirmer le mot de passe",
                passwordInput: true,
                controller: registerController.confirmController,
            ),
            const SizedBox(height: 30,),
            Container(
              height: 55,
              width: Get.width,
              child: JButton(
                  onPressed: () => registerController.register(context),
                  fg: Colors.white,
                  bg: primaryColor,
                  child: const Text("S'inscrire")
              ),
            ),
          ],
        ),
      ),
    );
  }
}
