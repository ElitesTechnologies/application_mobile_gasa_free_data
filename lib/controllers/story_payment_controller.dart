import 'dart:async';
import 'dart:convert';

import 'package:gasa_free_data/controllers/user_controller.dart';
import 'package:gasa_free_data/models/payments.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../components/j_snack_bar.dart';
import '../utils/base_url.dart';

class StoryPaymentController extends GetxController{
  var listPayments = <Payments>[].obs; // Rendre la liste réactive avec .obs
  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(seconds: 5), (Timer t){
      getPayment();
    });
  }

  Future<void> getPayment() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl2 + 'api/historique/1'),
        headers: {
          "X-API-KEY": "YaKPUrp8En4vFdPwgBrRzzsdT5CKEg6WnAB7ENhL"
        },
      );

      var resp = jsonDecode(response.body);
      print(resp);

      if (resp['success']) { // Vérifie la bonne clé
        var offresData = resp['data'] as Map<String, dynamic>;
        List<Payments> offresList = offresData.entries.map((entry) {
          return Payments.fromJson(entry.value);
        }).toList();

        listPayments.assignAll(offresList); // Met à jour la liste de manière réactive
      } else {
        Get.snackbar("Erreur", "Impossible de charger les offres");
      }
    } catch (e) {
      print("Erreur: $e");
      //Get.snackbar("Erreur", "Une erreur s'est produite");
    }
  }
}