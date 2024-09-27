import 'package:get/get.dart';

class AppointmentController extends GetxController {
  var selectedDay = "".obs;
  var selectedSlot = "".obs;
  final List<String> slots = [
    "10:10 am",
    "10:30 am",
    "10:50 am",
    "2:10 pm",
    "2:50 pm",
  ];

  final List<String> listOfDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  void selectDay(String day) {
    selectedDay.value = day;
  }

  void selectSlot(String slot) {
    selectedSlot.value = slot;
  }
}
