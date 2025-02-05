import 'package:flutter/material.dart';
import 'package:gasa_free_data/controllers/add_number_controller.dart';
import 'package:get/get.dart';

import '../components/j_button.dart';
import '../components/j_input.dart';
import '../themes/theme.dart';

class AddPhoneNumberPage extends StatelessWidget {
  final addNumberController = Get.put(AddNumberController());
  AddPhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter un numéro momo"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text("Entrer le numéro",
                style: TextStyle(
                    fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15,),
              JInput(
                name: "Numéro momo",
                keyboardType: TextInputType.number,
                passwordInput: false,
                controller: addNumberController.numberController,
              ),
              const SizedBox(height: 30,),
              Container(
                height: 55,
                width: Get.width,
                child: JButton(
                    onPressed: () => addNumberController.addNumber(context),
                    fg: Colors.white,
                    bg: primaryColor,
                    child: const Text("Ajouter")
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
