import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/menu.dart';
import 'package:gasa_free_data/pages/section/profil.dart';
import 'package:gasa_free_data/pages/section/historique.dart';
import 'package:gasa_free_data/pages/section/home.dart';
import 'package:get/get.dart';

import 'package:gasa_free_data/themes/theme.dart';

import '../utils/shared_prefs.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: [
        Home(),
        Historique(),
        Profil()
      ][_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Acceuil"),
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: "Historique"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Mon compte"),
        ],
      ) ,
    );
  }
}
