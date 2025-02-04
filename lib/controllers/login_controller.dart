import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_snack_bar.dart';
import 'package:gasa_free_data/utils/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../components/loader.dart';
import '../models/users.dart';
import '../pages/home_page.dart';
import '../utils/base_url.dart';

class LoginController extends GetxController{
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController(text: 'joelprinceyeheze@gmail.com');
    passwordController = TextEditingController(text: '1234567890');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
  login(BuildContext context){
    Get.showOverlay(asyncFunction: () => onLogin(context), loadingWidget: Loader());
  }

  onLogin(BuildContext context) async {
    // Liste des champs obligatoires
    final controllers = {
      'Email': emailController,
      'Mot de passe': passwordController,
    };

    // Vérifie si un champ est vide
    for (var entry in controllers.entries) {
      if (entry.value.text.trim().isEmpty) {
        JSnackBar(context, "Champs obligation", 'Le champ "${entry.key}" est requis.', "error");
        return; // Arrête l'exécution si un champ est vide
      }
    }
    //Requette http
    try{
      var response = await http.post(Uri.parse(baseUrl + 'auth/SignIn'), body:{
        'email': emailController.text,
        'password': passwordController.text
      });

      var resp = await jsonDecode(response.body);

      if(resp['status']){
        JSnackBar(context, "Succès", resp['message'], "success");
        emailController.text = "";
        passwordController.text = "";
        Users user = Users.fromJson(resp['User']);
        await SharedPrefs().storeUser(jsonEncode(user));
        Get.offAll(HomePage());
      }
      else{
        JSnackBar(context, "Erreur", resp['message'], "error");
      }
    }catch(e){
      print("Erreur: $e");
      JSnackBar(context, "Erreur", 'Une erreur s\'produite', "error");
    }

  }
}