import 'package:flutter/material.dart';

class JButton extends StatelessWidget {
  final Widget child;
  final Color fg, bg;

  final VoidCallback onPressed;

  JButton({super.key, required this.child, required this.onPressed, required this.fg, required this.bg});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: child,
      style: OutlinedButton.styleFrom(
        elevation: 2, // button's elevation when it's pressed
        side: BorderSide(color: bg),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //minimumSize: Size(constraints.maxWidth, 50), // Make it responsive
        padding: EdgeInsets.all( 10),
        foregroundColor: fg,
        backgroundColor: bg,
      ),
    );
  }
}