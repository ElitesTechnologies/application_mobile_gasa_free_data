import 'package:flutter/material.dart';
import 'package:gasa_free_data/controllers/register_controller.dart';
import 'package:gasa_free_data/pages/create_password_page.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../components/j_input.dart';
import '../themes/theme.dart';

class SignupPage extends StatelessWidget {
  final registerController = Get.put(RegisterController());
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10,),
                const Center(
                  child: Text("Inscription",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Inscrivez-vous pour accéder aux meilleures offres de forfaits.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30,),
                JInput(
                    name: "Numéro matricule",
                    passwordInput: false,
                    controller: registerController.matriculeController,
                ),
                const SizedBox(height: 15,),
                JInput(
                    name: "Nom",
                    passwordInput: false,
                    controller: registerController.nomController,
                ),
                const SizedBox(height: 15,),
                JInput(
                    name: "Prénom",
                    passwordInput: false,
                    controller: registerController.prenomController,
                ),
                const SizedBox(height: 15,),
                JInput(
                    name: "Email",
                    keyboardType: TextInputType.emailAddress,
                    passwordInput: false,
                    controller: registerController.emailController,
                ),
                const SizedBox(height: 15,),
                JInput(
                    name: "Numéro principale",
                    keyboardType: TextInputType.number,
                    passwordInput: false,
                    controller: registerController.numeroController,

                ),
                const SizedBox(height: 15,),
                JInput(
                    name: "Numéro Momo",
                    keyboardType: TextInputType.number,
                    passwordInput: false,
                    controller: registerController.momoController,
                ),

                const SizedBox(height: 30,),
                Container(
                  height: 55,
                  width: Get.width,
                  child: JButton(
                      child: const Text("Continuer"),
                      onPressed: () => Get.to(CreatePasswordPage()),
                      fg: Colors.white,
                      bg: primaryColor
                  ),
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text("Avez-vous un compte?",
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text("Se connecter",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer()
                    ],
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
