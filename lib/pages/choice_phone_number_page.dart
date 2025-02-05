import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_select.dart';
import 'package:gasa_free_data/pages/payement_page.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../controllers/payment_controller.dart';
import '../controllers/user_controller.dart';
import '../themes/theme.dart';

class ChoicePhoneNumberPage extends StatelessWidget {
  final userController = Get.put(UserController());
  final paymentController = Get.put(PayementController());
  final int id;
  ChoicePhoneNumberPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paiement de forfait"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Choisissez votre numéro MoMo",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            JSelect(
              label: "Numéro MoMo",
              options: [
                if (userController.user.value.numMomo != null &&
                    userController.user.value.numMomo!.isNotEmpty)
                  DropdownMenuItem(
                    value: userController.user.value.numMomo,
                    child: Text(userController.user.value.numMomo!),
                  ),
                if (userController.user.value.numMomo2 != null &&
                    userController.user.value.numMomo2!.isNotEmpty)
                  DropdownMenuItem(
                    value: userController.user.value.numMomo2,
                    child: Text(userController.user.value.numMomo2!),
                  ),
              ],
              controller: paymentController.numeroController,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 55,
              width: Get.width,
              child: JButton(
                onPressed: () {
                  paymentController.idOffre = id;
                  paymentController.verify(context);
                },
                fg: Colors.white,
                bg: primaryColor,
                child: const Text("Valider"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

