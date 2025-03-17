import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.pressOnSeeAll,
  });

  final String title;
  final VoidCallback pressOnSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: textColor, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        TextButton(
          onPressed: pressOnSeeAll,
          child: const Text(
            "See All",
            style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
