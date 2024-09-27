import 'package:flutter/material.dart';
import '../../../../models/dummySuggestData.dart';
import 'suggest_doctor_card.dart';

class SuggestDoctor extends StatelessWidget {
  const SuggestDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85, initialPage: 3),
        itemCount: dummySuggestDoctor.length,
        itemBuilder: (context, index) => RecommendDoctorCard(
          doctor: dummySuggestDoctor[index],
        ),
      ),
    );
  }
}
