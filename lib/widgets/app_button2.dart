import 'package:flutter/material.dart';

class AppButton2 extends StatelessWidget {
  const AppButton2({super.key, this.text, this.ontap});
  final String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: OutlinedButton(
          onPressed: ontap,
          child: Text(text ?? '', style: const TextStyle(color: Colors.black))),
    );
  }
}
