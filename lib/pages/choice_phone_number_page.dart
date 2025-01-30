import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_select.dart';
import 'package:gasa_free_data/controllers/payment_controller.dart';
import 'package:gasa_free_data/utils/base_url.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../controllers/user_controller.dart';
import '../themes/theme.dart';

class ChoicePhoneNumberPage extends StatelessWidget {
  final paymentController = Get.put(PaymentController());
  final userController = Get.put(UserController());
  ChoicePhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      backgroundColor: bgColor,
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
                DropdownMenuItem(
                  value: '${userController.user.value.numMomo}',
                  child: Text('${userController.user.value.numMomo}'),
                ),
              ],
              controller: phoneNumberController,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 55,
              width: Get.width,
              child: JButton(
                onPressed: () => paymentController.initiatePayment('1','1','440000001'),
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
