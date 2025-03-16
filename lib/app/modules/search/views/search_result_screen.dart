import 'package:doctor_appointment/app/modules/home/components/available_doctors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../logic/model/doctor_model.dart';
import '../../../logic/service/doctor_service.dart';
import '../../details/views/doctor_details_screen.dart';

class SearchResultScreen extends StatelessWidget {
  final String category;
  SearchResultScreen({super.key, required this.category});
  final firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "সকল $category",
            style: const TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        body: FutureBuilder(
            future: firestoreService.searchDoctorsByCategory(category),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        const Center(
                            child: Text("Don't found your search specialist")),
                        const Spacer(),
                        AvailableDoctors(),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ));
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      "   Your Search",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "  Specialist",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        DoctorModel doctor = snapshot.data![index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => DoctorDetailsScreen(doctor: doctor));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(0, 1)),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Doctor image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(doctor.image,
                                      width: 80,
                                      height: 100,
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctor.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(doctor.category,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text.rich(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                TextSpan(
                                                  text: "Experience: ",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: textColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "${doctor.experience} years",
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text.rich(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                TextSpan(
                                                  text: "Clinic/Hospital: ",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: textColor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                    TextSpan(
                                                      text: doctor.institute,
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              }
            }));
  }
}
