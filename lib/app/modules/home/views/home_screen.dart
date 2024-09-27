import 'package:doctor_appointment/app/modules/article/views/article_card.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../components/available_doctors.dart';
import '../components/categories.dart';
import '../components/suggest_doctor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                text: "Hello Azad,",
                title: "Find Specialist",
              ),

              ///Suggest Doctor...
              SuggestDoctor(),

              ///Category...
              Categories(),

              ///Available Doctor...
              AvailableDoctors(),

              ///Heath Article and Tips...
              ArticleCard()
            ],
          ),
        ),
      ),
    );
  }
}
