import 'package:flutter/material.dart';

class JSelect extends StatefulWidget {
  final String label;
  final List<DropdownMenuItem<String>> options;
  TextEditingController? controller; // Contrôleur pour gérer la sélection

  JSelect({
    Key? key,
    required this.label,
    required this.options,
    this.controller, // Initialisation du contrôleur
  }) : super(key: key);

  @override
  State<JSelect> createState() => _JSelectState();
}

class _JSelectState extends State<JSelect> {
  @override
  void initState() {
    super.initState();
    // Initialisation de la valeur sélectionnée avec le contrôleur (si une valeur est définie)
    if (widget.controller!.text.isNotEmpty) {
      widget.controller!.text = widget.controller!.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.controller!.text.isNotEmpty ? widget.controller!.text : null,
      items: widget.options,
      onChanged: (value) {
        setState(() {
          widget.controller!.text = value!; // Met à jour la valeur dans le contrôleur
        });
      },
      hint: Text(widget.label),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
