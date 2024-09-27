import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../logic/controller/appointment controller/appointment_controller.dart';

class CalendarWidget extends StatelessWidget {
  CalendarWidget({super.key});

  final controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text("Select Days", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        SizedBox(
          height: 80,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: defaultPadding);
            },
            itemCount: controller.listOfDays.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  controller.selectDay(controller.listOfDays[index]);
                },
                child: Obx(() => Container(
                      width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: controller.selectedDay.value ==
                                  controller.listOfDays[index]
                              ? primaryColor
                              : Colors.white54),
                      child: Text(
                        controller.listOfDays[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: controller.selectedDay.value ==
                                  controller.listOfDays[index]
                              ? Colors.white
                              : textColor,
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
      ],
    );
  }
}
