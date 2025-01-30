import 'dart:convert';
import 'package:gasa_free_data/utils/base_url.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  // Fonction pour ouvrir une URL
  launchURL(String url) async {
    // Vérifier si l'URL peut être lancée
    if (await canLaunch(url)) {
      // Lancer l'URL
      await launch(url);
    } else {
      // Si l'URL ne peut pas être lancée, afficher un message
      throw 'Impossible de lancer l\'URL: $url';
    }
  }

  Future<void> initiatePayment(String etudiantId, String offreId, String numMomo) async {
    final url = Uri.parse(baseUrl2+'/api/payment?etudiant_id=$etudiantId&offre_id=$offreId&num_momo=$numMomo');

    try {
      final response = await http.post(url);
      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        final paymentUrl = data['payment_url'];

        // Ouvrir la page de paiement dans le navigateur
        if (await canLaunch(paymentUrl)) {
          await launch(paymentUrl);
        } else {
          throw 'Impossible d\'ouvrir l\'URL de paiement';
        }
      } else {
        print('Erreur : ${data['message']}');
      }
    } catch (e) {
      print('Erreur : $e');
    }
  }
}