import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/loader.dart';
import 'package:gasa_free_data/pages/home_page.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({super.key});

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
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
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('http://192.168.8.100:8000/api/payment/success')) {
              Get.offAll(HomePage());
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('http://192.168.8.100:8000/api/payment/2/1/64000001')); // ✅ URL corrigée

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
              color: bgColor, // ✅ Arrière-plan semi-transparent
              child: Loader(),
            ),
        ],
      ),
    );
  }
}
