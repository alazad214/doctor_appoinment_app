import 'package:doctor_appointment/app/logic/controller/profile/profile_controller.dart';
import 'package:doctor_appointment/app/modules/profile/components/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants.dart';
import '../../settings/views/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => SettingsScreen()),
            icon: const Icon(
              Iconsax.setting,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [

            Container(
              clipBehavior: Clip.antiAlias,
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                  color: Colors.blue, shape: BoxShape.circle),
              child: Image.network(
                controller.userImage.value,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                  );
                },
              ),

            CircleAvatar(
              radius: 60,
              backgroundImage: controller.userImage.value != ''
                  ? NetworkImage(
                      controller.userImage.value,
                    )
                  : AssetImage('assets/images/avatar.jpg'),

            ),
            const SizedBox(height: defaultPadding),
            ProfileTextField(
                initialValue: controller.username.value,
                fieldName: 'User Name*',
                suffixIcon: Iconsax.user,
                readOnly: true),
            ProfileTextField(
                initialValue: controller.email.value,
                fieldName: 'Email*',
                suffixIcon: Icons.email_outlined,
                readOnly: true),
            controller.phoneNumber.value != ''
                ? ProfileTextField(
                    initialValue: controller.phoneNumber.value,
                    fieldName: 'Mobile*',
                    suffixIcon: Iconsax.call,
                    readOnly: true)
                : SizedBox.shrink(),
            controller.address.value != ''
                ? ProfileTextField(
                    initialValue: controller.address.value,
                    fieldName: 'Address*',
                    suffixIcon: Iconsax.location,
                    readOnly: true)
                : SizedBox.shrink(),
            controller.blodGroup.value != ''
                ? ProfileTextField(
                    initialValue: controller.blodGroup.value,
                    fieldName: 'Blood Group*',
                    suffixIcon: Icons.bloodtype_outlined,
                    readOnly: true)
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
