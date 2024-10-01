import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../logic/controller/appointment controller/appointment_controller.dart';

class CalendarWidget extends StatelessWidget {
  final String doctorName;
  final List<String> availableDays;

  CalendarWidget({
    super.key,
    required this.doctorName,
    required this.availableDays,
  });

  final controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Text("Select Days ",
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemCount: availableDays.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  controller.selectDay(availableDays[index]);
                },
                child: Obx(() => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            controller.selectedDay.value == availableDays[index]
                                ? Colors.blue
                                : Colors.white,
                        border: Border.all(
                          color: Colors.blue.withOpacity(0.5),
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        availableDays[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: controller.selectedDay.value ==
                                  availableDays[index]
                              ? Colors.white
                              : Colors.black,
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
