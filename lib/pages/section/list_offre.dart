import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/offre_card.dart';
import 'package:gasa_free_data/controllers/offre_controller.dart';
import 'package:get/get.dart';

import 'package:gasa_free_data/themes/theme.dart';

import '../../controllers/user_controller.dart';

class ListOffre extends StatelessWidget {
  final OffreController offreController = Get.put(OffreController());
  final userController = Get.put(UserController());
  ListOffre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                  child: Text("Heureux de vous revoir !",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Text("Retouver ici les meilleurs offres de forfait internet !!!",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Les offres de forfaits disponibles",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Expanded(
          child: Obx(() {
            if (offreController.listOffres.isEmpty) {
              return const Center(
                  child: Text(
                    "Pas d'offre de forfait disponible",
                    style: TextStyle(fontSize: 16),
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
    );
  }
}
