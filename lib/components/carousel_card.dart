import 'package:flutter/material.dart';
import 'package:gasa_free_data/themes/theme.dart';

class CarouselCard extends StatelessWidget {
  final String image;
  const CarouselCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage("$image"), fit: BoxFit.cover)
      ),
    );
  }
}
