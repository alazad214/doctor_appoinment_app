import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/app_colors.dart';
import '../../../logic/controller/profile/profile_controller.dart';
import '../components/profile_text_field.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
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
            ),
            SizedBox(height: 20),
            Text(
              controller.username.value,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 5),
            Text(
              controller.email.value,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 5),
            Text(
              controller.phoneNumber.value,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                showEditBottomSheet(context);
              },
              child: Container(
                width: 200,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 2, color: AppColors.primaryColor)),
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
              Text(
                'Edit Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
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
                  controller.fetchUserData();
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        );
      },
    );
  }
}
