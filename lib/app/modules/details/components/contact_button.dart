import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
    this.callOntap,
    this.messageOntap,
  });
  final VoidCallback? callOntap;
  final VoidCallback? messageOntap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.lightBlue.shade300),
              onPressed: callOntap,
              icon: SvgPicture.asset("assets/icons/Call.svg"),
              label: const Text("Voice Call")),
        ),
        const SizedBox(width: defaultPadding / 2),
        Expanded(
          child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red.shade200),
              onPressed: messageOntap,
              icon: SvgPicture.asset("assets/icons/Chat.svg",
                  color: Colors.white, width: 11),
              label: const Text("Message")),
        ),
      ],
    );
  }
}
