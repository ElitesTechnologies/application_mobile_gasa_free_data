import 'package:flutter/material.dart';
import 'package:gasa_free_data/themes/theme.dart';

class JInput extends StatelessWidget {
  final String? name, placeholder;
  final TextInputType? keyboardType;
  final Widget? prefixIcon, suffixIcon;
  final bool passwordInput; // Utilisation de `final` pour immutabilité
  final TextEditingController? controller; // Suppression de l'instanciation par défaut

  JInput({
    super.key,
    required this.name,
    this.keyboardType,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    required this.passwordInput,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordInput,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: placeholder,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text(
          "$name",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        focusColor: primaryColor,
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor, width: 1)),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.3),
        border: InputBorder.none, // Supprime les bordures
      ),
      controller: controller,
    );
  }
}
