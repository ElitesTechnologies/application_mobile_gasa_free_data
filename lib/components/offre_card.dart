import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_button.dart';
import 'package:gasa_free_data/models/offres.dart';
import 'package:gasa_free_data/pages/choice_phone_number_page.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

class OffreCard extends StatelessWidget {
  final Offres offre;
  const OffreCard({super.key, required this.offre});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 15,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                      )
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${offre.quantite} GO",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Validité: 30jrs",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text("${offre.prix} FCFA",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15,),
                  child: JButton(
                      child: Text("Acheter"),
                      onPressed: () => Get.to(ChoicePhoneNumberPage(id: offre.id!,)),
                      fg: Colors.white,
                      bg: primaryColor
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}