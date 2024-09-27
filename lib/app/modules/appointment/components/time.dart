import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../logic/controller/appointment controller/appointment_controller.dart';

class TimeWidget extends StatelessWidget {
  TimeWidget({super.key});

  final controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text("Select Time", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        GridView.builder(
            shrinkWrap: true,
            itemCount: controller.slots.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.77,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  controller.selectSlot(controller.slots[index]);
                },
                child: Obx(() => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.selectedSlot.value ==
                                controller.slots[index]
                            ? primaryColor
                            : Colors.white54,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: Text(controller.slots[index],
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: controller.selectedSlot.value ==
                                        controller.slots[index]
                                    ? Colors.white
                                    : textColor)))))),
      ],
    );
  }
}
