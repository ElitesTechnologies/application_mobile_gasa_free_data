import 'package:flutter/material.dart';
import 'package:gasa_free_data/themes/theme.dart';

void JSnackBar(BuildContext context, String title, String message, String type) {
  final snackBar = SnackBar(
    content: Text(
      "$title\n$message",
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: type == "error" ? secondaryColor : primaryColor,
    //behavior: SnackBarBehavior.floating, // Permet d'afficher un SnackBar flottant
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
