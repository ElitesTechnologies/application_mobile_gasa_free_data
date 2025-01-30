import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../components/j_snack_bar.dart';
import '../components/loader.dart';
import '../utils/base_url.dart';
import 'user_controller.dart';

class ChangePasswordController extends GetxController {
  final userController = Get.put(UserController());
  late TextEditingController
      oldController,
      passwordController,
      confirmController;

  // Méthode appelée lors de l'initialisation
  @override
  void onInit() {
    super.onInit();
    oldController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
  }

  changePassword(BuildContext context){
    Get.showOverlay(asyncFunction: () => onChangePassword(context), loadingWidget: Loader());
  }
  onChangePassword(BuildContext context) async {
    try {
      //verification du champs
      if (oldController.text.trim().isEmpty) {
        JSnackBar(context, "Champs obligatoire", "Le champ Ancien mot de passe est requis.", "error");
        return;
      }
      if (passwordController.text.trim().isEmpty) {
        JSnackBar(context, "Champs obligatoire", "Le champ Mot de passe est requis.", "error");
        return;
      }
      if (confirmController.text.trim().isEmpty) {
        JSnackBar(context, "Champs obligatoire", "Le champ Confirmer le mot de passe est requis.", "error");
        return;
      }
      if (passwordController.text != confirmController.text) {
        JSnackBar(context, "Erreur", "Les mots de passe ne correspondent pas.", "error");
        return;
      }
      // Requête HTTP pour l'enregistrement
      var response = await http.put(Uri.parse(baseUrl+'users/update-password/${userController.user.value.matricule}'), body: {
        'password': oldController.text,
        'newPassword': passwordController.text
      });

      var resp = await jsonDecode(response.body);
      print(resp);

      if (resp['status']) {
        JSnackBar(context, "Succès", resp['message'], "success");
        // Réinitialisation des champs
        oldController.text = "";
        passwordController.text = "";
        confirmController.text = "";
        // Navigation vers la page Suivant
        Get.back();
      } else {
        JSnackBar(context, "Erreur", resp['message'], "error");
      }
    }catch(e){
      print("Erreur: $e");
      JSnackBar(context, "Erreur", 'Une erreur s\'produite', "error");
    }

  }

  // Méthode appelée pour libérer les ressources
  @override
  void onClose() {
    oldController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }
}