import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/j_snack_bar.dart';
import 'package:gasa_free_data/components/loader.dart';
import 'package:gasa_free_data/pages/home_page.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:gasa_free_data/utils/base_url.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/payment_controller.dart';
import '../controllers/user_controller.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({super.key});

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
  final userController = Get.put(UserController());
  final paymentController = Get.put(PayementController());
  late WebViewController controller;
  bool isLoading = true; // ✅ Variable pour afficher le loader

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              isLoading = progress < 100;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onHttpError: (HttpResponseError error) {
            Get.back();
            JSnackBar(context, "Erreur", "Erreur lors de du chargement de la page de payement", "sucsess");
          },
          onWebResourceError: (WebResourceError error) {
            //Get.back();
            //JSnackBar(context, "Erreur", "Erreur lors de du chargement de la page de payement", "sucsess");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(baseUrl2+'api/payment/success')) {
              Get.offAll(HomePage());
              JSnackBar(context, "Paiement éffectué", "Votre paiement a été éffectuer avec succès.", "success");
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(baseUrl2+'api/payment/${userController.user.value.id}/${paymentController.idOffre}/${paymentController.numeroController.text}')); // ✅ URL corrigée

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payement"),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading) // ✅ Affiche le loader uniquement si `isLoading == true`
            Container(
              color: Colors.white,
              child: Loader(),
            ),
        ],
      ),
    );
  }
}
