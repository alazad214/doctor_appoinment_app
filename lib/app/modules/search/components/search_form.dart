import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
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
            () => DropdownButtonFormField<String>(
              value: controller.selectedCategory.value.isEmpty
                  ? null
                  : controller.selectedCategory.value,
              hint: const Text("Select Specialist"),
              icon: SvgPicture.asset("assets/icons/stethoscope.svg"),
              items: controller.categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                controller.setSelectedCategory(value!);
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: ElevatedButton(
              onPressed: () {
                if (controller.selectedCategory.value.isNotEmpty) {
                  Get.to(
                    () => SearchResultScreen(
                        category: controller.selectedCategory.value),
                  );
                } else {
                  Get.snackbar("Error", "Please select a category");
                }
              },
              child: const Text("Search"),
            ),
          ),
        ],
      ),
    );
  }
}
