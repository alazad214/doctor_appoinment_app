import 'package:doctor_appointment/app/modules/article/views/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_image.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../components/available_doctors.dart';
import '../../category/components/categories.dart';
import '../components/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              AppImage.appBg,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(),

                  ///Suggest Doctor...
                  const BannerCard(),

                  ///Category...
                  const Categories(),

                  ///Available Doctor...
                  AvailableDoctors(),

                  ///Heath Article and Tips...
                  const ArticleCard()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
