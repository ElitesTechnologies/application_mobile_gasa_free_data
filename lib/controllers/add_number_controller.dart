import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasa_free_data/controllers/user_controller.dart';
import 'package:gasa_free_data/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../components/j_snack_bar.dart';
import '../components/loader.dart';
import '../utils/base_url.dart';

class AddNumberController extends GetxController{
  final userController = Get.put(UserController());
  late TextEditingController numberController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    numberController = TextEditingController();
  }

  addNumber(BuildContext context){
    Get.showOverlay(asyncFunction: () => onAddNumber(context), loadingWidget: Loader());
  }
  onAddNumber(BuildContext context) async {
    try {
      //verification du champs
      if (numberController.text.trim().isEmpty) {
        JSnackBar(context, "Champs obligatoire", "Le numéro est requis.", "error");
        return false;
      }
      var matricule = "241";
      // Requête HTTP pour l'enregistrement
      var response = await http.put(Uri.parse(baseUrl+'users/addmomo/${userController.user.value.matricule}'), body: {
        'numMomo2': numberController.text,
      });

      var resp = await jsonDecode(response.body);
      if (resp['status']) {
        JSnackBar(context, "Succès", resp['message'], "success");
        // Réinitialisation des champs
        numberController.text = "";
        // Navigation vers la page Suivant
        Get.off(HomePage());
      } else {
        JSnackBar(context, "Erreur", resp['message'], "error");
      }
    }catch(e){
      print("Erreur: $e");
      JSnackBar(context, "Erreur", 'Une erreur s\'produite', "error");
    }

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    numberController.dispose();
  }
}