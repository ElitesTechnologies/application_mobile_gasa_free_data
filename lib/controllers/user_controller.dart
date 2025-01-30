import 'dart:convert';

import 'package:get/get.dart';
import 'package:gasa_free_data/models/users.dart';

import '../utils/shared_prefs.dart';

class UserController extends GetxController {
  var user = Users().obs; // Variable réactive

  @override
  void onInit() {
    super.onInit();
    // Récupère les données de l'utilisateur (en supposant que tu l'as déjà stocké)
    viewProfil();
  }

  viewProfil() async {
    var usr = await SharedPrefs().getUser();
    if (usr != null) {
      user.value = Users.fromJson(json.decode(usr)); // Utilise la méthode fromJson pour parser l'utilisateur
    }
  }
}
