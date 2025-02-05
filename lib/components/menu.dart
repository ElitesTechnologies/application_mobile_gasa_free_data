import 'package:flutter/material.dart';
import 'package:gasa_free_data/pages/add_phone_number_page.dart';
import 'package:gasa_free_data/pages/change_password_page.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 5),
        ListTile(
          leading: const Icon(Icons.phone_android, color: Colors.white),
          title: const Text(
            "Ajouter un numéro momo",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onTap: () {
            Get.back();
            Get.to(AddPhoneNumberPage());
          },
        ),
        const SizedBox(height: 5),
        ListTile(
          leading: const Icon(Icons.lock, color: Colors.white),
          title: const Text(
            "Changer mot de passe",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onTap: () {
            Get.back();
            Get.to(ChangePasswordPage());
          },
        ),
      ],
    );
  }
}
