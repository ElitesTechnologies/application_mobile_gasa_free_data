import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_input.dart';
import 'package:gasa_free_data/controllers/login_controller.dart';
import 'package:gasa_free_data/pages/check_email_page.dart';
import 'package:gasa_free_data/pages/signup_page.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../themes/theme.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.13,),
                const Center(
                  child: Text("Connexion",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10,),
                const Text("Connectez-vous pour accéder aux offres de forfaits internet.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50,),
                JInput(
                  name: "Email",
                  placeholder: "Email",
                  keyboardType: TextInputType.emailAddress,
                  passwordInput: false,
                  controller: loginController.emailController,
                ),
                const SizedBox(height: 25,),
                JInput(
                  name: "Mot de Passe",
                  passwordInput: true,
                  controller: loginController.passwordController,
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () => Get.to(CheckEmailPage()),
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text("Mot de Passe oublié?",
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  height: 55,
                  width: Get.width,
                  child: JButton(
                      child: const Text("Se connecter"),
                      onPressed: () => loginController.login(context),
                      fg: Colors.white,
                      bg: primaryColor
                  ),
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: () => Get.to(SignupPage()),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text("Vous n'avez pas de compte?",
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text("S'inscrire",
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