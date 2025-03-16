import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/style/toast_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString userImage = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString address = ''.obs;
  RxString bloodGroup = ''.obs;
  Uint8List? selectedFileByte;
  String? fileName;

  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  // Text Editing Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (currentUser != null) {
      fetchUserData();
    }
  }

  Future<void> imagePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );

    if (result != null) {
      selectedFileByte = result.files.single.bytes;
      fileName = result.files.single.name;
      update();
    } else {
      errorToast('No image selected');
    }
  }

  Future<String?> imageUploadByFirebase() async {
    if (selectedFileByte == null || fileName == null) {
      errorToast('No image selected');
      return null;
    }

    try {
      Reference storageRef = FirebaseStorage.instance.ref().child(
            'profileImage/$fileName',
          );

      UploadTask uploadTask = storageRef.putData(selectedFileByte!);
      TaskSnapshot snapshot = await uploadTask;

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      errorToast('Failed to upload image: $e');
      return null;
    }
  }

  fetchUserData() async {
    if (currentUser != null) {
      String userEmail = currentUser!.email!;
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs[0].data() as Map<String, dynamic>;

        // Set values in variables
        username.value = userData['userName'];
        email.value = userData['email'];
        userImage.value = userData['photos'];
        phoneNumber.value = userData['phone'];
        address.value = userData['address'];
        bloodGroup.value = userData['bloodGroup'];

        // Set values in controllers for editing
        nameController.text = username.value;
        phoneController.text = phoneNumber.value;
        addressController.text = address.value;
        bloodGroupController.text = bloodGroup.value;
      }
    }
  }

  // 🔥 Update Profile in Firestore
  Future<void> updateProfile() async {
    if (currentUser != null) {
      String? imageUrl = await imageUploadByFirebase();

      if (imageUrl == null) {
        errorToast('Image upload failed!');

        return;
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .update({
        'userName': nameController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'photos': imageUrl,
        'bloodGroup': bloodGroupController.text,
      });

      // Update values in UI
      username.value = nameController.text;
      phoneNumber.value = phoneController.text;
      address.value = addressController.text;
      bloodGroup.value = bloodGroupController.text;

      Get.snackbar("Success", "Profile updated successfully",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
