import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants.dart';
import '../../../logic/controller/profile/profile_controller.dart';
import '../../profile/components/profile_text_field.dart';
//comment
class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: AppColors.primaryColor)),
              child: Obx(() => CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.selectedFileByte != null
                        ? MemoryImage(controller.selectedFileByte!)
                        : const AssetImage('assets/images/avatar.jpg')
                            as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () => controller.imagePick(),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(Icons.camera_alt,
                              color: Colors.black, size: 18),
                        ),
                      ),
                    ),
                  )),
            ),
            const SizedBox(height: defaultPadding),
            ProfileTextField(
              controller: controller.nameController,
              fieldName: 'Name*',
              suffixIcon: Iconsax.user,
            ),
            ProfileTextField(
              controller: TextEditingController(text: controller.email.value),
              fieldName: 'Email*',
              suffixIcon: Iconsax.sms,
              readOnly: true,
            ),
            ProfileTextField(
              controller: controller.phoneController,
              fieldName: 'Mobile*',
              suffixIcon: Iconsax.call,
            ),
            ProfileTextField(
              controller: controller.addressController,
              fieldName: 'Address*',
              suffixIcon: Iconsax.location,
            ),
            ProfileTextField(
              controller: controller.bloodGroupController,
              fieldName: 'Blood Group*',
              suffixIcon: Icons.bloodtype_outlined,
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () {
                controller.updateProfile();
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
