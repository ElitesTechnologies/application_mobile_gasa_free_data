import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/j_snack_bar.dart';
import '../pages/payement_page.dart';

class PayementController extends GetxController{
  int? idOffre;
  late TextEditingController numeroController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    numeroController = TextEditingController();
  }

  verify(BuildContext context){
    if (numeroController.text.trim().isEmpty) {
      JSnackBar(context, "Champs obligatoire", "Veuillez chosir un numéro.", "error");
      return;
    }
    Get.to(PayementPage());
  }
}