import 'package:flutter/material.dart';
import 'package:gasa_free_data/components/menu.dart';
import 'package:gasa_free_data/pages/profil_page.dart';
import 'package:gasa_free_data/pages/section/historique_payment.dart';
import 'package:gasa_free_data/pages/section/list_offre.dart';
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
  var _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: _currentIndex != 0 ? IconButton(
            onPressed: () => Get.to(ProfilPage()),
            icon: const Icon(Icons.account_circle)
        ):null,
        title: [
          const Text("Historique de payement"),
          const Text("Gasa Free Data"),
          const Text("Gasa Free Data")
        ][_currentIndex],
        actions: [
          _currentIndex != 0 ? IconButton(
              onPressed: () async {
                await SharedPrefs().removeUser() ;
                Get.offAll(LoginPage());
              },
              icon: const Icon(Icons.logout)
          ):Container()
        ],
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: [
        HistoriquePayment(),
        ListOffre(),
        ListOffre(),
      ][_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
        child: Icon(Icons.grid_view),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        focusColor: secondaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            if(value ==2){
              showMoreMenu(context);
              return;
            }
            _currentIndex = value;
          });
        },
        selectedItemColor: primaryColor,
        backgroundColor: bgColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: "Historique"),
          BottomNavigationBarItem(icon: Icon(Icons.call_missed_outgoing), label: "Liste des offres"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "Plus"),
        ],
      ) ,
    );
  }

  void showMoreMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
            child: SizedBox(
              child:  Menu(),
              height: MediaQuery.of(context).size.height*0.2,
            ));
      },
    );
  }
}
