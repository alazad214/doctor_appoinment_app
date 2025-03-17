import 'package:doctor_appointment/app/modules/article/views/article_card.dart';
import 'package:doctor_appointment/app/modules/home/components/drawer.dart';
import 'package:doctor_appointment/utils/app_icon.dart' show searchIcon;
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../search/views/search_screen.dart';
=======
import 'package:flutter_svg/svg.dart';
>>>>>>> 699577075ab69356602e4c01693a8ba4bb695b8d
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
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Aroggo Talk'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const SearchScreen()),
            icon: SvgPicture.asset(
              searchIcon,
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: SafeArea(
<<<<<<< HEAD
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
                        const BannerCard(),
                        const Categories(),
                        AvailableDoctors(),
                        const ArticleCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
=======
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
>>>>>>> 699577075ab69356602e4c01693a8ba4bb695b8d
        ),
      ),
    );
  }
}
