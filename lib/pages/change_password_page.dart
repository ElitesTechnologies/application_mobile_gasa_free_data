import 'package:flutter/material.dart';
import 'package:gasa_free_data/controllers/change_password_controller.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../components/j_input.dart';
import '../themes/theme.dart';

class ChangePasswordPage extends StatelessWidget {
  final changePasswordController = Get.put(ChangePasswordController());
  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Changer mot de passe"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JInput(
                name: "Ancien mot de passe",
                passwordInput: true,
                controller: changePasswordController.oldController,
            ),
            const SizedBox(height: 15,),
            JInput(
                name: "Nouveau mot de passe",
                passwordInput: true,
                controller: changePasswordController.passwordController,
            ),
            const SizedBox(height: 15,),
            JInput(
                name: "Confirmer le mot de passe",
                passwordInput: true,
                controller: changePasswordController.confirmController,
            ),
            const SizedBox(height: 30,),
            Container(
              height: 55,
              width: Get.width,
              child: JButton(
                  onPressed: () => changePasswordController.changePassword(context),
                  fg: Colors.white,
                  bg: primaryColor,
                  child: const Text("Valider")
              ),
            ),

          ],
        ),
      ),
    );
  }
}
