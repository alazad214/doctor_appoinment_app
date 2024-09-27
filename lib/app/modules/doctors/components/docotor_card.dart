import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    this.doctor,
    this.ontap,
    this.name,
    this.sector,
    this.experience,
    this.image,
  });

  final doctor;
  final VoidCallback? ontap;
  final name;
  final sector;
  final experience;
  final image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: defaultPadding / 4),
                Text(sector ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 12,
                    style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                const Text(
                  "Experience",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  experience ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            Image.asset(image, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
