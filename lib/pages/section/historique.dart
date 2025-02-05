import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/payment_card.dart';
import 'package:gasa_free_data/controllers/story_payment_controller.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

import '../../components/loader.dart';

class Historique extends StatelessWidget {
  final storyPaymentController = Get.put(StoryPaymentController());
  Historique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historique de paiement"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Expanded(
        child: Obx((){
          if (storyPaymentController.listPayments.isEmpty) {
            return const Center(
                child: Text(
                  "Pas de paiement éfféctué",
                  style: TextStyle(fontSize: 16, color: primaryColor),
                )
            );
          }
          return ListView(
            padding: const EdgeInsets.all(10),
            children: [
              ...storyPaymentController.listPayments.reversed.map((paiement) => PaymentCard(paiement: paiement),)
            ],
          );
        }),
      ),
    );
  }
}
