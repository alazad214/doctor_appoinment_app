import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, this.text, this.ontap});
  final String? text;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF6C9ED8),
      ),
      child: Text(
        text ?? '',
        style: TextStyle(
            color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
