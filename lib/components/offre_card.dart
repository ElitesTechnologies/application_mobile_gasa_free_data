import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasa_free_data/models/offres.dart';
import 'package:gasa_free_data/pages/choice_phone_number_page.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

class OffreCard extends StatelessWidget {
  final Offres offre;
  const OffreCard({super.key, required this.offre});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ChoicePhoneNumberPage()),
      child: Container(
        width: Get.width * 0.5,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: Color(0xFFFFC2A4),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                height: 80,
                child: RotatedBox(
                  quarterTurns: 3, // 1 = 90° (rotation en colonne)
                  child: Center(
                    child: Text(
                      "${offre.quantite} Go",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('FCFA ${offre.prix}',
                      style: const TextStyle(
                          fontSize: 24,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text('Valididé 30 Jours',
                      style: TextStyle(
                          fontSize: 18,
                          color: secondaryColor,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ]
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}