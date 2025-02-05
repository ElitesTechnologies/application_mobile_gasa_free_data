import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_button.dart';
import 'package:gasa_free_data/controllers/user_controller.dart';
import 'package:gasa_free_data/pages/login_page.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

class Profil extends StatelessWidget {
  final userController = Get.put(UserController());
  Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipPath(
                        clipper: Clipper(),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: primaryColor,
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 70),
                          Center(
                            child: Text(
                              "${userController.user.value.name} ${userController.user.value.prenom}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 55),
                          Center(
                              child: const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.account_circle_rounded, size: 100, color: primaryColor,),
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                    child: Text("Mes informations",
                      style: TextStyle(
                        fontSize: 22
                      ),
                    ),
                  ),
                  buildInfoTile("Matricule", "${userController.user.value.matricule}", Icons.badge),
                  buildInfoTile("Numéro de Téléphone", "${userController.user.value.numTel}", Icons.phone),
                  buildInfoTile("Numéro Momo 1", "${userController.user.value.numMomo}", Icons.account_balance_wallet),
                  buildInfoTile("Numéro Momo 2", userController.user.value.numMomo2==''?"Pas de numéro":"${userController.user.value.numMomo2}", Icons.payment),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 70,
            child: JButton(
              child: const Text("Déconnexion"),
              onPressed: () {
                Get.offAll(LoginPage());
              },
              fg: Colors.white,
              bg: primaryColor,
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }

  Widget buildInfoTile(String title, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: primaryColor,),
      title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(fontSize: 19)),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height + 50, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
