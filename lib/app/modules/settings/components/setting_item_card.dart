import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

class SettingItemCard extends StatelessWidget {
  const SettingItemCard({
    super.key,
    this.text,
    this.iconSrc,
    this.onChanged,
    this.child,
    this.icon,
  });

  final String? text, iconSrc;

  final VoidCallback? onChanged;
  final Widget? child;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      decoration: const BoxDecoration(color: Colors.white),
      child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(4)),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          title: Text(
            text ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: child),
    );
  }
}
