import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constants.dart';
import '../../../logic/controller/appointment controller/appointment_controller.dart';

class TimeWidget extends StatelessWidget {
  final List<Timestamp> availableTimes;

  TimeWidget({super.key, required this.availableTimes});

  final controller = Get.put(AppointmentController());

  String formatTime(Timestamp time) {
    DateTime dateTime = time.toDate();
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text("Available Times",
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: availableTimes.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.selectTime(availableTimes[index]);
              },
              child: Obx(() => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      leading: Icon(
                        Icons.access_time,
                        color: controller.selectedTime.value ==
                                availableTimes[index]
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      title: Text(
                        formatTime(availableTimes[index]),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: controller.selectedTime.value ==
                                  availableTimes[index]
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                      trailing: controller.selectedTime.value ==
                              availableTimes[index]
                          ? const Icon(Icons.check_circle, color: Colors.blue)
                          : null,
                    ),
                  )),
            );
          },
        ),
      ],
    );
  }
}
