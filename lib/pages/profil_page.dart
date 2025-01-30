import 'package:flutter/material.dart';
import 'package:gasa_free_data/controllers/user_controller.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

class ProfilPage extends StatelessWidget {
  final userController = Get.put(UserController());
  ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Mon compte"),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_box_rounded, size: 80, color: primaryColor,),
                  const SizedBox(width: 10,),
                  Text('${userController.user.value.name} ${userController.user.value.prenom}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Text("Mes informations",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListTile(
              title: const Text("Nom"),
              subtitle: Text("${userController.user.value.name}"),
              titleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              subtitleTextStyle: const TextStyle(
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
            ListTile(
              title: const Text("Prénom"),
              subtitle: Text("${userController.user.value.prenom}"),
              titleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              subtitleTextStyle: const TextStyle(
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
            ListTile(
              title: const Text("Matricule"),
              subtitle: Text("${userController.user.value.matricule}"),
              titleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              subtitleTextStyle: const TextStyle(
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
            ListTile(
              title: const Text("Numéro de Téléphone"),
              subtitle: Text("${userController.user.value.numTel}"),
              titleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              subtitleTextStyle: const TextStyle(
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
            ListTile(
              title: const Text("Numéro Momo 1"),
              subtitle: Text("${userController.user.value.numMomo}"),
              titleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              subtitleTextStyle: const TextStyle(
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
            ListTile(
              title: const Text("Numéro de Momo 2"),
              subtitle: Text("${userController.user.value.numMomo2}"),
              titleTextStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              subtitleTextStyle: const TextStyle(
                  fontSize: 19,
                  color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
