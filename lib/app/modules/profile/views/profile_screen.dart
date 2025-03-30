import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../widgets/app_colors.dart';
import '../../../logic/controller/profile/profile_controller.dart';
import '../../appointment/views/my_appointment_screen.dart';
import '../../settings/views/privacy_policy_screen.dart' show PolicyScreen;
import '../components/profile_text_field.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColor, width: 3),
                ),
                child: Obx(() => Container(
                      clipBehavior: Clip.antiAlias,
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
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
                    )),
              ),
              SizedBox(height: 16),
              profileTile(
                icon: Iconsax.user,
                text: controller.username.value,
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),

              SizedBox(height: 5),
              profileTile(
                  icon: Iconsax.call, text: controller.phoneNumber.value),
              SizedBox(height: 5),
              profileTile(
                icon: Iconsax.sms,
                text: controller.email.value,
              ),
              SizedBox(height: 5),
              profileTile(
                icon: Iconsax.location,
                text: controller.address.value,
              ),

              SizedBox(height: 5),
              Divider(color: Colors.black12),
              SizedBox(height: 15),
              //Profile Tiles-->
              buildProfileTile(
                  image: Iconsax.calendar,
                  title: 'My Appointments',
                  ontap: () {
                    Get.to(() => MyAppointmentScreen());
                  }),
              buildProfileTile(
                  image: Iconsax.edit,
                  title: 'Edit Profile',
                  ontap: () {
                    showEditBottomSheet(context);
                  }),
              buildProfileTile(
                  image: Iconsax.lock,
                  title: 'Privacy Policy',
                  ontap: () {
                    Get.to(() => const PolicyScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileTile({required icon, required text, textStyle}) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          size: 20,
          color: AppColors.primaryColor,
        ),
        title: Text(text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            )),
      ),
    );
  }

  Widget buildProfileTile(
      {required IconData image,
      required String title,
      required VoidCallback ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(
            image,
            size: 20,
            color: AppColors.primaryColor,
          ),
          title: Text(title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              )),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
      ),
    );
  }

  void showEditBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:
                            Icon(Icons.close, color: Colors.black87, size: 20)),
                  ],
                ),
                const SizedBox(height: 15),

                // Profile Picture
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: GetBuilder<ProfileController>(
                      builder: (ctrl) {
                        return ctrl.selectedFileBytes != null
                            ? Image.memory(
                                ctrl.selectedFileBytes!,
                                fit: BoxFit.cover,
                                height: 180,
                              )
                            : Image.network(
                                controller.userImage.value,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/profile.png',
                                    fit: BoxFit.cover,
                                  );
                                },
                              );
                      },
                    ),
              
              
                  ),
                ),

                const SizedBox(height: 15),

                // Name Field
                ProfileTextField(
                  controller: controller.nameController,
                  fieldName: 'Name*',
                  suffixIcon: Iconsax.user,
                ),

                // Email Field (Read-Only)
                ProfileTextField(
                  controller:
                      TextEditingController(text: controller.email.value),
                  fieldName: 'Email*',
                  suffixIcon: Iconsax.sms,
                  readOnly: true,
                ),

                // Mobile Field
                ProfileTextField(
                  controller: controller.phoneController,
                  fieldName: 'Mobile*',
                  suffixIcon: Iconsax.call,
                ),

                // Address Field
                ProfileTextField(
                  controller: controller.addressController,
                  fieldName: 'Address*',
                  suffixIcon: Iconsax.location,
                ),

                // Blood Group Dropdown
                Obx(() => DropdownButtonFormField<String>(
                      value: controller.bloodGroup.value.isNotEmpty
                          ? controller.bloodGroup.value
                          : null,
                      decoration: InputDecoration(
                        labelText: "Blood Group*",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.bloodtype_outlined),
                      ),
                      items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
                          .map((bloodGroup) {
                        return DropdownMenuItem(
                          value: bloodGroup,
                          child: Text(bloodGroup),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.bloodGroup.value = value!;
                      },
                    )),

                const SizedBox(height: 20),

                // Save Button
                ElevatedButton(
                  onPressed: () {
                    controller.updateUserData();
                    Navigator.pop(context);
                  },
                  child: const Text("Save Changes"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
