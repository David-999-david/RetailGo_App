import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_sharp,
      color: const Color.fromARGB(255, 255, 236, 63),
      size: 15,
    );
  }
}
