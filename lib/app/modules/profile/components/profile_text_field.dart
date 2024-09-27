import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class ProfileTextField extends StatelessWidget {
  final initialValue;
  final readOnly;
  final hintText;
  final suffixIcon;
  final onChanged;
  final fieldName;
  final maxLine;
  const ProfileTextField(
      {super.key,
      this.initialValue,
      this.readOnly,
      this.hintText,
      this.suffixIcon,
      this.onChanged,
      this.fieldName, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              fieldName ?? '',
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 3),
          TextField(
            maxLines: maxLine??1,
            controller: TextEditingController(text: initialValue),
            readOnly: readOnly ?? false,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: Icon(suffixIcon),
              labelStyle: TextStyle(color: Colors.grey[800]),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Colors.blueAccent, width: 0.5),
              ),
            ),
            style:
                const TextStyle(color: textColor, fontWeight: FontWeight.w600),
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
