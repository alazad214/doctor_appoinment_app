import 'package:flutter/material.dart';

class AppRating extends StatelessWidget {
  final num score;

  const AppRating({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < score ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }
}
