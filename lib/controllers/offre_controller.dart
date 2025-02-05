import 'dart:async';
import 'dart:convert';

import 'package:gasa_free_data/models/offres.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/base_url.dart';

class OffreController extends GetxController {
  var listOffres = <Offres>[].obs; // Rendre la liste réactive avec .obs

  @override
  void onInit() {
    super.onInit();
    getOffre();
    Timer.periodic(Duration(seconds: 30), (Timer t){
      getOffre();
    });
  }

  Future<void> getOffre() async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl2 + 'api/offre_internet/showAll'),
        headers: {
          "X-API-KEY": "YaKPUrp8En4vFdPwgBrRzzsdT5CKEg6WnAB7ENhL"
        },
      );

      var resp = jsonDecode(response.body);
      print(resp);

      if (resp['success']) { // Vérifie la bonne clé
        var offresData = resp['data'] as Map<String, dynamic>;
        List<Offres> offresList = offresData.entries.map((entry) {
          return Offres.fromJson(entry.value);
        }).toList();

        listOffres.assignAll(offresList); // Met à jour la liste de manière réactive
      } else {
        //Get.snackbar("Erreur", "Impossible de charger les offres");
      }
    } catch (e) {
      print("Erreur: $e");
      //Get.snackbar("Erreur", "Impossible de charger les offres");
    }
  }
}
