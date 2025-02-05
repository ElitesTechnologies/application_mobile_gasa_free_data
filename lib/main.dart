import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gasa_free_data/themes/theme.dart';
import 'package:get/get.dart';

import 'utils/wrapper.dart';

void main() {
  runApp(const MyApp());
  // Changer la couleur de la barre de statut en noir
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: primaryColor, // Couleur de la barre de statut
      statusBarIconBrightness: Brightness.light, // Icônes en blanc pour un bon contraste
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gasa Free Data',
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
