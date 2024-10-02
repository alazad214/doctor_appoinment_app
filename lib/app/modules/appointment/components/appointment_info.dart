import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class AppointmentInfo extends StatelessWidget {
  const AppointmentInfo({super.key, this.title, this.text});
  final title;
  final text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: textColor.withOpacity(0.62),
          ),
        ),
        Text(
          text,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
