import 'package:doctor_appointment/app/modules/profile/components/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../settings/views/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.to(() =>  SettingsScreen()),
            icon: const Icon(
              Icons.settings,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            SizedBox(height: defaultPadding),
            ProfileTextField(
                initialValue: "Al Azad",
                fieldName: 'Name*',
                suffixIcon: Icons.person_outline,
                readOnly: true),
            ProfileTextField(
                initialValue: "text@gmail.com",
                fieldName: 'Email*',
                suffixIcon: Icons.mail_outline,
                readOnly: true),
            ProfileTextField(
                initialValue: "01763551316",
                fieldName: 'Mobile*',
                suffixIcon: Icons.phone,
                readOnly: true),
            ProfileTextField(
                initialValue: "Thakurgaon, Bangladesh",
                fieldName: 'Address*',
                suffixIcon: Icons.location_on_outlined,
                readOnly: true),
          ],
        ),
      ),
    );
  }
}
