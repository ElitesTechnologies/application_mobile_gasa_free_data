import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../components/j_snack_bar.dart';
import '../components/loader.dart';
import '../models/users.dart';
import '../pages/home_page.dart';
import '../utils/base_url.dart';
import '../utils/shared_prefs.dart';

class RegisterController extends GetxController{
  late TextEditingController
      matriculeController,
      nomController,
      prenomController,
      emailController,
      numeroController,
      momoController,
      passwordController,
      confirmController;

  // Méthode appelée lors de l'initialisation
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    matriculeController = TextEditingController();
    nomController = TextEditingController();
    prenomController = TextEditingController();
    emailController = TextEditingController();
    numeroController = TextEditingController();
    momoController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
  }

  register(BuildContext context){
    Get.showOverlay(asyncFunction: () => onRegister(context), loadingWidget: Loader());
  }
  onRegister(BuildContext context) async {
    try {
      final controllers = {
        'Matricule': matriculeController,
        'Nom': nomController,
        'Prénom': prenomController,
        'Email': emailController,
        'Numéro': numeroController,
        'Momo': momoController,
        'Mot de passe': passwordController,
        'Confirmer le mot de passe': confirmController,
      };

      // Vérifie si un champ est vide
      for (var entry in controllers.entries) {
        if (entry.value.text.trim().isEmpty) {
          JSnackBar(context, "Champs obligatoire", 'Le champ "${entry.key}" est requis.', "error");
          return; // Arrête l'exécution si un champ est vide
        }
      }

      // Vérification du mot de passe et de sa confirmation
      if (passwordController.text != confirmController.text) {
        JSnackBar(context, "Erreur", "Les mots de passe ne correspondent pas.", "error");
        return;
      }
      // Requête HTTP pour l'enregistrement
      var response = await http.post(Uri.parse(baseUrl+'users/Register'), body: {
        'matricule': matriculeController.text,
        'nom': nomController.text,
        'prenom': prenomController.text,
        'email': emailController.text,
        'numTel': numeroController.text,
        'numMomo': momoController.text,
        'password': passwordController.text,
        'confirmPassword': confirmController.text
      });

      var resp = await jsonDecode(response.body);

      if (resp['status']) {
        JSnackBar(context, "Succès", resp['message'], "success");
        Users user = Users.fromJson(resp['User']);
        await SharedPrefs().storeUser(jsonEncode(user));
        Get.offAll(HomePage());
        // Réinitialisation des champs
        matriculeController.text = "";
        nomController.text = "";
        prenomController.text = "";
        emailController.text = "";
        numeroController.text = "";
        momoController.text = "";
        passwordController.text = "";
        confirmController.text = "";
        // Navigation vers la page d'accueil
        Get.offAll(HomePage());
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
    // TODO: implement onClose
    super.onClose();
    matriculeController.dispose();
    nomController.dispose();
    prenomController.dispose();
    emailController.dispose();
    numeroController.dispose();
    momoController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }
}
