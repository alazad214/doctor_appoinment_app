import 'package:doctor_appointment/app/modules/doctors/views/doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/AvailableDoctor.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/rating.dart';
import '../../../../widgets/section_title.dart';
import '../../details/views/doctor_details_screen.dart';

class AvailableDoctors extends StatelessWidget {
  const AvailableDoctors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 5, right: 15, left: 15),
          child: SectionTitle(
            title: "Available Doctor",
            pressOnSeeAll: () {
              Get.to(() => const DoctorsScreen());
            },
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              dummyAvailableDoctor.length,
              (index) => Padding(
                  padding: const EdgeInsets.only(left: defaultPadding),
                  child: FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const DoctorDetailsScreen());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(defaultPadding),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dummyAvailableDoctor[index]['name'],
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  dummyAvailableDoctor[index]['name'],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: defaultPadding / 2),
                                  child: Rating(score: 5),
                                ),
                                const SizedBox(height: defaultPadding / 2),
                                Text(
                                  "Experience",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  "${dummyAvailableDoctor[index]['experience']}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: defaultPadding / 2),
                                Text(
                                  "Patients",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  dummyAvailableDoctor[index]['patients'],
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            Image.asset(
                              dummyAvailableDoctor[index]['image'],
                              height: 120,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
