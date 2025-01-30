import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasa_free_data/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../components/j_snack_bar.dart';
import '../components/loader.dart';
import '../pages/check_code_page.dart';
import '../pages/init_password_page.dart';
import '../utils/base_url.dart';

class InitPasswordController extends GetxController {
  late TextEditingController emailController,
      codeController,
      passwordController,
      confirmController;

  // Méthode appelée lors de l'initialisation
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    codeController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
  }

  verifyEmail(BuildContext context){
    Get.showOverlay(asyncFunction: () => onVerifyEmail(context), loadingWidget: Loader());
  }
  onVerifyEmail(BuildContext context) async {
    try {
      //verification du champs
      if (emailController.text.trim().isEmpty) {
        JSnackBar(context, "Champs obligatoire", "Le champ Email est requis.", "error");
        return ;
      }
      // Requête HTTP pour l'enregistrement
      var response = await http.post(Uri.parse(baseUrl+'auth/forgot-password'), body: {
        'email': emailController.text,
      });

      var resp = await jsonDecode(response.body);

      if (resp['status']) {
        JSnackBar(context, "Succès", resp['message'], "success");
        // Navigation vers la page Suivant
        Get.to(CheckCodePage());
      } else {
        JSnackBar(context, "Erreur", resp['message'], "error");
      }
    }catch(e){
      print("Erreur: $e");
      JSnackBar(context, "Erreur", 'Une erreur s\'produite', "error");
    }

  }

  verifyCode(BuildContext context){
    Get.showOverlay(asyncFunction: () => onVerifyCode(context), loadingWidget: Loader());
  }
  onVerifyCode(BuildContext context) async {
    try {
      //verification du champs
      if (codeController.text.trim().isEmpty) {
        JSnackBar(context, "Champs obligatoire", "Le champ Code est requis.", "error");
        return false;
      }
      // Requête HTTP pour l'enregistrement
      var response = await http.post(Uri.parse(baseUrl+'auth/verifyCode'), body: {
        'code': codeController.text,
        'email' : emailController.text
      });

      var resp = await jsonDecode(response.body);

      if (resp['status']) {
        JSnackBar(context, "Succès", resp['message'], "success");
        // Navigation vers la page Suivant
        Get.to(InitPasswordPage());
      } else {
        JSnackBar(context, "Erreur", resp['message'], "error");
      }
    }catch(e){
      print("Erreur: $e");
      JSnackBar(context, "Erreur", 'Une erreur s\'produite', "error");
    }

  }

  initPassword(BuildContext context){
    Get.showOverlay(asyncFunction: () => onInitPassword(context), loadingWidget: Loader());
  }
  onInitPassword(BuildContext context) async {
    try {
      //verification du champs
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
      var response = await http.post(Uri.parse(baseUrl+'auth/reset-password'), body: {
        'newPassword': passwordController.text,
        'email': emailController.text
      });

      var resp = await jsonDecode(response.body);
      print(resp);
      if (resp['status']) {
        JSnackBar(context, "Succès", resp['message'], "success");
        // Réinitialisation des champs
        emailController.text = "";
        passwordController.text = "";
        codeController.text = "";
        confirmController.text = "";
        // Navigation vers la page Suivant
        Get.to(LoginPage());
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
    emailController.dispose();
    codeController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }
}
