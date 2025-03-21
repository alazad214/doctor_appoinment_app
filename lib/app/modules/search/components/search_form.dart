import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import '../../../logic/controller/search/search_controller.dart';
import '../views/search_result_screen.dart';

class SearchForm extends StatelessWidget {
  final controller = Get.put(DoctorSearchController());

  SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Obx(
            () => DropdownButtonFormField(
              value: controller.selectedCategory.value.isEmpty
                  ? null
                  : controller.selectedCategory.value,
              hint: const Text("Select Specialist"),
              icon: Icon(Icons.arrow_drop_down),
              items: controller.categories.map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                controller.setSelectedCategory(value!);
              },
            ),
          ),
          const SizedBox(height: 40),
          customButton(
              name: 'Search',
              onCallBack: () {
                if (controller.selectedCategory.value.isNotEmpty) {
                  Get.to(
                    () => SearchResultScreen(
                        category: controller.selectedCategory.value),
                  );
                } else {
                  Toastification().show(
                    title: Text('Selection Error'),
                    description: Text('Please Select the category'),
                    type: ToastificationType.error,
                    autoCloseDuration: Duration(seconds: 3),
                  );
                }
              },
              context: context)
        ],
      ),
    );
  }
}

List<String> doctorSpecialists = [
  "Cardiologist",
  "Dermatologist",
  "Pediatrician",
  "Neurologist",
  "Orthopedic Surgeon",
  "Ophthalmologist",
  "Psychiatrist",
  "Gastroenterologist",
  "Radiologist",
  "Endocrinologist",
];

List<String> doctorAreas = [
  "Cardiology",
  "Dermatology",
  "Pediatrics",
  "Neurology",
  "Orthopedics",
  "Ophthalmology",
  "Psychiatry",
  "Gastroenterology",
  "Radiology",
  "Endocrinology",
];
