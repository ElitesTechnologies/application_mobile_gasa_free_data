import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/offre_card.dart';
import 'package:gasa_free_data/controllers/offre_controller.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

import '../../components/menu.dart';
import '../../controllers/user_controller.dart';

class Home extends StatelessWidget {
  final OffreController offreController = Get.put(OffreController());
  final userController = Get.put(UserController());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "images/logo.jpeg",
                  height: 80,
                  width: 80,
                ),
              ),
              IconButton(
                  onPressed: () => showMoreMenu(context),
                  icon: Icon(Icons.more_vert, color: primaryColor,)
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15), // Rayon de courbure
              child: Image.asset(
                "images/img.jpeg",
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover, // Ajuste l'image à l'intérieur du conteneur
              ),
            )

          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Les offres de forfaits disponibles",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryColor),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (offreController.listOffres.isEmpty) {
                return const Center(
                    child: Text(
                      "Pas d'offre de forfait disponible",
                      style: TextStyle(fontSize: 16, color: primaryColor),
                    )
                );
              }
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    ...offreController.listOffres
                        .map((offre) => OffreCard(offre: offre))
                        .toList(),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: primaryColor,
      builder: (context) {
        return SafeArea(
            child: SizedBox(
              child:  Menu(),
              height: MediaQuery.of(context).size.height*0.2,
            ));
      },
    );
  }
}
