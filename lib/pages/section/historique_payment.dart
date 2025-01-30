import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/payment_card.dart';
import 'package:gasa_free_data/controllers/story_payment_controller.dart';
import 'package:get/get.dart';

import '../../components/loader.dart';

class HistoriquePayment extends StatelessWidget {
  final storyPaymentController = Get.put(StoryPaymentController());
  HistoriquePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx((){
        if (storyPaymentController.listPayments.isEmpty) {
          return const Center(
              child: Text(
                "Pas de paiement éffectué",
                style: TextStyle(fontSize: 16),
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
    );
  }
}
