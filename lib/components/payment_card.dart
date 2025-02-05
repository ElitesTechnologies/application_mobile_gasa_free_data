import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasa_free_data/models/payments.dart';
import 'package:gasa_free_data/themes/theme.dart';

class PaymentCard extends StatelessWidget {
  final Payments paiement;
  const PaymentCard({super.key, required this.paiement});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Montant: ${paiement.montant} FCFA",
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 15,),
              Text('${paiement.date}',
                style: const TextStyle(
                    fontSize: 16
                ),
              )
            ],
          ),
          Container(
            height: double.infinity,
            width: 3,
            color: primaryColor,
          ),
          Text("${paiement.status}",
            style: const TextStyle(
              fontSize: 16,
              //color: paiement.statut == 'Succès'?Colors.green:Colors.red
            ),
          )
        ],
      ),
    );
  }
}
